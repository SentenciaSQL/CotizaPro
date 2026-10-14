import 'dart:async';
import 'dart:io';

import 'package:cotizapro/core/constants/monetization.dart';
import 'package:cotizapro/data/repositories/settings_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class BillingState {
  const BillingState({
    this.storeAvailable = false,
    this.loadingProduct = false,
    this.product,
    this.pending = false,
    this.messageCode,
  });

  final bool storeAvailable;
  final bool loadingProduct;
  final ProductDetails? product;
  final bool pending;
  final String? messageCode;

  BillingState copyWith({
    bool? storeAvailable,
    bool? loadingProduct,
    ProductDetails? product,
    bool clearProduct = false,
    bool? pending,
    String? messageCode,
    bool clearMessage = false,
  }) {
    return BillingState(
      storeAvailable: storeAvailable ?? this.storeAvailable,
      loadingProduct: loadingProduct ?? this.loadingProduct,
      product: clearProduct ? null : product ?? this.product,
      pending: pending ?? this.pending,
      messageCode: clearMessage ? null : messageCode ?? this.messageCode,
    );
  }
}

class BillingController {
  BillingController(this._settings);

  final SettingsRepository _settings;
  final _updates = StreamController<BillingState>.broadcast();
  BillingState state = const BillingState();
  StreamSubscription<List<PurchaseDetails>>? _subscription;
  var _started = false;

  Stream<BillingState> get changes => _updates.stream;

  Future<void> start() async {
    if (_started) return;
    _started = true;
    if (!_mobile) {
      _emit(state);
      return;
    }
    _subscription = InAppPurchase.instance.purchaseStream.listen(
      _onPurchases,
      onError: (Object error, StackTrace stack) {
        debugPrint('Purchase stream error: $error');
        _emit(state.copyWith(pending: false, messageCode: 'failed'));
      },
    );
    try {
      final available = await InAppPurchase.instance.isAvailable();
      _emit(state.copyWith(storeAvailable: available));
    } catch (error) {
      debugPrint('Store availability failed: $error');
      _emit(state.copyWith(storeAvailable: false, messageCode: 'unavailable'));
    }
  }

  Future<void> loadProduct() async {
    if (!_mobile) {
      _emit(state.copyWith(storeAvailable: false, messageCode: 'unavailable'));
      return;
    }
    _emit(state.copyWith(loadingProduct: true, clearMessage: true));
    try {
      final available = await InAppPurchase.instance.isAvailable();
      if (!available) {
        _emit(
          state.copyWith(
            storeAvailable: false,
            loadingProduct: false,
            messageCode: 'unavailable',
          ),
        );
        return;
      }
      final response = await InAppPurchase.instance.queryProductDetails({
        proProductId,
      });
      if (response.error != null || response.productDetails.isEmpty) {
        _emit(
          state.copyWith(
            storeAvailable: true,
            loadingProduct: false,
            clearProduct: true,
            messageCode: 'missing',
          ),
        );
        return;
      }
      _emit(
        state.copyWith(
          storeAvailable: true,
          loadingProduct: false,
          product: response.productDetails.first,
          clearMessage: true,
        ),
      );
    } catch (error) {
      debugPrint('Product query failed: $error');
      _emit(
        state.copyWith(
          loadingProduct: false,
          messageCode: 'unavailable',
        ),
      );
    }
  }

  Future<void> buy() async {
    final product = state.product;
    if (product == null) {
      await loadProduct();
      return;
    }
    _emit(state.copyWith(clearMessage: true, pending: false));
    final started = await InAppPurchase.instance.buyNonConsumable(
      purchaseParam: PurchaseParam(productDetails: product),
    );
    if (!started) {
      _emit(state.copyWith(messageCode: 'failed'));
    }
  }

  Future<void> restore() async {
    if (!_mobile || !state.storeAvailable) {
      _emit(state.copyWith(messageCode: 'unavailable'));
      return;
    }
    _emit(state.copyWith(clearMessage: true));
    await InAppPurchase.instance.restorePurchases();
    await Future<void>.delayed(const Duration(seconds: 2));
    final settings = await _settings.get();
    if (!settings.isPro) {
      _emit(state.copyWith(messageCode: 'restoreEmpty'));
    }
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    await _updates.close();
  }

  Future<void> _onPurchases(List<PurchaseDetails> purchases) async {
    var sawPro = false;
    for (final purchase in purchases) {
      if (purchase.productID != proProductId) {
        await _complete(purchase);
        continue;
      }
      switch (purchase.status) {
        case PurchaseStatus.pending:
          _emit(state.copyWith(pending: true, messageCode: 'pending'));
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          sawPro = true;
          if (_isStoreConfirmed(purchase)) {
            await _settings.unlockPro(
              productId: purchase.productID,
              transactionId: purchase.purchaseID,
            );
            _emit(
              state.copyWith(
                pending: false,
                messageCode: purchase.status == PurchaseStatus.restored
                    ? 'restored'
                    : 'unlocked',
              ),
            );
          } else {
            _emit(state.copyWith(pending: false, messageCode: 'failed'));
          }
          await _complete(purchase);
        case PurchaseStatus.error:
          _emit(state.copyWith(pending: false, messageCode: 'failed'));
          await _complete(purchase);
        case PurchaseStatus.canceled:
          _emit(state.copyWith(pending: false, messageCode: 'cancelled'));
          await _complete(purchase);
      }
    }
    if (purchases.isEmpty) {
      sawPro = false;
    }
    if (!sawPro && purchases.isNotEmpty) {
      return;
    }
  }

  bool _isStoreConfirmed(PurchaseDetails purchase) {
    final token = purchase.verificationData.serverVerificationData.trim();
    final id = purchase.purchaseID?.trim() ?? '';
    return token.isNotEmpty || id.isNotEmpty;
  }

  Future<void> _complete(PurchaseDetails purchase) async {
    if (purchase.pendingCompletePurchase) {
      await InAppPurchase.instance.completePurchase(purchase);
    }
  }

  void _emit(BillingState next) {
    state = next;
    if (!_updates.isClosed) _updates.add(next);
  }

  bool get _mobile =>
      !kIsWeb && (Platform.isAndroid || Platform.isIOS);
}
