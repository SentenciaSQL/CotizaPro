import 'package:cotizapro/core/navigation/app_router.dart';
import 'package:cotizapro/core/theme/app_theme.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/features/ads/ad_banner.dart';
import 'package:cotizapro/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CotizaProApp extends ConsumerStatefulWidget {
  const CotizaProApp({super.key});

  @override
  ConsumerState<CotizaProApp> createState() => _CotizaProAppState();
}

class _CotizaProAppState extends ConsumerState<CotizaProApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AdsBootstrap.start();
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final router = ref.watch(routerProvider);
    return settings.when(
      loading: () => const _BootScreen(),
      error: (error, stack) => _BootScreen(message: error.toString()),
      data: (value) {
        final themeMode = switch (value.themeMode) {
          'light' => ThemeMode.light,
          'dark' => ThemeMode.dark,
          _ => ThemeMode.system,
        };
        final locale = switch (value.localeCode) {
          'es' => const Locale('es'),
          'en' => const Locale('en'),
          _ => null,
        };
        return MaterialApp.router(
          title: 'CotizaPro',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: themeMode,
          locale: locale,
          routerConfig: router,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (deviceLocale, supported) {
            if (locale != null) return locale;
            final language = deviceLocale?.languageCode;
            if (language == 'es' || language == 'en') {
              return Locale(language!);
            }
            return const Locale('es');
          },
        );
      },
    );
  }
}

class _BootScreen extends StatelessWidget {
  const _BootScreen({this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF0B1F3A),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/branding/mark_on_dark.png',
                width: 96,
                height: 96,
              ),
              const SizedBox(height: 16),
              const Text(
                'CotizaPro',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 18),
              if (message == null)
                const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.4,
                    color: Color(0xFF3DC4BE),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    message!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
