// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'CotizaPro';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get duplicate => 'Duplicate';

  @override
  String get close => 'Close';

  @override
  String get continueAction => 'Continue';

  @override
  String get retry => 'Try again';

  @override
  String get done => 'Done';

  @override
  String get loading => 'Loading';

  @override
  String get required => 'Required';

  @override
  String get errorGeneric => 'The action could not be completed. Try again.';

  @override
  String get saved => 'Changes saved';

  @override
  String get deleted => 'Deleted';

  @override
  String get upgrade => 'See Pro';

  @override
  String get notNow => 'Not now';

  @override
  String get proRequiredTitle => 'Pro feature';

  @override
  String get proRequiredBody => 'This option is part of CotizaPro Pro.';

  @override
  String get navHome => 'Home';

  @override
  String get navQuotes => 'Quotes';

  @override
  String get navClients => 'Clients';

  @override
  String get navCatalog => 'Catalog';

  @override
  String get greetingMorning => 'Good morning';

  @override
  String get greetingAfternoon => 'Good afternoon';

  @override
  String get greetingEvening => 'Good evening';

  @override
  String get yourBusiness => 'Your business';

  @override
  String get completeProfileTitle => 'Complete your business profile';

  @override
  String get completeProfileBody =>
      'Your name, contact details and currency appear on every quote.';

  @override
  String get completeProfileAction => 'Complete profile';

  @override
  String get newQuote => 'New quote';

  @override
  String get newQuoteHint => 'Client, line items and PDF in one flow.';

  @override
  String get summary => 'Summary';

  @override
  String get statQuotes => 'Quotes';

  @override
  String get statOpen => 'Open';

  @override
  String get statAccepted => 'Accepted';

  @override
  String get recentQuotes => 'Recent';

  @override
  String get seeAll => 'See all';

  @override
  String get emptyQuotesTitle => 'No quotes yet';

  @override
  String get emptyQuotesBody =>
      'Create the first one with a client, line items and a calculated total.';

  @override
  String get createFirstQuote => 'Create the first quote';

  @override
  String get shortcutClients => 'Clients';

  @override
  String get shortcutCatalog => 'Catalog';

  @override
  String get shortcutHistory => 'History';

  @override
  String get shortcutProfile => 'Profile';

  @override
  String get shortcutClientsHint => 'Saved contacts';

  @override
  String get shortcutCatalogHint => 'Services and prices';

  @override
  String get shortcutHistoryHint => 'Statuses and PDF';

  @override
  String get shortcutProfileHint => 'Business details';

  @override
  String get quotesTitle => 'Quotes';

  @override
  String get searchQuotes => 'Search by number or client';

  @override
  String get filterAll => 'All';

  @override
  String get filterDraft => 'Drafts';

  @override
  String get filterSent => 'Sent';

  @override
  String get filterAccepted => 'Accepted';

  @override
  String get filterRejected => 'Rejected';

  @override
  String get filterExpired => 'Expired';

  @override
  String get statusDraft => 'Draft';

  @override
  String get statusSent => 'Sent';

  @override
  String get statusAccepted => 'Accepted';

  @override
  String get statusRejected => 'Rejected';

  @override
  String get statusExpired => 'Expired';

  @override
  String get emptyHistoryTitle => 'History is empty';

  @override
  String get emptyHistoryBody => 'Quotes you save will appear here.';

  @override
  String get noFilterResults => 'No quotes match this search.';

  @override
  String get deleteQuoteTitle => 'Delete quote?';

  @override
  String get deleteQuoteBody =>
      'The document and its line items will be removed. This cannot be undone.';

  @override
  String get quoteLimitTitle => 'Free plan limit';

  @override
  String get quoteLimitBody =>
      'You can save up to 5 quotes. Existing ones can still be opened and exported. Pro removes the limit.';

  @override
  String get dateFrom => 'From';

  @override
  String get dateTo => 'To';

  @override
  String get clearDates => 'Clear dates';

  @override
  String get exportCsv => 'Export CSV';

  @override
  String get exportCsvProBody => 'History export is included in Pro.';

  @override
  String get stepClient => 'Client and dates';

  @override
  String get stepItems => 'Line items';

  @override
  String get stepAmounts => 'Amounts';

  @override
  String get stepReview => 'Review';

  @override
  String get quoteNumber => 'Number';

  @override
  String get issueDate => 'Issue date';

  @override
  String get validUntil => 'Valid until';

  @override
  String get selectClient => 'Choose client';

  @override
  String get changeClient => 'Change client';

  @override
  String get noClientYet => 'No clients yet';

  @override
  String get quickClient => 'New client';

  @override
  String get clientName => 'Name';

  @override
  String get company => 'Company';

  @override
  String get email => 'Email';

  @override
  String get phone => 'Phone';

  @override
  String get address => 'Address';

  @override
  String get taxId => 'Tax ID';

  @override
  String get notes => 'Notes';

  @override
  String get terms => 'Terms';

  @override
  String get invalidEmail => 'The email address is not valid.';

  @override
  String get validityError =>
      'The due date cannot be earlier than the issue date.';

  @override
  String get duplicateNumber => 'A quote with that number already exists.';

  @override
  String get needClient => 'Choose or create a client to continue.';

  @override
  String get needLineToSend =>
      'Add at least one line item before marking it as sent.';

  @override
  String get unsavedTitle => 'Leave without saving?';

  @override
  String get unsavedBody => 'Changes to this quote will be lost.';

  @override
  String get discard => 'Leave';

  @override
  String get keepEditing => 'Keep editing';

  @override
  String get concepts => 'Line items';

  @override
  String get addFromCatalog => 'From catalog';

  @override
  String get addManual => 'Add manually';

  @override
  String get emptyLinesTitle => 'No line items';

  @override
  String get emptyLinesBody =>
      'Add labor, materials or a service from the catalog.';

  @override
  String get quantity => 'Quantity';

  @override
  String get unitPrice => 'Unit price';

  @override
  String get lineTotal => 'Amount';

  @override
  String get kindLabor => 'Labor';

  @override
  String get kindMaterial => 'Material';

  @override
  String get kindService => 'Service';

  @override
  String get kindProduct => 'Product';

  @override
  String get unitUnit => 'ea';

  @override
  String get unitHour => 'hr';

  @override
  String get unitDay => 'day';

  @override
  String get unitMeter => 'm';

  @override
  String get unitSquare => 'm²';

  @override
  String get unitKg => 'kg';

  @override
  String get lineName => 'Item';

  @override
  String get lineDescription => 'Description';

  @override
  String get editConcept => 'Edit item';

  @override
  String get removeConcept => 'Remove';

  @override
  String get discount => 'Discount';

  @override
  String get discountNone => 'No discount';

  @override
  String get discountPercent => 'Percent';

  @override
  String get discountFixed => 'Fixed amount';

  @override
  String get tax => 'Tax';

  @override
  String get taxPercent => 'Tax percent';

  @override
  String get taxHint =>
      'Calculated on the subtotal after discount. Additional charges are not taxed.';

  @override
  String get fee => 'Additional charge';

  @override
  String get feeLabel => 'Charge label';

  @override
  String get feeAmount => 'Charge amount';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get total => 'Total';

  @override
  String get saveDraft => 'Save draft';

  @override
  String get markSent => 'Mark as sent';

  @override
  String get previewPdf => 'PDF preview';

  @override
  String get sharePdf => 'Share PDF';

  @override
  String get quoteSaved => 'Quote saved';

  @override
  String get discountTooHigh => 'The discount cannot exceed the subtotal.';

  @override
  String get invalidAmount => 'Enter a valid amount.';

  @override
  String get invalidQuantity => 'Enter a quantity greater than zero.';

  @override
  String get noMatches => 'No results';

  @override
  String get addedConcept => 'Item added';

  @override
  String get fieldRequired => 'Complete this field.';

  @override
  String get logoTooLarge => 'The logo must be smaller than 2 MB.';

  @override
  String get clientsTitle => 'Clients';

  @override
  String get searchClients => 'Search clients';

  @override
  String get emptyClientsTitle => 'No clients';

  @override
  String get emptyClientsBody => 'Save the contacts you quote for.';

  @override
  String get newClient => 'New client';

  @override
  String get editClient => 'Edit client';

  @override
  String get deleteClientTitle => 'Delete client?';

  @override
  String get deleteClientBody =>
      'Quotes already created keep the details they had at the time.';

  @override
  String get clientSaved => 'Client saved';

  @override
  String get clientQuotes => 'Quotes';

  @override
  String get noClientQuotes => 'This client has no quotes yet.';

  @override
  String get clientLimitTitle => 'Client limit';

  @override
  String get clientLimitBody =>
      'The free plan allows 20 clients. Pro removes the limit.';

  @override
  String get catalogTitle => 'Catalog';

  @override
  String get searchCatalog => 'Search the catalog';

  @override
  String get emptyCatalogTitle => 'Catalog is empty';

  @override
  String get emptyCatalogBody =>
      'Create services and materials to reuse them in quotes.';

  @override
  String get newItem => 'New item';

  @override
  String get editItem => 'Edit item';

  @override
  String get itemName => 'Name';

  @override
  String get itemDescription => 'Description';

  @override
  String get category => 'Category';

  @override
  String get allCategories => 'All';

  @override
  String get uncategorized => 'Uncategorized';

  @override
  String get price => 'Price';

  @override
  String get deleteItemTitle => 'Delete item?';

  @override
  String get deleteItemBody =>
      'Quotes that already use it keep their own copy.';

  @override
  String get itemSaved => 'Item saved';

  @override
  String get catalogLimitTitle => 'Catalog limit';

  @override
  String get catalogLimitBody =>
      'The free plan allows 30 items. Pro removes the limit.';

  @override
  String get kind => 'Type';

  @override
  String get businessProfile => 'Business profile';

  @override
  String get businessName => 'Business name';

  @override
  String get ownerName => 'Owner';

  @override
  String get website => 'Website';

  @override
  String get city => 'City';

  @override
  String get region => 'Region';

  @override
  String get postalCode => 'Postal code';

  @override
  String get country => 'Country';

  @override
  String get logo => 'Logo';

  @override
  String get chooseLogo => 'Choose logo';

  @override
  String get removeLogo => 'Remove logo';

  @override
  String get logoHint => 'Shown on the PDF with CotizaPro Pro.';

  @override
  String get currency => 'Currency';

  @override
  String get customCurrency => 'Other currency (ISO code)';

  @override
  String get invalidCurrency => 'Use a three-letter code, for example USD.';

  @override
  String get quotePrefix => 'Prefix';

  @override
  String get nextNumber => 'Next number';

  @override
  String get defaultTax => 'Default tax';

  @override
  String get validityDays => 'Validity days';

  @override
  String get defaultNotes => 'Default notes';

  @override
  String get defaultTerms => 'Default terms';

  @override
  String get tagline => 'Tagline';

  @override
  String get pdfFooter => 'Document footer';

  @override
  String get profileSaved => 'Profile saved';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get language => 'Language';

  @override
  String get languageSystem => 'System';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get languageEnglish => 'English';

  @override
  String get numbering => 'Numbering';

  @override
  String get pdfSection => 'PDF document';

  @override
  String get showNotes => 'Include notes';

  @override
  String get showTerms => 'Include terms';

  @override
  String get showLogo => 'Include logo';

  @override
  String get hideBranding => 'Remove CotizaPro branding';

  @override
  String get signatureLine => 'Acceptance line';

  @override
  String get showTagline => 'Include tagline';

  @override
  String get backup => 'Backups';

  @override
  String get about => 'About';

  @override
  String get versionLabel => 'Version';

  @override
  String get offlineNote =>
      'Your data stays on this device. CotizaPro works offline.';

  @override
  String get openPro => 'CotizaPro Pro';

  @override
  String get backupTitle => 'Backups';

  @override
  String get backupBody =>
      'Export or restore clients, catalog, quotes and the profile. The Pro purchase is not included: restore it from the store.';

  @override
  String get exportBackup => 'Export backup';

  @override
  String get importBackup => 'Import backup';

  @override
  String get importTitle => 'Replace the data on this device?';

  @override
  String get importBody =>
      'The backup will replace clients, catalog, quotes, profile and preferences. This cannot be undone.';

  @override
  String get exportDone => 'Backup ready to share';

  @override
  String get importDone => 'Backup imported';

  @override
  String get importInvalid => 'This file is not a valid CotizaPro backup.';

  @override
  String get backupWorking => 'Preparing backup';

  @override
  String get proTitle => 'CotizaPro Pro';

  @override
  String get proSubtitle => 'A one-time purchase for unlimited work.';

  @override
  String get proPriceNote =>
      'Indicative price: US\$5.99. The store shows the final price.';

  @override
  String get featureUnlimited => 'Unlimited quotes, clients and catalog';

  @override
  String get featureNoAds => 'No ads';

  @override
  String get featureNoBrand => 'PDF without CotizaPro branding';

  @override
  String get featureCustomize => 'Tagline, logo and acceptance line';

  @override
  String get featureLogo => 'Business logo on the document';

  @override
  String get featureHistory => 'Date filter and CSV export';

  @override
  String get buyPro => 'Buy Pro';

  @override
  String get restorePurchases => 'Restore purchases';

  @override
  String get proActiveTitle => 'Pro is active';

  @override
  String get proActiveBody =>
      'Limits and PDF branding are unlocked on this device.';

  @override
  String get productUnavailable =>
      'The product is not available in the store yet.';

  @override
  String get purchasePending => 'The purchase is waiting for confirmation.';

  @override
  String get purchaseCancelled => 'Purchase cancelled.';

  @override
  String get purchaseFailed => 'The purchase could not be confirmed.';

  @override
  String get storeUnavailable => 'The store is unavailable right now.';

  @override
  String get restoreEmpty => 'There is no Pro purchase to restore.';

  @override
  String get restoreDone => 'Purchase restored';

  @override
  String get priceFromStore => 'Store price';

  @override
  String get pdfQuote => 'Quotation';

  @override
  String get pdfBillTo => 'Bill to';

  @override
  String get pdfFrom => 'From';

  @override
  String get pdfNumber => 'Number';

  @override
  String get pdfIssueDate => 'Issued';

  @override
  String get pdfValidUntil => 'Valid until';

  @override
  String get pdfConcept => 'Description';

  @override
  String get pdfQty => 'Qty';

  @override
  String get pdfUnit => 'Unit';

  @override
  String get pdfPrice => 'Price';

  @override
  String get pdfAmount => 'Amount';

  @override
  String get pdfSubtotal => 'Subtotal';

  @override
  String get pdfDiscount => 'Discount';

  @override
  String get pdfTax => 'Tax';

  @override
  String get pdfFee => 'Charges';

  @override
  String get pdfTotal => 'Total';

  @override
  String get pdfNotes => 'Notes';

  @override
  String get pdfTerms => 'Terms';

  @override
  String get pdfMadeWith => 'Created with CotizaPro';

  @override
  String get pdfDraft => 'DRAFT';

  @override
  String get pdfAcceptedBy => 'Accepted by';

  @override
  String get pdfDate => 'Date';

  @override
  String get pdfSignature => 'Signature';

  @override
  String get changeStatus => 'Status';

  @override
  String get openQuote => 'Open';

  @override
  String get numberPreview =>
      'It will be assigned when you save if you leave it unchanged.';

  @override
  String get manualConcept => 'Manual item';

  @override
  String get apply => 'Apply';

  @override
  String get freeQuotesUsage => 'Free plan';

  @override
  String greetingNamed(String greeting, String name) {
    return '$greeting, $name';
  }

  @override
  String stepOf(int current, int total) {
    return '$current of $total';
  }

  @override
  String statAcceptedAmount(String currency) {
    return 'Accepted in $currency';
  }

  @override
  String pdfPage(int current, int total) {
    return 'Page $current of $total';
  }

  @override
  String freeUsage(int count, int limit) {
    return '$count of $limit on the free plan';
  }
}
