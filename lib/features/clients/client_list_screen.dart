import 'package:cotizapro/core/constants/limits.dart';
import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/features/ads/ad_banner.dart';
import 'package:cotizapro/features/pro/limit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ClientListScreen extends ConsumerStatefulWidget {
  const ClientListScreen({super.key});

  @override
  ConsumerState<ClientListScreen> createState() => _ClientListScreenState();
}

class _ClientListScreenState extends ConsumerState<ClientListScreen> {
  final _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final clients = ref.watch(clientsProvider);
    final isPro = ref.watch(settingsProvider).asData?.value.isPro ?? false;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.clientsTitle),
        actions: [
          IconButton(
            tooltip: l10n.newClient,
            onPressed: () => _create(context, isPro),
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: clients.when(
        loading: () => const LoadingView(),
        error: (error, stack) => ErrorView(
          message: l10n.errorGeneric,
          retryLabel: l10n.retry,
          onRetry: () => ref.invalidate(clientsProvider),
        ),
        data: (items) {
          final query = _query.trim().toLowerCase();
          final visible = items.where((client) {
            if (query.isEmpty) return true;
            final haystack = '${client.name} ${client.company ?? ''} ${client.email ?? ''} ${client.phone ?? ''}'.toLowerCase();
            return haystack.contains(query);
          }).toList();
          if (items.isEmpty) {
            return EmptyState(
              icon: Icons.people_outline_rounded,
              title: l10n.emptyClientsTitle,
              body: l10n.emptyClientsBody,
              actionLabel: l10n.newClient,
              onAction: () => _create(context, isPro),
            );
          }
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            children: [
              SearchField(
                controller: _search,
                hint: l10n.searchClients,
                onChanged: (value) => setState(() => _query = value),
              ),
              const SizedBox(height: 12),
              if (visible.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(l10n.noMatches, textAlign: TextAlign.center),
                )
              else
                SurfacePanel(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      for (final client in visible)
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          leading: InitialsAvatar(name: client.name),
                          title: Text(client.name, style: context.text.titleSmall),
                          subtitle: Text(
                            [client.company, client.phone].whereType<String>().where((part) => part.isNotEmpty).join(' · '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: const Icon(Icons.chevron_right_rounded),
                          onTap: () => context.push('/client/${client.id}'),
                        ),
                    ],
                  ),
                ),
              const AdBannerSlot(),
            ],
          );
        },
      ),
    );
  }

  Future<void> _create(BuildContext context, bool isPro) async {
    final count = ref.read(clientsProvider).asData?.value.length ?? 0;
    if (!isPro && count >= freeClientLimit) {
      await showProLimitDialog(
        context,
        title: context.l10n.clientLimitTitle,
        body: context.l10n.clientLimitBody,
      );
      return;
    }
    if (context.mounted) context.push('/client/new');
  }
}
