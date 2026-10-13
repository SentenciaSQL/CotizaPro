import 'package:drift/drift.dart';

import '../../core/constants/limits.dart';
import '../../core/errors/app_exceptions.dart';
import '../database/app_database.dart';

class CatalogRepository {
  CatalogRepository(this._db);

  final AppDatabase _db;

  Stream<List<CatalogItem>> watchAll() {
    return (_db.select(
      _db.catalogItems,
    )..orderBy([(row) => OrderingTerm.asc(row.name)])).watch();
  }

  Future<CatalogItem?> getById(int id) {
    return (_db.select(
      _db.catalogItems,
    )..where((row) => row.id.equals(id))).getSingleOrNull();
  }

  Future<int> count() async {
    final amount = _db.catalogItems.id.count();
    final query = _db.selectOnly(_db.catalogItems)..addColumns([amount]);
    final row = await query.getSingle();
    return row.read(amount) ?? 0;
  }

  Future<int> create({
    required String name,
    String? description,
    String? category,
    required String unit,
    required int unitPriceMinor,
    required String kind,
    required bool isPro,
  }) async {
    if (!isPro && await count() >= freeCatalogLimit) {
      throw const CatalogLimitException();
    }
    final now = DateTime.now();
    return _db
        .into(_db.catalogItems)
        .insert(
          CatalogItemsCompanion.insert(
            name: name.trim(),
            description: Value(_blank(description)),
            category: Value(category?.trim() ?? ''),
            unit: Value(unit),
            unitPriceMinor: unitPriceMinor,
            kind: kind,
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  Future<void> updateItem({
    required int id,
    required String name,
    String? description,
    String? category,
    required String unit,
    required int unitPriceMinor,
    required String kind,
  }) {
    return (_db.update(
      _db.catalogItems,
    )..where((row) => row.id.equals(id))).write(
      CatalogItemsCompanion(
        name: Value(name.trim()),
        description: Value(_blank(description)),
        category: Value(category?.trim() ?? ''),
        unit: Value(unit),
        unitPriceMinor: Value(unitPriceMinor),
        kind: Value(kind),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteItem(int id) {
    return (_db.delete(
      _db.catalogItems,
    )..where((row) => row.id.equals(id))).go();
  }
}

String? _blank(String? value) {
  final trimmed = value?.trim() ?? '';
  return trimmed.isEmpty ? null : trimmed;
}
