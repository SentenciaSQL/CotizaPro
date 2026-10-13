import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> showProLimitDialog(
  BuildContext context, {
  required String title,
  required String body,
}) async {
  final l10n = context.l10n;
  final open = await showConfirmDialog(
    context,
    title: title,
    body: body,
    confirmLabel: l10n.upgrade,
    cancelLabel: l10n.notNow,
  );
  if (open && context.mounted) context.push('/pro');
}
