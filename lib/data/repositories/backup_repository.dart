import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../core/errors/app_exceptions.dart';
import '../database/app_database.dart';
import '../storage_directory.dart';

class BackupRepository {
  BackupRepository(this._db);

  final AppDatabase _db;
  static const formatVersion = 1;
  static const maxLogoBytes = 2 * 1024 * 1024;

  Future<File> exportToFile() async {
    final payload = await _exportMap();
    final dir = await getTemporaryDirectory();
    final stamp = DateTime.now().toIso8601String().replaceAll(':', '-');
    final file = File(p.join(dir.path, 'cotizapro-backup-$stamp.json'));
    await file.writeAsString(
      const JsonEncoder.withIndent('  ').convert(payload),
    );
    return file;
  }

  Future<void> importFromFile(File file) async {
    final raw = jsonDecode(await file.readAsString());
    if (raw is! Map) throw const BackupFormatException();
    final map = raw.cast<String, Object?>();
    if (map['format'] != formatVersion || map['app'] != 'cotizapro') {
      throw const BackupFormatException();
    }
    final profile = _map(map['profile']);
    final preferences = _map(map['preferences']);
    final clients = _list(map['clients']);
    final catalog = _list(map['catalog']);
    final quotations = _list(map['quotations']);

    final profileLogo = await _decodeLogo(profile['logo']);
    final quoteLogos = <int, _LogoPayload>{};
    for (final quote in quotations) {
      final id = _reqInt(quote, 'id');
      final logo = await _decodeLogo(quote['logo']);
      if (logo != null) quoteLogos[id] = logo;
    }

    final docs = await appStorageDirectory();
    await _db.transaction(() async {
      await _db.delete(_db.quotationLines).go();
      await _db.delete(_db.quotations).go();
      await _db.delete(_db.catalogItems).go();
      await _db.delete(_db.clients).go();

      for (final client in clients) {
        await _db
            .into(_db.clients)
            .insert(
              ClientsCompanion.insert(
                id: Value(_reqInt(client, 'id')),
                name: _reqString(client, 'name'),
                company: Value(_optString(client, 'company')),
                email: Value(_optString(client, 'email')),
                phone: Value(_optString(client, 'phone')),
                address: Value(_optString(client, 'address')),
                taxId: Value(_optString(client, 'taxId')),
                notes: Value(_optString(client, 'notes')),
                createdAt: _reqDate(client, 'createdAt'),
                updatedAt: _reqDate(client, 'updatedAt'),
              ),
            );
      }

      for (final item in catalog) {
        await _db
            .into(_db.catalogItems)
            .insert(
              CatalogItemsCompanion.insert(
                id: Value(_reqInt(item, 'id')),
                name: _reqString(item, 'name'),
                description: Value(_optString(item, 'description')),
                category: Value(_optString(item, 'category') ?? ''),
                unit: Value(_reqString(item, 'unit')),
                unitPriceMinor: _reqInt(item, 'unitPriceMinor'),
                kind: _reqString(item, 'kind'),
                createdAt: _reqDate(item, 'createdAt'),
                updatedAt: _reqDate(item, 'updatedAt'),
              ),
            );
      }

      for (final quote in quotations) {
        final id = _reqInt(quote, 'id');
        final logo = quoteLogos[id];
        await _db
            .into(_db.quotations)
            .insert(
              QuotationsCompanion.insert(
                id: Value(id),
                number: _reqString(quote, 'number'),
                status: _reqString(quote, 'status'),
                clientId: Value(_optInt(quote, 'clientId')),
                clientName: _reqString(quote, 'clientName'),
                clientCompany: Value(_optString(quote, 'clientCompany')),
                clientEmail: Value(_optString(quote, 'clientEmail')),
                clientPhone: Value(_optString(quote, 'clientPhone')),
                clientAddress: Value(_optString(quote, 'clientAddress')),
                clientTaxId: Value(_optString(quote, 'clientTaxId')),
                issueDate: _reqDate(quote, 'issueDate'),
                validUntil: _reqDate(quote, 'validUntil'),
                currencyCode: _reqString(quote, 'currencyCode'),
                notes: Value(_optString(quote, 'notes') ?? ''),
                terms: Value(_optString(quote, 'terms') ?? ''),
                discountMode: Value(_reqString(quote, 'discountMode')),
                discountBps: Value(_reqInt(quote, 'discountBps')),
                discountFixedMinor: Value(_reqInt(quote, 'discountFixedMinor')),
                taxRateBps: Value(_reqInt(quote, 'taxRateBps')),
                feeLabel: Value(_optString(quote, 'feeLabel') ?? ''),
                feeMinor: Value(_reqInt(quote, 'feeMinor')),
                subtotalMinor: _reqInt(quote, 'subtotalMinor'),
                discountMinor: _reqInt(quote, 'discountMinor'),
                taxMinor: _reqInt(quote, 'taxMinor'),
                totalMinor: _reqInt(quote, 'totalMinor'),
                businessName: Value(_optString(quote, 'businessName') ?? ''),
                businessOwner: Value(_optString(quote, 'businessOwner') ?? ''),
                businessTaxId: Value(_optString(quote, 'businessTaxId')),
                businessEmail: Value(_optString(quote, 'businessEmail')),
                businessPhone: Value(_optString(quote, 'businessPhone')),
                businessAddress: Value(_optString(quote, 'businessAddress')),
                businessWebsite: Value(_optString(quote, 'businessWebsite')),
                businessTagline: Value(
                  _optString(quote, 'businessTagline') ?? '',
                ),
                businessFooter: Value(
                  _optString(quote, 'businessFooter') ?? '',
                ),
                logoSnapshotPath: Value(
                  logo == null
                      ? null
                      : p.join(
                          docs.path,
                          'quotes',
                          '$id',
                          'logo.${logo.extension}',
                        ),
                ),
                createdAt: _reqDate(quote, 'createdAt'),
                updatedAt: _reqDate(quote, 'updatedAt'),
              ),
            );
        final lines = _list(quote['lines']);
        for (final line in lines) {
          await _db
              .into(_db.quotationLines)
              .insert(
                QuotationLinesCompanion.insert(
                  id: Value(_reqInt(line, 'id')),
                  quotationId: id,
                  position: _reqInt(line, 'position'),
                  catalogItemId: Value(_optInt(line, 'catalogItemId')),
                  name: _reqString(line, 'name'),
                  description: Value(_optString(line, 'description')),
                  unit: _reqString(line, 'unit'),
                  kind: _reqString(line, 'kind'),
                  quantityMilli: _reqInt(line, 'quantityMilli'),
                  unitPriceMinor: _reqInt(line, 'unitPriceMinor'),
                  lineTotalMinor: _reqInt(line, 'lineTotalMinor'),
                ),
              );
        }
      }

      await (_db.update(
        _db.businessProfiles,
      )..where((row) => row.id.equals(1))).write(
        BusinessProfilesCompanion(
          businessName: Value(_optString(profile, 'businessName') ?? ''),
          ownerName: Value(_optString(profile, 'ownerName') ?? ''),
          taxId: Value(_optString(profile, 'taxId')),
          email: Value(_optString(profile, 'email')),
          phone: Value(_optString(profile, 'phone')),
          website: Value(_optString(profile, 'website')),
          addressLine: Value(_optString(profile, 'addressLine')),
          city: Value(_optString(profile, 'city')),
          region: Value(_optString(profile, 'region')),
          postalCode: Value(_optString(profile, 'postalCode')),
          country: Value(_optString(profile, 'country')),
          logoPath: Value(
            profileLogo == null
                ? null
                : p.join(
                    docs.path,
                    'branding',
                    'logo.${profileLogo.extension}',
                  ),
          ),
          currencyCode: Value(_optString(profile, 'currencyCode') ?? 'USD'),
          quotePrefix: Value(_optString(profile, 'quotePrefix') ?? 'COT-'),
          nextQuoteNumber: Value(_reqInt(profile, 'nextQuoteNumber')),
          defaultTaxBps: Value(_reqInt(profile, 'defaultTaxBps')),
          defaultValidityDays: Value(_reqInt(profile, 'defaultValidityDays')),
          defaultNotes: Value(_optString(profile, 'defaultNotes') ?? ''),
          defaultTerms: Value(_optString(profile, 'defaultTerms') ?? ''),
          pdfFooter: Value(_optString(profile, 'pdfFooter') ?? ''),
          tagline: Value(_optString(profile, 'tagline') ?? ''),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await (_db.update(
        _db.appSettings,
      )..where((row) => row.id.equals(1))).write(
        AppSettingsCompanion(
          themeMode: Value(_optString(preferences, 'themeMode') ?? 'system'),
          localeCode: Value(_optString(preferences, 'localeCode') ?? ''),
          pdfShowNotes: Value(
            _reqBool(preferences, 'pdfShowNotes', fallback: true),
          ),
          pdfShowTerms: Value(
            _reqBool(preferences, 'pdfShowTerms', fallback: true),
          ),
          pdfShowLogo: Value(
            _reqBool(preferences, 'pdfShowLogo', fallback: true),
          ),
          pdfHideBranding: Value(
            _reqBool(preferences, 'pdfHideBranding', fallback: false),
          ),
          pdfShowSignature: Value(
            _reqBool(preferences, 'pdfShowSignature', fallback: false),
          ),
          pdfShowTagline: Value(
            _reqBool(preferences, 'pdfShowTagline', fallback: true),
          ),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await _resetSequence('clients');
      await _resetSequence('catalog_items');
      await _resetSequence('quotations');
      await _resetSequence('quotation_lines');
    });

    if (profileLogo != null) {
      final dest = File(
        p.join(docs.path, 'branding', 'logo.${profileLogo.extension}'),
      );
      await dest.parent.create(recursive: true);
      await dest.writeAsBytes(profileLogo.bytes, flush: true);
    }
    for (final entry in quoteLogos.entries) {
      final dest = File(
        p.join(
          docs.path,
          'quotes',
          '${entry.key}',
          'logo.${entry.value.extension}',
        ),
      );
      await dest.parent.create(recursive: true);
      await dest.writeAsBytes(entry.value.bytes, flush: true);
    }
  }

  Future<Map<String, Object?>> _exportMap() async {
    final profile = await (_db.select(
      _db.businessProfiles,
    )..where((row) => row.id.equals(1))).getSingle();
    final settings = await (_db.select(
      _db.appSettings,
    )..where((row) => row.id.equals(1))).getSingle();
    final clients = await _db.select(_db.clients).get();
    final catalog = await _db.select(_db.catalogItems).get();
    final quotes = await _db.select(_db.quotations).get();
    final lines = await _db.select(_db.quotationLines).get();
    final linesByQuote = <int, List<QuotationLine>>{};
    for (final line in lines) {
      linesByQuote.putIfAbsent(line.quotationId, () => []).add(line);
    }

    return {
      'format': formatVersion,
      'app': 'cotizapro',
      'exportedAt': DateTime.now().toUtc().toIso8601String(),
      'profile': {
        'businessName': profile.businessName,
        'ownerName': profile.ownerName,
        'taxId': profile.taxId,
        'email': profile.email,
        'phone': profile.phone,
        'website': profile.website,
        'addressLine': profile.addressLine,
        'city': profile.city,
        'region': profile.region,
        'postalCode': profile.postalCode,
        'country': profile.country,
        'logo': await _encodeLogo(profile.logoPath),
        'currencyCode': profile.currencyCode,
        'quotePrefix': profile.quotePrefix,
        'nextQuoteNumber': profile.nextQuoteNumber,
        'defaultTaxBps': profile.defaultTaxBps,
        'defaultValidityDays': profile.defaultValidityDays,
        'defaultNotes': profile.defaultNotes,
        'defaultTerms': profile.defaultTerms,
        'pdfFooter': profile.pdfFooter,
        'tagline': profile.tagline,
      },
      'preferences': {
        'themeMode': settings.themeMode,
        'localeCode': settings.localeCode,
        'pdfShowNotes': settings.pdfShowNotes,
        'pdfShowTerms': settings.pdfShowTerms,
        'pdfShowLogo': settings.pdfShowLogo,
        'pdfHideBranding': settings.pdfHideBranding,
        'pdfShowSignature': settings.pdfShowSignature,
        'pdfShowTagline': settings.pdfShowTagline,
      },
      'clients': [
        for (final client in clients)
          {
            'id': client.id,
            'name': client.name,
            'company': client.company,
            'email': client.email,
            'phone': client.phone,
            'address': client.address,
            'taxId': client.taxId,
            'notes': client.notes,
            'createdAt': client.createdAt.toUtc().toIso8601String(),
            'updatedAt': client.updatedAt.toUtc().toIso8601String(),
          },
      ],
      'catalog': [
        for (final item in catalog)
          {
            'id': item.id,
            'name': item.name,
            'description': item.description,
            'category': item.category,
            'unit': item.unit,
            'unitPriceMinor': item.unitPriceMinor,
            'kind': item.kind,
            'createdAt': item.createdAt.toUtc().toIso8601String(),
            'updatedAt': item.updatedAt.toUtc().toIso8601String(),
          },
      ],
      'quotations': [
        for (final quote in quotes)
          {
            'id': quote.id,
            'number': quote.number,
            'status': quote.status,
            'clientId': quote.clientId,
            'clientName': quote.clientName,
            'clientCompany': quote.clientCompany,
            'clientEmail': quote.clientEmail,
            'clientPhone': quote.clientPhone,
            'clientAddress': quote.clientAddress,
            'clientTaxId': quote.clientTaxId,
            'issueDate': quote.issueDate.toUtc().toIso8601String(),
            'validUntil': quote.validUntil.toUtc().toIso8601String(),
            'currencyCode': quote.currencyCode,
            'notes': quote.notes,
            'terms': quote.terms,
            'discountMode': quote.discountMode,
            'discountBps': quote.discountBps,
            'discountFixedMinor': quote.discountFixedMinor,
            'taxRateBps': quote.taxRateBps,
            'feeLabel': quote.feeLabel,
            'feeMinor': quote.feeMinor,
            'subtotalMinor': quote.subtotalMinor,
            'discountMinor': quote.discountMinor,
            'taxMinor': quote.taxMinor,
            'totalMinor': quote.totalMinor,
            'businessName': quote.businessName,
            'businessOwner': quote.businessOwner,
            'businessTaxId': quote.businessTaxId,
            'businessEmail': quote.businessEmail,
            'businessPhone': quote.businessPhone,
            'businessAddress': quote.businessAddress,
            'businessWebsite': quote.businessWebsite,
            'businessTagline': quote.businessTagline,
            'businessFooter': quote.businessFooter,
            'logo': await _encodeLogo(quote.logoSnapshotPath),
            'createdAt': quote.createdAt.toUtc().toIso8601String(),
            'updatedAt': quote.updatedAt.toUtc().toIso8601String(),
            'lines': [
              for (final line
                  in linesByQuote[quote.id] ?? const <QuotationLine>[])
                {
                  'id': line.id,
                  'position': line.position,
                  'catalogItemId': line.catalogItemId,
                  'name': line.name,
                  'description': line.description,
                  'unit': line.unit,
                  'kind': line.kind,
                  'quantityMilli': line.quantityMilli,
                  'unitPriceMinor': line.unitPriceMinor,
                  'lineTotalMinor': line.lineTotalMinor,
                },
            ],
          },
      ],
    };
  }

  Future<void> _resetSequence(String table) async {
    await _db.customStatement(
      "INSERT INTO sqlite_sequence(name, seq) "
      "VALUES('$table', (SELECT IFNULL(MAX(id), 0) FROM $table)) "
      "ON CONFLICT(name) DO UPDATE SET seq = excluded.seq",
    );
  }

  Future<Map<String, Object?>?> _encodeLogo(String? path) async {
    if (path == null || path.isEmpty) return null;
    final file = File(path);
    if (!await file.exists()) return null;
    final length = await file.length();
    if (length == 0 || length > maxLogoBytes) return null;
    final ext = p.extension(path).replaceFirst('.', '').toLowerCase();
    return {
      'extension': ext.isEmpty ? 'png' : ext,
      'base64': base64Encode(await file.readAsBytes()),
    };
  }

  Future<_LogoPayload?> _decodeLogo(Object? raw) async {
    if (raw == null) return null;
    final map = _map(raw);
    final ext = _reqString(map, 'extension').toLowerCase();
    if (!{'png', 'jpg', 'jpeg', 'webp'}.contains(ext)) {
      throw const BackupFormatException();
    }
    final encoded = _reqString(map, 'base64');
    final bytes = base64Decode(encoded);
    if (bytes.length > maxLogoBytes) throw const BackupFormatException();
    return _LogoPayload(ext, bytes);
  }
}

class _LogoPayload {
  const _LogoPayload(this.extension, this.bytes);
  final String extension;
  final List<int> bytes;
}

Map<String, Object?> _map(Object? value) {
  if (value is! Map) throw const BackupFormatException();
  return value.map((key, item) => MapEntry(key.toString(), item));
}

List<Map<String, Object?>> _list(Object? value) {
  if (value is! List) throw const BackupFormatException();
  return [for (final item in value) _map(item)];
}

int _reqInt(Map<String, Object?> map, String key) {
  final value = map[key];
  if (value is! int) throw const BackupFormatException();
  return value;
}

int? _optInt(Map<String, Object?> map, String key) {
  final value = map[key];
  if (value == null) return null;
  if (value is! int) throw const BackupFormatException();
  return value;
}

String _reqString(Map<String, Object?> map, String key) {
  final value = map[key];
  if (value is! String || value.trim().isEmpty) {
    throw const BackupFormatException();
  }
  return value;
}

String? _optString(Map<String, Object?> map, String key) {
  final value = map[key];
  if (value == null) return null;
  if (value is! String) throw const BackupFormatException();
  final trimmed = value.trim();
  return trimmed.isEmpty ? null : trimmed;
}

bool _reqBool(Map<String, Object?> map, String key, {required bool fallback}) {
  final value = map[key];
  if (value == null) return fallback;
  if (value is! bool) throw const BackupFormatException();
  return value;
}

DateTime _reqDate(Map<String, Object?> map, String key) {
  return DateTime.parse(_reqString(map, key));
}
