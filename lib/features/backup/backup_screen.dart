import 'dart:io';

import 'package:cotizapro/core/errors/app_exceptions.dart';
import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class BackupScreen extends ConsumerStatefulWidget {
  const BackupScreen({super.key});

  @override
  ConsumerState<BackupScreen> createState() => _BackupScreenState();
}

class _BackupScreenState extends ConsumerState<BackupScreen> {
  var _busy = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.backupTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(l10n.backupBody, style: context.text.bodyMedium?.copyWith(color: context.palette.muted)),
          const SizedBox(height: 20),
          PrimaryButton(
            label: l10n.exportBackup,
            loading: _busy,
            icon: Icons.ios_share_rounded,
            onPressed: _export,
          ),
          const SizedBox(height: 12),
          SecondaryButton(
            label: l10n.importBackup,
            icon: Icons.download_rounded,
            onPressed: _busy ? null : _import,
          ),
        ],
      ),
    );
  }

  Future<void> _export() async {
    setState(() => _busy = true);
    try {
      final file = await ref.read(backupRepositoryProvider).exportToFile();
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path, mimeType: 'application/json', name: 'cotizapro-backup.json')],
          subject: 'CotizaPro',
        ),
      );
      if (mounted) showAppMessage(context, context.l10n.exportDone);
    } catch (_) {
      if (mounted) showAppMessage(context, context.l10n.errorGeneric);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _import() async {
    final l10n = context.l10n;
    final picked = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );
    final path = picked?.path;
    if (path == null || !mounted) return;
    final confirmed = await showConfirmDialog(
      context,
      title: l10n.importTitle,
      body: l10n.importBody,
      confirmLabel: l10n.importBackup,
      cancelLabel: l10n.cancel,
      destructive: true,
    );
    if (!confirmed || !mounted) return;
    setState(() => _busy = true);
    try {
      await ref.read(backupRepositoryProvider).importFromFile(File(path));
      if (mounted) showAppMessage(context, l10n.importDone);
    } on BackupFormatException {
      if (mounted) showAppMessage(context, l10n.importInvalid);
    } catch (_) {
      if (mounted) showAppMessage(context, l10n.errorGeneric);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }
}
