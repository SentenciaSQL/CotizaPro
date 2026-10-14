import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;

import '../../core/constants/limits.dart';
import '../../core/errors/app_exceptions.dart';
import '../../features/quotations/quote_models.dart';
import '../database/app_database.dart';
import '../storage_directory.dart';

class QuotationRepository {
  QuotationRepository(this._db);

  final AppDatabase _db;

  Stream<List<Quotation>> watchAll() {
    return (_db.select(
      _db.quotations,
    )..orderBy([(row) => OrderingTerm.desc(row.updatedAt)])).watch();
  }

  Stream<List<Quotation>> watchByClient(int clientId) {
    return (_db.select(_db.quotations)
          ..where((row) => row.clientId.equals(clientId))
          ..orderBy([(row) => OrderingTerm.desc(row.issueDate)]))
        .watch();
  }

  Future<Quotation?> getById(int id) {
    return (_db.select(
      _db.quotations,
    )..where((row) => row.id.equals(id))).getSingleOrNull();
  }

  Future<List<QuotationLine>> linesFor(int quotationId) {
    return (_db.select(_db.quotationLines)
          ..where((row) => row.quotationId.equals(quotationId))
          ..orderBy([(row) => OrderingTerm.asc(row.position)]))
        .get();
  }

  Future<int> count() async {
    final amount = _db.quotations.id.count();
    final query = _db.selectOnly(_db.quotations)..addColumns([amount]);
    final row = await query.getSingle();
    return row.read(amount) ?? 0;
  }

  Future<int> save({
    required QuoteDraft draft,
    required BusinessProfile profile,
    required bool isPro,
    required QuoteStatus status,
  }) {
    return _db.transaction(() async {
      final totals = draft.totals;
      final now = DateTime.now();
      final number = await _resolveNumber(draft);
      await _ensureUniqueNumber(number, exceptId: draft.id);

      final companion = QuotationsCompanion(
        number: Value(number),
        status: Value(status.name),
        clientId: Value(draft.clientId),
        clientName: Value(draft.clientName.trim()),
        clientCompany: Value(_blank(draft.clientCompany)),
        clientEmail: Value(_blank(draft.clientEmail)),
        clientPhone: Value(_blank(draft.clientPhone)),
        clientAddress: Value(_blank(draft.clientAddress)),
        clientTaxId: Value(_blank(draft.clientTaxId)),
        issueDate: Value(dateOnly(draft.issueDate)),
        validUntil: Value(dateOnly(draft.validUntil)),
        currencyCode: Value(draft.currencyCode),
        notes: Value(draft.notes.trim()),
        terms: Value(draft.terms.trim()),
        discountMode: Value(draft.discountMode.name),
        discountBps: Value(draft.discountBps),
        discountFixedMinor: Value(draft.discountFixedMinor),
        taxRateBps: Value(draft.taxRateBps),
        feeLabel: Value(draft.feeLabel.trim()),
        feeMinor: Value(draft.feeMinor),
        subtotalMinor: Value(totals.subtotalMinor),
        discountMinor: Value(totals.discountMinor),
        taxMinor: Value(totals.taxMinor),
        totalMinor: Value(totals.totalMinor),
        businessName: Value(profile.businessName),
        businessOwner: Value(profile.ownerName),
        businessTaxId: Value(profile.taxId),
        businessEmail: Value(profile.email),
        businessPhone: Value(profile.phone),
        businessAddress: Value(composeBusinessAddress(profile)),
        businessWebsite: Value(profile.website),
        businessTagline: Value(profile.tagline),
        businessFooter: Value(profile.pdfFooter),
        updatedAt: Value(now),
      );

      late final int id;
      if (draft.id == null) {
        if (!isPro && await count() >= freeQuoteLimit) {
          throw const QuoteLimitException();
        }
        id = await _db
            .into(_db.quotations)
            .insert(companion.copyWith(createdAt: Value(now)));
      } else {
        id = draft.id!;
        await (_db.update(
          _db.quotations,
        )..where((row) => row.id.equals(id))).write(companion);
        await (_db.delete(
          _db.quotationLines,
        )..where((row) => row.quotationId.equals(id))).go();
      }

      final logo = await _snapshotLogo(id, profile.logoPath);
      await (_db.update(_db.quotations)..where((row) => row.id.equals(id)))
          .write(QuotationsCompanion(logoSnapshotPath: Value(logo)));

      var position = 0;
      for (final line in draft.lines) {
        await _db
            .into(_db.quotationLines)
            .insert(
              QuotationLinesCompanion.insert(
                quotationId: id,
                position: position,
                catalogItemId: Value(line.catalogItemId),
                name: line.name.trim(),
                description: Value(_blank(line.description)),
                unit: line.unit,
                kind: line.kind,
                quantityMilli: line.quantityMilli,
                unitPriceMinor: line.unitPriceMinor,
                lineTotalMinor: line.lineTotal,
              ),
            );
        position += 1;
      }
      return id;
    });
  }

