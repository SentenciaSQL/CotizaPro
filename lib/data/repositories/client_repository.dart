import 'package:drift/drift.dart';

import '../../core/constants/limits.dart';
import '../../core/errors/app_exceptions.dart';
import '../database/app_database.dart';

class ClientRepository {
  ClientRepository(this._db);

  final AppDatabase _db;

  Stream<List<Client>> watchAll() {
    return (_db.select(
      _db.clients,
    )..orderBy([(row) => OrderingTerm.asc(row.name)])).watch();
  }

  Future<Client?> getById(int id) {
    return (_db.select(
      _db.clients,
    )..where((row) => row.id.equals(id))).getSingleOrNull();
  }

  Future<int> count() async {
    final amount = _db.clients.id.count();
    final query = _db.selectOnly(_db.clients)..addColumns([amount]);
    final row = await query.getSingle();
    return row.read(amount) ?? 0;
  }

  Future<int> create({
    required String name,
    String? company,
    String? email,
    String? phone,
    String? address,
    String? taxId,
    String? notes,
    required bool isPro,
  }) async {
    if (!isPro && await count() >= freeClientLimit) {
      throw const ClientLimitException();
    }
    final now = DateTime.now();
    return _db
        .into(_db.clients)
        .insert(
          ClientsCompanion.insert(
            name: name.trim(),
            company: Value(_emptyToNull(company)),
            email: Value(_emptyToNull(email)),
            phone: Value(_emptyToNull(phone)),
            address: Value(_emptyToNull(address)),
            taxId: Value(_emptyToNull(taxId)),
            notes: Value(_emptyToNull(notes)),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  Future<void> updateClient({
    required int id,
    required String name,
    String? company,
    String? email,
    String? phone,
    String? address,
    String? taxId,
    String? notes,
  }) {
    return (_db.update(_db.clients)..where((row) => row.id.equals(id))).write(
      ClientsCompanion(
        name: Value(name.trim()),
        company: Value(_emptyToNull(company)),
        email: Value(_emptyToNull(email)),
        phone: Value(_emptyToNull(phone)),
        address: Value(_emptyToNull(address)),
        taxId: Value(_emptyToNull(taxId)),
        notes: Value(_emptyToNull(notes)),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteClient(int id) {
    return (_db.delete(_db.clients)..where((row) => row.id.equals(id))).go();
  }
}

String? _emptyToNull(String? value) {
  final trimmed = value?.trim() ?? '';
  return trimmed.isEmpty ? null : trimmed;
}
