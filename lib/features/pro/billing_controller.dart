import 'dart:async';
import 'dart:io';

import 'package:cotizapro/core/constants/monetization.dart';
import 'package:cotizapro/data/repositories/settings_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

/// Store-backed state for the non-consumable [proProductId].
///
/// [checkingEntitlement] is true while a store query can still change Pro.
/// Ads stay hidden during that window. A local `isPro` row is only a cache of
/// a purchase the store already confirmed; this controller never sets it from
/// a button or a hardcoded flag.
class BillingState {
  const BillingState({
    this.storeAvailable = false,
    this.loadingProduct = false,
    this.product,
    this.pending = false,
    this.checkingEntitlement = true,
    this.messageCode,
  });

  final bool storeAvailable;
  final bool loadingProduct;
  final ProductDetails? product;
  final bool pending;
  final bool checkingEntitlement;
  final String? messageCode;

  BillingState copyWith({
    bool? storeAvailable,
    bool? loadingProduct,
    ProductDetails? product,
    bool clearProduct = false,
    bool? pending,
    bool? checkingEntitlement,
    String? messageCode,
    bool clearMessage = false,
  }) {
    return BillingState(
      storeAvailable: storeAvailable ?? this.storeAvailable,
      loadingProduct: loadingProduct ?? this.loadingProduct,
      product: clearProduct ? null : product ?? this.product,
      pending: pending ?? this.pending,
      checkingEntitlement: checkingEntitlement ?? this.checkingEntitlement,
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
  Future<void>? _syncing;
  var _started = false;
  var _collecting = false;
  final List<List<PurchaseDetails>> _collected = [];

  Stream<BillingState> get changes => _updates.stream;

  /// Subscribes to the store and refreshes ownership before the UI appears.
  Future<void> start() async {
    if (_started) return;
    _started = true;
    if (!_mobile) {
      _emit(state.copyWith(checkingEntitlement: false, storeAvailable: false));
      return;
    }
    _subscription = InAppPurchase.instance.purchaseStream.listen(
      _onPurchases,
      onError: (Object error, StackTrace stack) {
        debugPrint('Purchase stream error: $error');
        _emit(
          state.copyWith(
            pending: false,
            checkingEntitlement: false,
            messageCode: 'failed',
          ),
        );
      },
    );
    await refreshEntitlement(userInitiated: false);
  }

  /// Queries Google Play or the App Store and applies the result.
  ///
  /// A failed or timed-out query keeps the last confirmed entitlement.
  /// A successful query that does not include [proProductId] removes Pro.
  Future<void> refreshEntitlement({required bool userInitiated}) async {
    final previous = _syncing;
    if (previous != null) {
      await previous;
      if (!userInitiated) return;
    }
    final run = _refresh(userInitiated);
    _syncing = run;
    try {
      await run;
    } finally {
      if (identical(_syncing, run)) _syncing = null;
    }
  }

  Future<void> loadProduct() async {
    if (!_mobile) {
      _emit(
        state.copyWith(
          storeAvailable: false,
          loadingProduct: false,
          clearProduct: true,
          messageCode: 'unavailable',
        ),
      );
      return;
    }
    _emit(state.copyWith(loadingProduct: true, clearMessage: true));
    try {
      final available = await InAppPurchase.instance.isAvailable().timeout(
        _storeTimeout,
      );
      if (!available) {
        _emit(
          state.copyWith(
            storeAvailable: false,
            loadingProduct: false,
            clearProduct: true,
            messageCode: 'unavailable',
          ),
        );
        return;
      }
      final response = await InAppPurchase.instance
          .queryProductDetails({proProductId})
          .timeout(_storeTimeout);
      final product = response.productDetails
          .where((item) => item.id == proProductId)
          .firstOrNull;
      if (response.error != null || product == null) {
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
          product: product,
          clearMessage: true,
        ),
      );
    } catch (error) {
      debugPrint('Product query failed: $error');
      _emit(
        state.copyWith(
          loadingProduct: false,
          clearProduct: true,
          messageCode: 'unavailable',
        ),
      );
    }
  }

  Future<void> buy() async {
    if (!_mobile) {
      _emit(state.copyWith(messageCode: 'unavailable', pending: false));
      return;
    }
    if (state.pending || state.checkingEntitlement) return;
    final product = state.product;
    if (product == null || product.id != proProductId) {
      await loadProduct();
      return;
    }
    _emit(state.copyWith(clearMessage: true, pending: true));
    try {
      final started = await InAppPurchase.instance.buyNonConsumable(
        purchaseParam: PurchaseParam(productDetails: product),
      );
      if (!started) {
        _emit(state.copyWith(pending: false, messageCode: 'failed'));
      }
    } catch (error) {
      debugPrint('buyNonConsumable failed: $error');
      _emit(state.copyWith(pending: false, messageCode: 'failed'));
    }
  }

  Future<void> restore() {
    return refreshEntitlement(userInitiated: true);
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    await _updates.close();
  }

  Future<void> _refresh(bool userInitiated) async {
    if (!_mobile) {
      _emit(
        state.copyWith(
          checkingEntitlement: false,
          storeAvailable: false,
          pending: false,
          messageCode: userInitiated ? 'unavailable' : null,
          clearMessage: !userInitiated,
        ),
      );
      return;
    }
    _emit(state.copyWith(checkingEntitlement: true, clearMessage: true));
    try {
      final available = await InAppPurchase.instance.isAvailable().timeout(
        _storeTimeout,
      );
      if (!available) {
        _emit(
          state.copyWith(
            storeAvailable: false,
            checkingEntitlement: false,
            pending: false,
            messageCode: userInitiated ? 'unavailable' : null,
            clearMessage: !userInitiated,
          ),
        );
        return;
      }
      _emit(state.copyWith(storeAvailable: true));
      if (Platform.isAndroid) {
        await _refreshAndroid(userInitiated);
      } else {
        await _refreshIos(userInitiated);
      }
    } catch (error) {
      debugPrint('Entitlement refresh failed: $error');
      _collecting = false;
      _collected.clear();
      _emit(
        state.copyWith(
          checkingEntitlement: false,
          pending: false,
          messageCode: userInitiated ? 'unavailable' : null,
          clearMessage: !userInitiated,
        ),
      );
    }
  }

  Future<void> _refreshAndroid(bool userInitiated) async {
    final addition = InAppPurchase.instance
        .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
    final response = await addition.queryPastPurchases().timeout(_storeTimeout);
    if (response.error != null) {
      debugPrint('queryPastPurchases failed: ${response.error}');
      _emit(
        state.copyWith(
          checkingEntitlement: false,
          messageCode: userInitiated ? 'failed' : null,
          clearMessage: !userInitiated,
        ),
      );
      return;
    }
    await _settle(
      response.pastPurchases,
      authoritative: true,
      userInitiated: userInitiated,
      fromPurchase: false,
    );
  }

  /// StoreKit 2 delivers [Transaction.currentEntitlements] through the
  /// purchase stream after [InAppPurchase.restorePurchases] returns.
  Future<void> _refreshIos(bool userInitiated) async {
    _collected.clear();
    _collecting = true;
    try {
      await InAppPurchase.instance.restorePurchases().timeout(_storeTimeout);
      final deadline = DateTime.now().add(const Duration(seconds: 3));
      while (_collected.isEmpty && DateTime.now().isBefore(deadline)) {
        await Future<void>.delayed(const Duration(milliseconds: 40));
      }
    } finally {
      _collecting = false;
    }
    final batches = List<List<PurchaseDetails>>.of(_collected);
    _collected.clear();
    if (batches.isEmpty) {
      _emit(
        state.copyWith(
          checkingEntitlement: false,
          pending: false,
          messageCode: userInitiated ? 'unavailable' : null,
          clearMessage: !userInitiated,
        ),
      );
      return;
    }
    await _settle(
      batches.expand((batch) => batch).toList(),
      authoritative: true,
      userInitiated: userInitiated,
      fromPurchase: false,
    );
  }

  void _onPurchases(List<PurchaseDetails> purchases) {
    if (_collecting) {
      _collected.add(purchases);
      return;
    }
    unawaited(
      _settle(
        purchases,
        authoritative: false,
        userInitiated: false,
        fromPurchase: true,
      ),
    );
  }

  Future<void> _settle(
    List<PurchaseDetails> purchases, {
    required bool authoritative,
    required bool userInitiated,
    required bool fromPurchase,
  }) async {
    PurchaseDetails? owned;
    var pending = false;
    String? flowMessage;
    for (final purchase in purchases) {
      if (purchase.productID != proProductId) {
        if (purchase.productID.isEmpty &&
            purchase.status == PurchaseStatus.canceled) {
          flowMessage = 'cancelled';
        } else if (purchase.productID.isEmpty &&
            purchase.status == PurchaseStatus.error) {
          flowMessage = 'failed';
        }
        await _complete(purchase);
        continue;
      }
      switch (purchase.status) {
        case PurchaseStatus.pending:
          pending = true;
          flowMessage = 'pending';
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          if (_isConfirmedOwnership(purchase)) {
            owned = purchase;
          } else {
            flowMessage ??= 'failed';
          }
          await _complete(purchase);
        case PurchaseStatus.error:
          flowMessage = 'failed';
          await _complete(purchase);
        case PurchaseStatus.canceled:
          flowMessage = 'cancelled';
          await _complete(purchase);
      }
    }

    if (owned != null) {
      await _settings.unlockPro(
        productId: owned.productID,
        transactionId: owned.purchaseID,
      );
      _emit(
        state.copyWith(
          pending: false,
          checkingEntitlement: false,
          messageCode: fromPurchase
              ? 'unlocked'
              : (userInitiated ? 'restored' : null),
          clearMessage: !fromPurchase && !userInitiated,
        ),
      );
      return;
    }

    if (pending) {
      _emit(
        state.copyWith(
          pending: true,
          checkingEntitlement: false,
          messageCode: 'pending',
        ),
      );
      return;
    }

    if (authoritative) {
      await _settings.revokePro();
      _emit(
        state.copyWith(
          pending: false,
          checkingEntitlement: false,
          messageCode: userInitiated ? 'restoreEmpty' : null,
          clearMessage: !userInitiated,
        ),
      );
      return;
    }

    _emit(
      state.copyWith(
        pending: false,
        checkingEntitlement: false,
        messageCode: flowMessage,
        clearMessage: flowMessage == null,
      ),
    );
  }

  /// Purchased or restored, with a store token. Pending, canceled and error
  /// never qualify. On Google Play the billing state must be purchased even
  /// if a restore call rewrote the plugin status.
  bool _isConfirmedOwnership(PurchaseDetails purchase) {
    if (purchase.productID != proProductId) return false;
    if (purchase.status != PurchaseStatus.purchased &&
        purchase.status != PurchaseStatus.restored) {
      return false;
    }
    if (purchase is GooglePlayPurchaseDetails &&
        purchase.billingClientPurchase.purchaseState !=
            PurchaseStateWrapper.purchased) {
      return false;
    }
    final token = purchase.verificationData.serverVerificationData.trim();
    final id = purchase.purchaseID?.trim() ?? '';
    return token.isNotEmpty || id.isNotEmpty;
  }

  Future<void> _complete(PurchaseDetails purchase) async {
    if (!purchase.pendingCompletePurchase) return;
    try {
      await InAppPurchase.instance.completePurchase(purchase);
    } catch (error) {
      debugPrint('completePurchase failed: $error');
    }
  }

  void _emit(BillingState next) {
    state = next;
    if (!_updates.isClosed) _updates.add(next);
  }

  bool get _mobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  static const _storeTimeout = Duration(seconds: 20);
}
