import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;

import '../../core/money/money.dart';
import '../database/app_database.dart';
import '../storage_directory.dart';

class ProfileRepository {
  ProfileRepository(this._db);

  final AppDatabase _db;

  Stream<BusinessProfile> watch() {
    return (_db.select(
      _db.businessProfiles,
    )..where((row) => row.id.equals(1))).watchSingle();
  }

  Future<BusinessProfile> get() {
    return (_db.select(
      _db.businessProfiles,
    )..where((row) => row.id.equals(1))).getSingle();
  }

  Future<void> ensureDefaults() async {
    final existing = await (_db.select(
      _db.businessProfiles,
    )..where((row) => row.id.equals(1))).getSingleOrNull();
    if (existing != null) return;
    final country =
        WidgetsBinding.instance.platformDispatcher.locale.countryCode;
    await _db
        .into(_db.businessProfiles)
        .insert(
          BusinessProfilesCompanion.insert(
            id: const Value(1),
            currencyCode: Value(currencyForCountry(country)),
            updatedAt: DateTime.now(),
          ),
        );
  }

  Future<void> save(BusinessProfilesCompanion companion) {
    return (_db.update(_db.businessProfiles)..where((row) => row.id.equals(1)))
        .write(companion.copyWith(updatedAt: Value(DateTime.now())));
  }

  Future<String?> importLogo(String sourcePath) async {
    final source = File(sourcePath);
    if (!await source.exists()) return null;
    final length = await source.length();
    if (length > 2 * 1024 * 1024) {
      throw const FileSystemException('logo-too-large');
    }
    final dir = await appStorageDirectory();
    final ext = p.extension(sourcePath).toLowerCase();
    final safeExt = {'.png', '.jpg', '.jpeg', '.webp'}.contains(ext)
        ? ext
        : '.png';
    final dest = File(p.join(dir.path, 'branding', 'logo$safeExt'));
    await dest.parent.create(recursive: true);
    if (p.normalize(source.path) != p.normalize(dest.path)) {
      await source.copy(dest.path);
    }
    await save(BusinessProfilesCompanion(logoPath: Value(dest.path)));
    return dest.path;
  }

  Future<void> clearLogo() async {
    final profile = await get();
    final path = profile.logoPath;
    if (path != null) {
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    }
    await save(const BusinessProfilesCompanion(logoPath: Value(null)));
  }
}