  Future<void> updateStatus(int id, QuoteStatus status) {
    return (_db.update(
      _db.quotations,
    )..where((row) => row.id.equals(id))).write(
      QuotationsCompanion(
        status: Value(status.name),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteQuote(int id) async {
    final quote = await getById(id);
    await (_db.delete(_db.quotations)..where((row) => row.id.equals(id))).go();
    final logo = quote?.logoSnapshotPath;
    if (logo != null) {
      final file = File(logo);
      if (await file.exists()) {
        await file.parent.delete(recursive: true);
      }
    }
  }

  Future<int> duplicate({
    required int id,
    required BusinessProfile profile,
    required bool isPro,
  }) async {
    final quote = await getById(id);
    if (quote == null) throw StateError('missing-quote');
    final lines = await linesFor(id);
    final source = draftFromStored(quote, lines);
    final today = dateOnly(DateTime.now());
    final span = dateOnly(quote.validUntil)
        .difference(dateOnly(quote.issueDate))
        .inDays;
    final draft = source.copyWith(
      clearId: true,
      number: '',
      issueDate: today,
      validUntil: today.add(
        Duration(days: span < 0 ? profile.defaultValidityDays : span),
      ),
      status: QuoteStatus.draft,
      lines: [
        for (var i = 0; i < source.lines.length; i++)
          QuoteLineDraft(
            key: i + 1,
            catalogItemId: source.lines[i].catalogItemId,
            name: source.lines[i].name,
            description: source.lines[i].description,
            unit: source.lines[i].unit,
            kind: source.lines[i].kind,
            quantityMilli: source.lines[i].quantityMilli,
            unitPriceMinor: source.lines[i].unitPriceMinor,
          ),
      ],
    );
    return save(
      draft: draft,
      profile: profile,
      isPro: isPro,
      status: QuoteStatus.draft,
    );
  }

  Future<String> _resolveNumber(QuoteDraft draft) async {
    final requested = draft.number.trim();
    if (draft.id != null) {
      if (requested.isEmpty) throw const ValidationException('number');
      return requested;
    }
    final profile = await (_db.select(
      _db.businessProfiles,
    )..where((row) => row.id.equals(1))).getSingle();
    final automatic = formatQuoteNumber(
      profile.quotePrefix,
      profile.nextQuoteNumber,
    );
    if (requested.isEmpty || requested == automatic) {
      await (_db.update(
        _db.businessProfiles,
      )..where((row) => row.id.equals(1))).write(
        BusinessProfilesCompanion(
          nextQuoteNumber: Value(profile.nextQuoteNumber + 1),
          updatedAt: Value(DateTime.now()),
        ),
      );
      return automatic;
    }
    return requested;
  }

  Future<void> _ensureUniqueNumber(String number, {int? exceptId}) async {
    final existing = await (_db.select(
      _db.quotations,
    )..where((row) => row.number.equals(number))).getSingleOrNull();
    if (existing != null && existing.id != exceptId) {
      throw const DuplicateQuoteNumberException();
    }
  }

  Future<String?> _snapshotLogo(int quoteId, String? sourcePath) async {
    if (sourcePath == null || sourcePath.isEmpty) return null;
    final source = File(sourcePath);
    if (!await source.exists()) return null;
    final dir = await appStorageDirectory();
    final ext = p.extension(sourcePath).toLowerCase();
    final safeExt = {'.png', '.jpg', '.jpeg', '.webp'}.contains(ext)
        ? ext
        : '.png';
    final dest = File(p.join(dir.path, 'quotes', '$quoteId', 'logo$safeExt'));
    await dest.parent.create(recursive: true);
    if (p.normalize(source.path) != p.normalize(dest.path)) {
      await source.copy(dest.path);
    }
    return dest.path;
  }
}

String? _blank(String? value) {
  final trimmed = value?.trim() ?? '';
  return trimmed.isEmpty ? null : trimmed;
}
