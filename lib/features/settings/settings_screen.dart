import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/database/app_database.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/features/pro/billing_messages.dart';
import 'package:cotizapro/features/pro/limit_dialog.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final settings = ref.watch(settingsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: settings.when(
        loading: () => const LoadingView(),
        error: (error, stack) =>
            ErrorView(message: l10n.errorGeneric, retryLabel: l10n.retry),
        data: (value) {
          final isPro = value.isPro;
          final billing = ref.watch(billingStateProvider).asData?.value;
          final restoring = billing?.checkingEntitlement == true;
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            children: [
              Row(
                children: [
                  Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/branding/mark_on_dark.png'
                        : 'assets/branding/mark_on_light.png',
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text('CotizaPro', style: context.text.titleLarge),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(l10n.appearance, style: context.text.titleMedium),
              const SizedBox(height: 8),
              SegmentedButton<String>(
                segments: [
                  ButtonSegment(value: 'system', label: Text(l10n.themeSystem)),
                  ButtonSegment(value: 'light', label: Text(l10n.themeLight)),
                  ButtonSegment(value: 'dark', label: Text(l10n.themeDark)),
                ],
                selected: {value.themeMode},
                onSelectionChanged: (selection) {
                  ref
                      .read(settingsRepositoryProvider)
                      .save(
                        AppSettingsCompanion(themeMode: Value(selection.first)),
                      );
                },
              ),
              const SizedBox(height: 20),
              Text(l10n.language, style: context.text.titleMedium),
              const SizedBox(height: 8),
              SegmentedButton<String>(
                segments: [
                  ButtonSegment(value: '', label: Text(l10n.languageSystem)),
                  ButtonSegment(value: 'es', label: Text(l10n.languageSpanish)),
                  ButtonSegment(value: 'en', label: Text(l10n.languageEnglish)),
                ],
                selected: {value.localeCode},
                onSelectionChanged: (selection) {
                  ref
                      .read(settingsRepositoryProvider)
                      .save(
                        AppSettingsCompanion(
                          localeCode: Value(selection.first),
                        ),
                      );
                },
              ),
              const SizedBox(height: 20),
              _Link(
                title: l10n.businessProfile,
                subtitle: l10n.shortcutProfileHint,
                onTap: () => context.push('/settings/profile'),
              ),
              _Link(
                title: l10n.numbering,
                subtitle: l10n.quoteNumber,
                onTap: () => context.push('/settings/profile'),
              ),
              _Link(
                title: l10n.openPro,
                subtitle: isPro ? l10n.proActiveTitle : l10n.proSubtitle,
                onTap: () => context.push('/pro'),
              ),
              _Link(
                title: l10n.restorePurchases,
                subtitle: l10n.restorePurchasesHint,
                trailing: restoring
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(strokeWidth: 2.4),
                      )
                    : null,
                onTap: restoring ? null : () => _restore(context, ref),
              ),
              _Link(
                title: l10n.backup,
                subtitle: l10n.backupBody,
                onTap: () => context.push('/settings/backup'),
              ),
              const SizedBox(height: 16),
              Text(l10n.pdfSection, style: context.text.titleMedium),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.showNotes),
                value: value.pdfShowNotes,
                onChanged: (next) => ref
                    .read(settingsRepositoryProvider)
                    .save(AppSettingsCompanion(pdfShowNotes: Value(next))),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(l10n.showTerms),
                value: value.pdfShowTerms,
                onChanged: (next) => ref
                    .read(settingsRepositoryProvider)
                    .save(AppSettingsCompanion(pdfShowTerms: Value(next))),
              ),
              _proSwitch(
                context,
                ref,
                isPro,
                l10n.showLogo,
                value.pdfShowLogo,
                (next) {
                  ref
                      .read(settingsRepositoryProvider)
                      .save(AppSettingsCompanion(pdfShowLogo: Value(next)));
                },
              ),
              _proSwitch(
                context,
                ref,
                isPro,
                l10n.hideBranding,
                value.pdfHideBranding,
                (next) {
                  ref
                      .read(settingsRepositoryProvider)
                      .save(AppSettingsCompanion(pdfHideBranding: Value(next)));
                },
              ),
              _proSwitch(
                context,
                ref,
                isPro,
                l10n.showTagline,
                value.pdfShowTagline,
                (next) {
                  ref
                      .read(settingsRepositoryProvider)
                      .save(AppSettingsCompanion(pdfShowTagline: Value(next)));
                },
              ),
              _proSwitch(
                context,
                ref,
                isPro,
                l10n.signatureLine,
                value.pdfShowSignature,
                (next) {
                  ref
                      .read(settingsRepositoryProvider)
                      .save(
                        AppSettingsCompanion(pdfShowSignature: Value(next)),
                      );
                },
              ),
              const SizedBox(height: 12),
              Text(
                l10n.offlineNote,
                style: context.text.bodyMedium?.copyWith(
                  color: context.palette.muted,
                ),
              ),
              const SizedBox(height: 16),
              Text('${l10n.versionLabel} 1.0.0', style: context.text.bodySmall),
            ],
          );
        },
      ),
    );
  }

  Widget _proSwitch(
    BuildContext context,
    WidgetRef ref,
    bool isPro,
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      subtitle: isPro ? null : Text(context.l10n.proRequiredTitle),
      value: value,
      onChanged: (next) async {
        if (!isPro) {
          await showProLimitDialog(
            context,
            title: context.l10n.proRequiredTitle,
            body: context.l10n.proRequiredBody,
          );
          return;
        }
        onChanged(next);
      },
    );
  }
}

Future<void> _restore(BuildContext context, WidgetRef ref) async {
  await ref.read(billingControllerProvider).restore();
  if (!context.mounted) return;
  final code = ref.read(billingControllerProvider).state.messageCode;
  final message = billingMessage(context.l10n, code);
  if (message == null) return;
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

class _Link extends StatelessWidget {
  const _Link({
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: context.text.titleSmall),
      subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: trailing ?? const Icon(Icons.chevron_right_rounded),
      onTap: onTap,
    );
  }
}
