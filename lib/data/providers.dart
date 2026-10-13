import 'package:cotizapro/data/database/app_database.dart';
import 'package:cotizapro/data/repositories/backup_repository.dart';
import 'package:cotizapro/data/repositories/catalog_repository.dart';
import 'package:cotizapro/data/repositories/client_repository.dart';
import 'package:cotizapro/data/repositories/profile_repository.dart';
import 'package:cotizapro/data/repositories/quotation_repository.dart';
import 'package:cotizapro/data/repositories/settings_repository.dart';
import 'package:cotizapro/features/pro/billing_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  throw StateError('AppDatabase must be overridden at startup');
});

final billingControllerProvider = Provider<BillingController>((ref) {
  throw StateError('BillingController must be overridden at startup');
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref.watch(databaseProvider));
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository(ref.watch(databaseProvider));
});

final clientRepositoryProvider = Provider<ClientRepository>((ref) {
  return ClientRepository(ref.watch(databaseProvider));
});

final catalogRepositoryProvider = Provider<CatalogRepository>((ref) {
  return CatalogRepository(ref.watch(databaseProvider));
});

final quotationRepositoryProvider = Provider<QuotationRepository>((ref) {
  return QuotationRepository(ref.watch(databaseProvider));
});

final backupRepositoryProvider = Provider<BackupRepository>((ref) {
  return BackupRepository(ref.watch(databaseProvider));
});

final profileProvider = StreamProvider<BusinessProfile>((ref) {
  return ref.watch(profileRepositoryProvider).watch();
});

final settingsProvider = StreamProvider<AppSetting>((ref) {
  return ref.watch(settingsRepositoryProvider).watch();
});

final clientsProvider = StreamProvider<List<Client>>((ref) {
  return ref.watch(clientRepositoryProvider).watchAll();
});

final catalogProvider = StreamProvider<List<CatalogItem>>((ref) {
  return ref.watch(catalogRepositoryProvider).watchAll();
});

final quotesProvider = StreamProvider<List<Quotation>>((ref) {
  return ref.watch(quotationRepositoryProvider).watchAll();
});

final clientQuotesProvider = StreamProvider.family<List<Quotation>, int>((
  ref,
  clientId,
) {
  return ref.watch(quotationRepositoryProvider).watchByClient(clientId);
});

final quoteLinesProvider = FutureProvider.family<List<QuotationLine>, int>((
  ref,
  quotationId,
) {
  return ref.watch(quotationRepositoryProvider).linesFor(quotationId);
});

final billingStateProvider = StreamProvider<BillingState>((ref) async* {
  final controller = ref.watch(billingControllerProvider);
  yield controller.state;
  yield* controller.changes;
});
