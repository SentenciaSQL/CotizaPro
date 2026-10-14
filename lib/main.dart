import 'package:cotizapro/app.dart';
import 'package:cotizapro/data/database/app_database.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/data/repositories/profile_repository.dart';
import 'package:cotizapro/data/repositories/settings_repository.dart';
import 'package:cotizapro/features/pro/billing_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = AppDatabase();
  final profiles = ProfileRepository(database);
  final settings = SettingsRepository(database);
  await profiles.ensureDefaults();
  await settings.ensureDefaults();
  final billing = BillingController(settings);
  await billing.start();
  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(database),
        billingControllerProvider.overrideWithValue(billing),
      ],
      child: const CotizaProApp(),
    ),
  );
}
