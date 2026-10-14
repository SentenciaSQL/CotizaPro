import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/features/quotations/quote_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ClientDetailScreen extends ConsumerWidget {
  const ClientDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final clients = ref.watch(clientsProvider);
    final quotes = ref.watch(clientQuotesProvider(id));
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.clientsTitle),
        actions: [
          IconButton(
            tooltip: l10n.edit,
            onPressed: () => context.push('/client/$id/edit'),
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            tooltip: l10n.delete,
            onPressed: () => _delete(context, ref),
            icon: const Icon(Icons.delete_outline_rounded),
          ),
        ],
      ),
      body: clients.when(
        loading: () => const LoadingView(),
        error: (error, stack) =>
            ErrorView(message: l10n.errorGeneric, retryLabel: l10n.retry),
        data: (items) {
          final client = items.where((item) => item.id == id).firstOrNull;
          if (client == null) {
            return ErrorView(
              message: l10n.errorGeneric,
              retryLabel: l10n.retry,
            );
          }
          final rows = <(String, String)>[
            (l10n.company, client.company ?? ''),
            (l10n.email, client.email ?? ''),
            (l10n.phone, client.phone ?? ''),
            (l10n.address, client.address ?? ''),
            (l10n.taxId, client.taxId ?? ''),
            (l10n.notes, client.notes ?? ''),
          ].where((row) => row.$2.trim().isNotEmpty).toList();
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: [
              Row(
                children: [
                  InitialsAvatar(name: client.name, size: 56),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      client.name,
                      style: context.text.headlineMedium,
                    ),
                  ),
                ],
              ),
              if (rows.isNotEmpty) ...[
                const SizedBox(height: 16),
                SurfacePanel(
                  child: Column(
                    children: [
                      for (var i = 0; i < rows.length; i++) ...[
                        if (i > 0) const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 110,
                              child: Text(
                                rows[i].$1,
                                style: context.text.bodySmall,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                rows[i].$2,
                                style: context.text.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 20),
              Text(l10n.clientQuotes, style: context.text.titleMedium),
              const SizedBox(height: 8),
              quotes.when(
                loading: () => const Padding(
                  padding: EdgeInsets.all(24),
                  child: LoadingView(),
                ),
                error: (error, stack) => Text(l10n.errorGeneric),
                data: (list) {
                  if (list.isEmpty) {
                    return EmptyState(
                      icon: Icons.description_outlined,
                      title: l10n.noClientQuotes,
                      body: '',
                      expand: false,
                    );
                  }
                  return SurfacePanel(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        for (var i = 0; i < list.length; i++) ...[
                          if (i > 0)
                            Divider(height: 1, color: context.palette.line),
                          QuoteTile(
                            quote: list[i],
                            onTap: () => context.push('/quote/${list[i].id}'),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final confirmed = await showConfirmDialog(
      context,
      title: l10n.deleteClientTitle,
      body: l10n.deleteClientBody,
      confirmLabel: l10n.delete,
      cancelLabel: l10n.cancel,
      destructive: true,
    );
    if (!confirmed) return;
    await ref.read(clientRepositoryProvider).deleteClient(id);
    if (context.mounted) {
      showAppMessage(context, l10n.deleted);
      context.pop();
    }
  }
}
