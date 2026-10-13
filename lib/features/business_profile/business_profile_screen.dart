import 'dart:io';

import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/money/money.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/database/app_database.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:drift/drift.dart' show Value;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BusinessProfileScreen extends ConsumerStatefulWidget {
  const BusinessProfileScreen({super.key});

  @override
  ConsumerState<BusinessProfileScreen> createState() =>
      _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends ConsumerState<BusinessProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _business = TextEditingController();
  final _owner = TextEditingController();
  final _tax = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _website = TextEditingController();
  final _address = TextEditingController();
  final _city = TextEditingController();
  final _region = TextEditingController();
  final _postal = TextEditingController();
  final _country = TextEditingController();
  final _prefix = TextEditingController();
  final _next = TextEditingController();
  final _taxRate = TextEditingController();
  final _days = TextEditingController();
  final _notes = TextEditingController();
  final _terms = TextEditingController();
  final _tagline = TextEditingController();
  final _footer = TextEditingController();
  final _customCurrency = TextEditingController();
  String _currency = 'USD';
  String? _logo;
  var _ready = false;
  var _saving = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final profile = await ref.read(profileRepositoryProvider).get();
    if (!mounted) return;
    final locale = Localizations.localeOf(context).toString();
    _business.text = profile.businessName;
    _owner.text = profile.ownerName;
    _tax.text = profile.taxId ?? '';
    _email.text = profile.email ?? '';
    _phone.text = profile.phone ?? '';
    _website.text = profile.website ?? '';
    _address.text = profile.addressLine ?? '';
    _city.text = profile.city ?? '';
    _region.text = profile.region ?? '';
    _postal.text = profile.postalCode ?? '';
    _country.text = profile.country ?? '';
    _prefix.text = profile.quotePrefix;
    _next.text = '${profile.nextQuoteNumber}';
    _taxRate.text = scaledToInput(profile.defaultTaxBps, 2, locale);
    _days.text = '${profile.defaultValidityDays}';
    _notes.text = profile.defaultNotes;
    _terms.text = profile.defaultTerms;
    _tagline.text = profile.tagline;
    _footer.text = profile.pdfFooter;
    _currency = profile.currencyCode;
    if (!supportedCurrencies.contains(_currency)) {
      _customCurrency.text = _currency;
    }
    _logo = profile.logoPath;
    setState(() => _ready = true);
  }

  @override
  void dispose() {
    for (final controller in [
      _business,
      _owner,
      _tax,
      _email,
      _phone,
      _website,
      _address,
      _city,
      _region,
      _postal,
      _country,
      _prefix,
      _next,
      _taxRate,
      _days,
      _notes,
      _terms,
      _tagline,
      _footer,
      _customCurrency,
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isPro = ref.watch(settingsProvider).asData?.value.isPro ?? false;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.businessProfile)),
      body: !_ready
          ? const LoadingView()
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                children: [
                  SurfacePanel(
                    child: Row(
                      children: [
                        _LogoPreview(path: _logo),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.logo, style: context.text.titleSmall),
                              const SizedBox(height: 4),
                              Text(
                                l10n.logoHint,
                                style: context.text.bodySmall,
                              ),
                              if (!isPro)
                                Text(
                                  l10n.proRequiredTitle,
                                  style: context.text.bodySmall,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          label: l10n.chooseLogo,
                          onPressed: _pickLogo,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (_logo != null)
                        IconButton(
                          tooltip: l10n.removeLogo,
                          onPressed: _clearLogo,
                          icon: const Icon(Icons.delete_outline_rounded),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _field(_business, l10n.businessName),
                  _field(_owner, l10n.ownerName),
                  _field(_tax, l10n.taxId),
                  _field(
                    _email,
                    l10n.email,
                    keyboard: TextInputType.emailAddress,
                    validator: (value) {
                      final text = value?.trim() ?? '';
                      if (text.isEmpty) return null;
                      return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                              .hasMatch(text)
                          ? null
                          : l10n.invalidEmail;
                    },
                  ),
                  _field(_phone, l10n.phone, keyboard: TextInputType.phone),
                  _field(_website, l10n.website),
                  _field(_address, l10n.address, lines: 2),
                  _field(_city, l10n.city),
                  _field(_region, l10n.region),
                  _field(_postal, l10n.postalCode),
                  _field(_country, l10n.country),
                  const SizedBox(height: 8),
                  Text(l10n.currency, style: context.text.titleSmall),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final code in supportedCurrencies)
                        ChoiceChip(
                          label: Text(code),
                          selected:
                              _customCurrency.text.trim().isEmpty &&
                              _currency == code,
                          onSelected: (_) => setState(() {
                            _currency = code;
                            _customCurrency.clear();
                          }),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _customCurrency,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(labelText: l10n.customCurrency),
                    onChanged: (_) => setState(() {}),
                    validator: (value) {
                      final text = value?.trim() ?? '';
                      if (text.isEmpty) return null;
                      return RegExp(r'^[A-Za-z]{3}$').hasMatch(text)
                          ? null
                          : l10n.invalidCurrency;
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(l10n.numbering, style: context.text.titleMedium),
                  const SizedBox(height: 8),
                  _field(_prefix, l10n.quotePrefix),
                  _field(
                    _next,
                    l10n.nextNumber,
                    keyboard: TextInputType.number,
                    validator: (value) {
                      final parsed = int.tryParse(value?.trim() ?? '');
                      if (parsed == null || parsed < 1) {
                        return l10n.invalidAmount;
                      }
                      return null;
                    },
                  ),
                  _field(
                    _taxRate,
                    l10n.defaultTax,
                    keyboard: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                  _field(
                    _days,
                    l10n.validityDays,
                    keyboard: TextInputType.number,
                    validator: (value) {
                      final parsed = int.tryParse(value?.trim() ?? '');
                      if (parsed == null || parsed < 0 || parsed > 3650) {
                        return l10n.invalidAmount;
                      }
                      return null;
                    },
                  ),
                  _field(_tagline, l10n.tagline),
                  _field(_footer, l10n.pdfFooter, lines: 2),
                  _field(_notes, l10n.defaultNotes, lines: 3),
                  _field(_terms, l10n.defaultTerms, lines: 3),
                  const SizedBox(height: 8),
                  PrimaryButton(
                    label: l10n.save,
                    loading: _saving,
                    onPressed: _save,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    TextInputType? keyboard,
    int lines = 1,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboard,
        minLines: lines,
        maxLines: lines,
        decoration: InputDecoration(labelText: label),
        validator: validator,
      ),
    );
  }

  Future<void> _pickLogo() async {
    final file = await FilePicker.pickFile(type: FileType.image);
    final path = file?.path;
    if (path == null) return;
    try {
      final saved = await ref.read(profileRepositoryProvider).importLogo(path);
      if (mounted) setState(() => _logo = saved);
    } on FileSystemException {
      if (mounted) showAppMessage(context, context.l10n.logoTooLarge);
    } catch (_) {
      if (mounted) showAppMessage(context, context.l10n.errorGeneric);
    }
  }

  Future<void> _clearLogo() async {
    await ref.read(profileRepositoryProvider).clearLogo();
    if (mounted) setState(() => _logo = null);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final l10n = context.l10n;
    final custom = _customCurrency.text.trim().toUpperCase();
    final currency = custom.isEmpty ? _currency : custom;
    final tax =
        parseDecimalToScaled(
          _taxRate.text.trim().isEmpty ? '0' : _taxRate.text,
          2,
        ) ??
        0;
    if (tax < 0 || tax > 10000) {
      setState(() => _saving = false);
      showAppMessage(context, l10n.invalidAmount);
      return;
    }
    try {
      await ref
          .read(profileRepositoryProvider)
          .save(
            BusinessProfilesCompanion(
              businessName: Value(_business.text.trim()),
              ownerName: Value(_owner.text.trim()),
              taxId: Value(_blank(_tax.text)),
              email: Value(_blank(_email.text)),
              phone: Value(_blank(_phone.text)),
              website: Value(_blank(_website.text)),
              addressLine: Value(_blank(_address.text)),
              city: Value(_blank(_city.text)),
              region: Value(_blank(_region.text)),
              postalCode: Value(_blank(_postal.text)),
              country: Value(_blank(_country.text)),
              currencyCode: Value(currency),
              quotePrefix: Value(
                _prefix.text.trim().isEmpty ? 'COT-' : _prefix.text.trim(),
              ),
              nextQuoteNumber: Value(int.parse(_next.text.trim())),
              defaultTaxBps: Value(tax),
              defaultValidityDays: Value(int.parse(_days.text.trim())),
              defaultNotes: Value(_notes.text.trim()),
              defaultTerms: Value(_terms.text.trim()),
              tagline: Value(_tagline.text.trim()),
              pdfFooter: Value(_footer.text.trim()),
            ),
          );
      if (!mounted) return;
      showAppMessage(context, l10n.profileSaved);
      context.pop();
    } catch (_) {
      if (mounted) showAppMessage(context, l10n.errorGeneric);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

String? _blank(String value) {
  final trimmed = value.trim();
  return trimmed.isEmpty ? null : trimmed;
}

class _LogoPreview extends StatelessWidget {
  const _LogoPreview({required this.path});
  final String? path;

  @override
  Widget build(BuildContext context) {
    final file = path == null ? null : File(path!);
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: context.palette.surfaceMuted,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: context.palette.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: file != null && file.existsSync()
          ? Image.file(file, fit: BoxFit.cover)
          : Icon(Icons.image_outlined, color: context.palette.muted),
    );
  }
}
