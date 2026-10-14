import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/features/backup/backup_screen.dart';
import 'package:cotizapro/features/business_profile/business_profile_screen.dart';
import 'package:cotizapro/features/clients/client_detail_screen.dart';
import 'package:cotizapro/features/clients/client_form_screen.dart';
import 'package:cotizapro/features/clients/client_list_screen.dart';
import 'package:cotizapro/features/dashboard/dashboard_screen.dart';
import 'package:cotizapro/features/pdf/pdf_preview_screen.dart';
import 'package:cotizapro/features/pro/pro_screen.dart';
import 'package:cotizapro/features/quotations/quotation_detail_screen.dart';
import 'package:cotizapro/features/quotations/quotation_editor_screen.dart';
import 'package:cotizapro/features/quotations/quotation_list_screen.dart';
import 'package:cotizapro/features/quotations/quote_models.dart';
import 'package:cotizapro/features/services_catalog/catalog_form_screen.dart';
import 'package:cotizapro/features/services_catalog/catalog_list_screen.dart';
import 'package:cotizapro/features/settings/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(shell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const DashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/quotations',
                builder: (context, state) => const QuotationListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/clients',
                builder: (context, state) => const ClientListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/catalog',
                builder: (context, state) => const CatalogListScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/quote/new',
        pageBuilder: (context, state) =>
            _page(state, const QuotationEditorScreen()),
      ),
      GoRoute(
        path: '/quote/preview',
        pageBuilder: (context, state) {
          final document = state.extra is QuoteDocument
              ? state.extra! as QuoteDocument
              : null;
          return _page(state, PdfPreviewScreen(document: document));
        },
      ),
      GoRoute(
        path: '/quote/:id',
        pageBuilder: (context, state) => _page(
          state,
          QuotationDetailScreen(id: int.parse(state.pathParameters['id']!)),
        ),
        routes: [
          GoRoute(
            path: 'edit',
            pageBuilder: (context, state) => _page(
              state,
              QuotationEditorScreen(
                quotationId: int.parse(state.pathParameters['id']!),
              ),
            ),
          ),
          GoRoute(
            path: 'pdf',
            pageBuilder: (context, state) => _page(
              state,
              PdfPreviewScreen(
                quotationId: int.parse(state.pathParameters['id']!),
              ),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/client/new',
        pageBuilder: (context, state) => _page(state, const ClientFormScreen()),
      ),
      GoRoute(
        path: '/client/:id',
        pageBuilder: (context, state) => _page(
          state,
          ClientDetailScreen(id: int.parse(state.pathParameters['id']!)),
        ),
        routes: [
          GoRoute(
            path: 'edit',
            pageBuilder: (context, state) => _page(
              state,
              ClientFormScreen(
                clientId: int.parse(state.pathParameters['id']!),
              ),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/catalog/new',
        pageBuilder: (context, state) =>
            _page(state, const CatalogFormScreen()),
      ),
      GoRoute(
        path: '/catalog/:id/edit',
        pageBuilder: (context, state) => _page(
          state,
          CatalogFormScreen(itemId: int.parse(state.pathParameters['id']!)),
        ),
      ),
      GoRoute(
        path: '/settings',
        pageBuilder: (context, state) => _page(state, const SettingsScreen()),
      ),
      GoRoute(
        path: '/settings/profile',
        pageBuilder: (context, state) =>
            _page(state, const BusinessProfileScreen()),
      ),
      GoRoute(
        path: '/settings/backup',
        pageBuilder: (context, state) => _page(state, const BackupScreen()),
      ),
      GoRoute(
        path: '/pro',
        pageBuilder: (context, state) => _page(state, const ProScreen()),
      ),
    ],
  );
});

Page<void> _page(GoRouterState state, Widget child) {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return CupertinoPage<void>(key: state.pageKey, child: child);
  }
  return MaterialPage<void>(key: state.pageKey, child: child);
}

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final palette = context.palette;
    return Scaffold(
      body: shell,
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: palette.line)),
        ),
        child: NavigationBar(
          selectedIndex: shell.currentIndex,
          onDestinationSelected: (index) {
            shell.goBranch(index, initialLocation: index == shell.currentIndex);
          },
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home_rounded),
              label: l10n.navHome,
            ),
            NavigationDestination(
              icon: const Icon(Icons.description_outlined),
              selectedIcon: const Icon(Icons.description_rounded),
              label: l10n.navQuotes,
            ),
            NavigationDestination(
              icon: const Icon(Icons.people_outline_rounded),
              selectedIcon: const Icon(Icons.people_rounded),
              label: l10n.navClients,
            ),
            NavigationDestination(
              icon: const Icon(Icons.inventory_2_outlined),
              selectedIcon: const Icon(Icons.inventory_2_rounded),
              label: l10n.navCatalog,
            ),
          ],
        ),
      ),
    );
  }
}
