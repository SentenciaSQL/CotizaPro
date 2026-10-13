import 'package:drift/drift.dart';

@DataClassName('BusinessProfile')
class BusinessProfiles extends Table {
  IntColumn get id => integer()();
  TextColumn get businessName => text().withDefault(const Constant(''))();
  TextColumn get ownerName => text().withDefault(const Constant(''))();
  TextColumn get taxId => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get website => text().nullable()();
  TextColumn get addressLine => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get region => text().nullable()();
  TextColumn get postalCode => text().nullable()();
  TextColumn get country => text().nullable()();
  TextColumn get logoPath => text().nullable()();
  TextColumn get currencyCode => text().withDefault(const Constant('USD'))();
  TextColumn get quotePrefix => text().withDefault(const Constant('COT-'))();
  IntColumn get nextQuoteNumber => integer().withDefault(const Constant(1))();
  IntColumn get defaultTaxBps => integer().withDefault(const Constant(0))();
  IntColumn get defaultValidityDays =>
      integer().withDefault(const Constant(15))();
  TextColumn get defaultNotes => text().withDefault(const Constant(''))();
  TextColumn get defaultTerms => text().withDefault(const Constant(''))();
  TextColumn get pdfFooter => text().withDefault(const Constant(''))();
  TextColumn get tagline => text().withDefault(const Constant(''))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AppSetting')
class AppSettings extends Table {
  IntColumn get id => integer()();
  TextColumn get themeMode => text().withDefault(const Constant('system'))();
  TextColumn get localeCode => text().withDefault(const Constant(''))();
  BoolColumn get isPro => boolean().withDefault(const Constant(false))();
  TextColumn get proProductId => text().nullable()();
  TextColumn get proTransactionId => text().nullable()();
  DateTimeColumn get proUnlockedAt => dateTime().nullable()();
  BoolColumn get pdfShowNotes => boolean().withDefault(const Constant(true))();
  BoolColumn get pdfShowTerms => boolean().withDefault(const Constant(true))();
  BoolColumn get pdfShowLogo => boolean().withDefault(const Constant(true))();
  BoolColumn get pdfHideBranding =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get pdfShowSignature =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get pdfShowTagline =>
      boolean().withDefault(const Constant(true))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Client')
class Clients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get company => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get taxId => text().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('CatalogItem')
@TableIndex(name: 'idx_catalog_category', columns: {#category})
class CatalogItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get category => text().withDefault(const Constant(''))();
  TextColumn get unit => text().withDefault(const Constant('unit'))();
  IntColumn get unitPriceMinor => integer()();
  TextColumn get kind => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('Quotation')
@TableIndex(name: 'idx_quotes_client', columns: {#clientId})
@TableIndex(name: 'idx_quotes_updated', columns: {#updatedAt})
class Quotations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get number => text().unique()();
  TextColumn get status => text()();
  IntColumn get clientId => integer().nullable().references(
    Clients,
    #id,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get clientName => text()();
  TextColumn get clientCompany => text().nullable()();
  TextColumn get clientEmail => text().nullable()();
  TextColumn get clientPhone => text().nullable()();
  TextColumn get clientAddress => text().nullable()();
  TextColumn get clientTaxId => text().nullable()();
  DateTimeColumn get issueDate => dateTime()();
  DateTimeColumn get validUntil => dateTime()();
  TextColumn get currencyCode => text()();
  TextColumn get notes => text().withDefault(const Constant(''))();
  TextColumn get terms => text().withDefault(const Constant(''))();
  TextColumn get discountMode => text().withDefault(const Constant('none'))();
  IntColumn get discountBps => integer().withDefault(const Constant(0))();
  IntColumn get discountFixedMinor =>
      integer().withDefault(const Constant(0))();
  IntColumn get taxRateBps => integer().withDefault(const Constant(0))();
  TextColumn get feeLabel => text().withDefault(const Constant(''))();
  IntColumn get feeMinor => integer().withDefault(const Constant(0))();
  IntColumn get subtotalMinor => integer()();
  IntColumn get discountMinor => integer()();
  IntColumn get taxMinor => integer()();
  IntColumn get totalMinor => integer()();
  TextColumn get businessName => text().withDefault(const Constant(''))();
  TextColumn get businessOwner => text().withDefault(const Constant(''))();
  TextColumn get businessTaxId => text().nullable()();
  TextColumn get businessEmail => text().nullable()();
  TextColumn get businessPhone => text().nullable()();
  TextColumn get businessAddress => text().nullable()();
  TextColumn get businessWebsite => text().nullable()();
  TextColumn get businessTagline => text().withDefault(const Constant(''))();
  TextColumn get businessFooter => text().withDefault(const Constant(''))();
  TextColumn get logoSnapshotPath => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

@DataClassName('QuotationLine')
class QuotationLines extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get quotationId =>
      integer().references(Quotations, #id, onDelete: KeyAction.cascade)();
  IntColumn get position => integer()();
  IntColumn get catalogItemId => integer().nullable().references(
    CatalogItems,
    #id,
    onDelete: KeyAction.setNull,
  )();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get unit => text()();
  TextColumn get kind => text()();
  IntColumn get quantityMilli => integer()();
  IntColumn get unitPriceMinor => integer()();
  IntColumn get lineTotalMinor => integer()();
}
