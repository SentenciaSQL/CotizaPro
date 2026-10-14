import 'package:drift/drift.dart';

import '../database/app_database.dart';

class SettingsRepository {
  SettingsRepository(this._db);

  final AppDatabase _db;

  Stream<AppSetting> watch() {
    return (_db.select(
      _db.appSettings,
    )..where((row) => row.id.equals(1))).watchSingle();
  }

  Future<AppSetting> get() {
    return (_db.select(
      _db.appSettings,
    )..where((row) => row.id.equals(1))).getSingle();
  }

  Future<void> ensureDefaults() async {
    final existing = await (_db.select(
      _db.appSettings,
    )..where((row) => row.id.equals(1))).getSingleOrNull();
    if (existing != null) return;
    await _db
        .into(_db.appSettings)
        .insert(
          AppSettingsCompanion.insert(
            id: const Value(1),
            updatedAt: DateTime.now(),
          ),
        );
  }

  Future<void> save(AppSettingsCompanion companion) {
    return (_db.update(_db.appSettings)..where((row) => row.id.equals(1)))
        .write(companion.copyWith(updatedAt: Value(DateTime.now())));
  }

  Future<void> unlockPro({
    required String productId,
    required String? transactionId,
  }) {
    return save(
      AppSettingsCompanion(
        isPro: const Value(true),
        proProductId: Value(productId),
        proTransactionId: Value(transactionId),
        proUnlockedAt: Value(DateTime.now()),
      ),
    );
  }
}
