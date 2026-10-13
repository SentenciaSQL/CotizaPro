import 'package:cotizapro/core/errors/app_exceptions.dart';
import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/features/pro/limit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ClientFormScreen extends ConsumerStatefulWidget {
  const ClientFormScreen({super.key, this.clientId});

  final int? clientId;

  @override
  ConsumerState<ClientFormScreen> createState() => _ClientFormScreenState();
}

class _ClientFormScreenState extends ConsumerState<ClientFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _company = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();
  final _taxId = TextEditingController();
  final _notes = TextEditingController();
  var _loading = false;
  var _ready = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final id = widget.clientId;
    if (id == null) {
      setState(() => _ready = true);
      return;
    }
    final client = await ref.read(clientRepositoryProvider).getById(id);
    if (!mounted) return;
    if (client != null) {
      _name.text = client.name;
      _company.text = client.company ?? '';
      _email.text = client.email ?? '';
      _phone.text = client.phone ?? '';
      _address.text = client.address ?? '';
      _taxId.text = client.taxId ?? '';
      _notes.text = client.notes ?? '';
    }
    setState(() => _ready = true);
  }

  @override
  void dispose() {
    _name.dispose();
    _company.dispose();
    _email.dispose();
    _phone.dispose();
    _address.dispose();
    _taxId.dispose();
    _notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final editing = widget.clientId != null;
    return Scaffold(
      appBar: AppBar(title: Text(editing ? l10n.editClient : l10n.newClient)),
      body: !_ready
          ? const LoadingView()
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                children: [
                  TextFormField(
                    controller: _name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(labelText: l10n.clientName),
                    validator: (value) => value == null || value.trim().isEmpty ? l10n.fieldRequired : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _company,
                    decoration: InputDecoration(labelText: l10n.company),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: l10n.email),
                    validator: (value) {
                      final text = value?.trim() ?? '';
                      if (text.isEmpty) return null;
                      final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(text);
                      return ok ? null : l10n.invalidEmail;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(labelText: l10n.phone),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _address,
                    minLines: 2,
                    maxLines: 3,
                    decoration: InputDecoration(labelText: l10n.address),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _taxId,
                    decoration: InputDecoration(labelText: l10n.taxId),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _notes,
                    minLines: 2,
                    maxLines: 4,
                    decoration: InputDecoration(labelText: l10n.notes),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    label: l10n.save,
                    loading: _loading,
                    onPressed: _save,
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    final l10n = context.l10n;
    final isPro = ref.read(settingsProvider).asData?.value.isPro ?? false;
    try {
      final repo = ref.read(clientRepositoryProvider);
      if (widget.clientId == null) {
        await repo.create(
          name: _name.text,
          company: _company.text,
          email: _email.text,
          phone: _phone.text,
          address: _address.text,
          taxId: _taxId.text,
          notes: _notes.text,
          isPro: isPro,
        );
      } else {
        await repo.updateClient(
          id: widget.clientId!,
          name: _name.text,
          company: _company.text,
          email: _email.text,
          phone: _phone.text,
          address: _address.text,
          taxId: _taxId.text,
          notes: _notes.text,
        );
      }
      if (!mounted) return;
      showAppMessage(context, l10n.clientSaved);
      context.pop();
    } on ClientLimitException {
      if (!mounted) return;
      await showProLimitDialog(context, title: l10n.clientLimitTitle, body: l10n.clientLimitBody);
    } catch (_) {
      if (mounted) showAppMessage(context, l10n.errorGeneric);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }
}
