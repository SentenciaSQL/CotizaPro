import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/money/money.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/database/app_database.dart';
import 'package:cotizapro/features/quotations/quote_labels.dart';
import 'package:cotizapro/features/quotations/quote_models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QuoteTile extends StatelessWidget {
  const QuoteTile({super.key, required this.quote, required this.onTap});

  final Quotation quote;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    final display = displayStatusOf(
      status: quote.status,
      validUntil: quote.validUntil,
    );
    final date = DateFormat.yMMMd(locale).format(quote.issueDate.toLocal());
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          quote.number,
                          style: context.text.titleSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      StatusBadge(
                        label: statusLabel(l10n, display),
                        tone: statusTone(display),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    quote.clientName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.bodyMedium,
                  ),
                  const SizedBox(height: 2),
                  Text(date, style: context.text.bodySmall),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              formatMoney(quote.totalMinor, quote.currencyCode, locale),
              style: context.text.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class TotalsBlock extends StatelessWidget {
  const TotalsBlock({
    super.key,
    required this.totals,
    required this.currencyCode,
    required this.discountMode,
    required this.discountBps,
    required this.taxRateBps,
    required this.feeLabel,
  });

  final QuoteTotals totals;
  final String currencyCode;
  final DiscountMode discountMode;
  final int discountBps;
  final int taxRateBps;
  final String feeLabel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    String money(int value) => formatMoney(value, currencyCode, locale);
    final discountText = discountMode == DiscountMode.percent
        ? '${l10n.discount} (${formatPercentBps(discountBps, locale)})'
        : l10n.discount;
    final taxText = '${l10n.tax} (${formatPercentBps(taxRateBps, locale)})';
    final feeText = feeLabel.trim().isEmpty ? l10n.fee : feeLabel.trim();
    return Column(
      children: [
        _row(context, l10n.subtotal, money(totals.subtotalMinor)),
        if (totals.discountMinor > 0)
          _row(context, discountText, '-${money(totals.discountMinor)}'),
        if (taxRateBps > 0) _row(context, taxText, money(totals.taxMinor)),
        if (totals.feeMinor > 0) _row(context, feeText, money(totals.feeMinor)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: Text(l10n.total, style: context.text.titleMedium)),
            Text(
              money(totals.totalMinor),
              style: context.text.titleLarge?.copyWith(
                color: context.palette.teal,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _row(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: context.text.bodyMedium?.copyWith(
                color: context.palette.muted,
              ),
            ),
          ),
          Text(value, style: context.text.bodyMedium),
        ],
      ),
    );
  }
}
