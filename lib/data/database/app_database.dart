import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import '../../core/catalog/catalog_categories.dart';
import '../storage_directory.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    BusinessProfiles,
    AppSettings,
    Clients,
    CatalogItems,
    Quotations,
    QuotationLines,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_open());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      await migrator.createAll();
    },
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await customStatement(
          "UPDATE catalog_items SET category = 'general' WHERE category IS NULL OR trim(category) = ''",
        );
        for (final entry in catalogCategoryAliases.entries) {
          await customStatement(
            'UPDATE catalog_items SET category = ? WHERE lower(trim(category)) = ?',
            [entry.value, entry.key],
          );
        }
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}

QueryExecutor _open() {
  return LazyDatabase(() async {
    final dir = await appStorageDirectory();
    final file = File(p.join(dir.path, 'cotizapro.sqlite'));
    return NativeDatabase.createInBackground(
      file,
      setup: (db) {
        db.execute('PRAGMA foreign_keys = ON');
        db.execute('PRAGMA journal_mode = WAL');
      },
    );
  });
}
