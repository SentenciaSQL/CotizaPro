// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BusinessProfilesTable extends BusinessProfiles
    with TableInfo<$BusinessProfilesTable, BusinessProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _businessNameMeta = const VerificationMeta(
    'businessName',
  );
  @override
  late final GeneratedColumn<String> businessName = GeneratedColumn<String>(
    'business_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _ownerNameMeta = const VerificationMeta(
    'ownerName',
  );
  @override
  late final GeneratedColumn<String> ownerName = GeneratedColumn<String>(
    'owner_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _taxIdMeta = const VerificationMeta('taxId');
  @override
  late final GeneratedColumn<String> taxId = GeneratedColumn<String>(
    'tax_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _websiteMeta = const VerificationMeta(
    'website',
  );
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
    'website',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressLineMeta = const VerificationMeta(
    'addressLine',
  );
  @override
  late final GeneratedColumn<String> addressLine = GeneratedColumn<String>(
    'address_line',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
    'region',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _postalCodeMeta = const VerificationMeta(
    'postalCode',
  );
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
    'postal_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoPathMeta = const VerificationMeta(
    'logoPath',
  );
  @override
  late final GeneratedColumn<String> logoPath = GeneratedColumn<String>(
    'logo_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('USD'),
  );
  static const VerificationMeta _quotePrefixMeta = const VerificationMeta(
    'quotePrefix',
  );
  @override
  late final GeneratedColumn<String> quotePrefix = GeneratedColumn<String>(
    'quote_prefix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('COT-'),
  );
  static const VerificationMeta _nextQuoteNumberMeta = const VerificationMeta(
    'nextQuoteNumber',
  );
  @override
  late final GeneratedColumn<int> nextQuoteNumber = GeneratedColumn<int>(
    'next_quote_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _defaultTaxBpsMeta = const VerificationMeta(
    'defaultTaxBps',
  );
  @override
  late final GeneratedColumn<int> defaultTaxBps = GeneratedColumn<int>(
    'default_tax_bps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _defaultValidityDaysMeta =
      const VerificationMeta('defaultValidityDays');
  @override
  late final GeneratedColumn<int> defaultValidityDays = GeneratedColumn<int>(
    'default_validity_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(15),
  );
  static const VerificationMeta _defaultNotesMeta = const VerificationMeta(
    'defaultNotes',
  );
  @override
  late final GeneratedColumn<String> defaultNotes = GeneratedColumn<String>(
    'default_notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _defaultTermsMeta = const VerificationMeta(
    'defaultTerms',
  );
  @override
  late final GeneratedColumn<String> defaultTerms = GeneratedColumn<String>(
    'default_terms',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _pdfFooterMeta = const VerificationMeta(
    'pdfFooter',
  );
  @override
  late final GeneratedColumn<String> pdfFooter = GeneratedColumn<String>(
    'pdf_footer',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _taglineMeta = const VerificationMeta(
    'tagline',
  );
  @override
  late final GeneratedColumn<String> tagline = GeneratedColumn<String>(
    'tagline',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    businessName,
    ownerName,
    taxId,
    email,
    phone,
    website,
    addressLine,
    city,
    region,
    postalCode,
    country,
    logoPath,
    currencyCode,
    quotePrefix,
    nextQuoteNumber,
    defaultTaxBps,
    defaultValidityDays,
    defaultNotes,
    defaultTerms,
    pdfFooter,
    tagline,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'business_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<BusinessProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('business_name')) {
      context.handle(
        _businessNameMeta,
        businessName.isAcceptableOrUnknown(
          data['business_name']!,
          _businessNameMeta,
        ),
      );
    }
    if (data.containsKey('owner_name')) {
      context.handle(
        _ownerNameMeta,
        ownerName.isAcceptableOrUnknown(data['owner_name']!, _ownerNameMeta),
      );
    }
    if (data.containsKey('tax_id')) {
      context.handle(
        _taxIdMeta,
        taxId.isAcceptableOrUnknown(data['tax_id']!, _taxIdMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('website')) {
      context.handle(
        _websiteMeta,
        website.isAcceptableOrUnknown(data['website']!, _websiteMeta),
      );
    }
    if (data.containsKey('address_line')) {
      context.handle(
        _addressLineMeta,
        addressLine.isAcceptableOrUnknown(
          data['address_line']!,
          _addressLineMeta,
        ),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('region')) {
      context.handle(
        _regionMeta,
        region.isAcceptableOrUnknown(data['region']!, _regionMeta),
      );
    }
    if (data.containsKey('postal_code')) {
      context.handle(
        _postalCodeMeta,
        postalCode.isAcceptableOrUnknown(data['postal_code']!, _postalCodeMeta),
      );
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('logo_path')) {
      context.handle(
        _logoPathMeta,
        logoPath.isAcceptableOrUnknown(data['logo_path']!, _logoPathMeta),
      );
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    }
    if (data.containsKey('quote_prefix')) {
      context.handle(
        _quotePrefixMeta,
        quotePrefix.isAcceptableOrUnknown(
          data['quote_prefix']!,
          _quotePrefixMeta,
        ),
      );
    }
    if (data.containsKey('next_quote_number')) {
      context.handle(
        _nextQuoteNumberMeta,
        nextQuoteNumber.isAcceptableOrUnknown(
          data['next_quote_number']!,
          _nextQuoteNumberMeta,
        ),
      );
    }
    if (data.containsKey('default_tax_bps')) {
      context.handle(
        _defaultTaxBpsMeta,
        defaultTaxBps.isAcceptableOrUnknown(
          data['default_tax_bps']!,
          _defaultTaxBpsMeta,
        ),
      );
    }
    if (data.containsKey('default_validity_days')) {
      context.handle(
        _defaultValidityDaysMeta,
        defaultValidityDays.isAcceptableOrUnknown(
          data['default_validity_days']!,
          _defaultValidityDaysMeta,
        ),
      );
    }
    if (data.containsKey('default_notes')) {
      context.handle(
        _defaultNotesMeta,
        defaultNotes.isAcceptableOrUnknown(
          data['default_notes']!,
          _defaultNotesMeta,
        ),
      );
    }
    if (data.containsKey('default_terms')) {
      context.handle(
        _defaultTermsMeta,
        defaultTerms.isAcceptableOrUnknown(
          data['default_terms']!,
          _defaultTermsMeta,
        ),
      );
    }
    if (data.containsKey('pdf_footer')) {
      context.handle(
        _pdfFooterMeta,
        pdfFooter.isAcceptableOrUnknown(data['pdf_footer']!, _pdfFooterMeta),
      );
    }
    if (data.containsKey('tagline')) {
      context.handle(
        _taglineMeta,
        tagline.isAcceptableOrUnknown(data['tagline']!, _taglineMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      businessName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_name'],
      )!,
      ownerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_name'],
      )!,
      taxId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_id'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      website: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}website'],
      ),
      addressLine: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address_line'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      region: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region'],
      ),
      postalCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}postal_code'],
      ),
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      logoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_path'],
      ),
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      quotePrefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quote_prefix'],
      )!,
      nextQuoteNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_quote_number'],
      )!,
      defaultTaxBps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_tax_bps'],
      )!,
      defaultValidityDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_validity_days'],
      )!,
      defaultNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_notes'],
      )!,
      defaultTerms: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}default_terms'],
      )!,
      pdfFooter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pdf_footer'],
      )!,
      tagline: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tagline'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BusinessProfilesTable createAlias(String alias) {
    return $BusinessProfilesTable(attachedDatabase, alias);
  }
}

class BusinessProfile extends DataClass implements Insertable<BusinessProfile> {
  final int id;
  final String businessName;
  final String ownerName;
  final String? taxId;
  final String? email;
  final String? phone;
  final String? website;
  final String? addressLine;
  final String? city;
  final String? region;
  final String? postalCode;
  final String? country;
  final String? logoPath;
  final String currencyCode;
  final String quotePrefix;
  final int nextQuoteNumber;
  final int defaultTaxBps;
  final int defaultValidityDays;
  final String defaultNotes;
  final String defaultTerms;
  final String pdfFooter;
  final String tagline;
  final DateTime updatedAt;
  const BusinessProfile({
    required this.id,
    required this.businessName,
    required this.ownerName,
    this.taxId,
    this.email,
    this.phone,
    this.website,
    this.addressLine,
    this.city,
    this.region,
    this.postalCode,
    this.country,
    this.logoPath,
    required this.currencyCode,
    required this.quotePrefix,
    required this.nextQuoteNumber,
    required this.defaultTaxBps,
    required this.defaultValidityDays,
    required this.defaultNotes,
    required this.defaultTerms,
    required this.pdfFooter,
    required this.tagline,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['business_name'] = Variable<String>(businessName);
    map['owner_name'] = Variable<String>(ownerName);
    if (!nullToAbsent || taxId != null) {
      map['tax_id'] = Variable<String>(taxId);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || website != null) {
      map['website'] = Variable<String>(website);
    }
    if (!nullToAbsent || addressLine != null) {
      map['address_line'] = Variable<String>(addressLine);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || region != null) {
      map['region'] = Variable<String>(region);
    }
    if (!nullToAbsent || postalCode != null) {
      map['postal_code'] = Variable<String>(postalCode);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || logoPath != null) {
      map['logo_path'] = Variable<String>(logoPath);
    }
    map['currency_code'] = Variable<String>(currencyCode);
    map['quote_prefix'] = Variable<String>(quotePrefix);
    map['next_quote_number'] = Variable<int>(nextQuoteNumber);
    map['default_tax_bps'] = Variable<int>(defaultTaxBps);
    map['default_validity_days'] = Variable<int>(defaultValidityDays);
    map['default_notes'] = Variable<String>(defaultNotes);
    map['default_terms'] = Variable<String>(defaultTerms);
    map['pdf_footer'] = Variable<String>(pdfFooter);
    map['tagline'] = Variable<String>(tagline);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BusinessProfilesCompanion toCompanion(bool nullToAbsent) {
    return BusinessProfilesCompanion(
      id: Value(id),
      businessName: Value(businessName),
      ownerName: Value(ownerName),
      taxId: taxId == null && nullToAbsent
          ? const Value.absent()
          : Value(taxId),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      website: website == null && nullToAbsent
          ? const Value.absent()
          : Value(website),
      addressLine: addressLine == null && nullToAbsent
          ? const Value.absent()
          : Value(addressLine),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      region: region == null && nullToAbsent
          ? const Value.absent()
          : Value(region),
      postalCode: postalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(postalCode),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      logoPath: logoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(logoPath),
      currencyCode: Value(currencyCode),
      quotePrefix: Value(quotePrefix),
      nextQuoteNumber: Value(nextQuoteNumber),
      defaultTaxBps: Value(defaultTaxBps),
      defaultValidityDays: Value(defaultValidityDays),
      defaultNotes: Value(defaultNotes),
      defaultTerms: Value(defaultTerms),
      pdfFooter: Value(pdfFooter),
      tagline: Value(tagline),
      updatedAt: Value(updatedAt),
    );
  }

  factory BusinessProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessProfile(
      id: serializer.fromJson<int>(json['id']),
      businessName: serializer.fromJson<String>(json['businessName']),
      ownerName: serializer.fromJson<String>(json['ownerName']),
      taxId: serializer.fromJson<String?>(json['taxId']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      website: serializer.fromJson<String?>(json['website']),
      addressLine: serializer.fromJson<String?>(json['addressLine']),
      city: serializer.fromJson<String?>(json['city']),
      region: serializer.fromJson<String?>(json['region']),
      postalCode: serializer.fromJson<String?>(json['postalCode']),
      country: serializer.fromJson<String?>(json['country']),
      logoPath: serializer.fromJson<String?>(json['logoPath']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      quotePrefix: serializer.fromJson<String>(json['quotePrefix']),
      nextQuoteNumber: serializer.fromJson<int>(json['nextQuoteNumber']),
      defaultTaxBps: serializer.fromJson<int>(json['defaultTaxBps']),
      defaultValidityDays: serializer.fromJson<int>(
        json['defaultValidityDays'],
      ),
      defaultNotes: serializer.fromJson<String>(json['defaultNotes']),
      defaultTerms: serializer.fromJson<String>(json['defaultTerms']),
      pdfFooter: serializer.fromJson<String>(json['pdfFooter']),
      tagline: serializer.fromJson<String>(json['tagline']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'businessName': serializer.toJson<String>(businessName),
      'ownerName': serializer.toJson<String>(ownerName),
      'taxId': serializer.toJson<String?>(taxId),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'website': serializer.toJson<String?>(website),
      'addressLine': serializer.toJson<String?>(addressLine),
      'city': serializer.toJson<String?>(city),
      'region': serializer.toJson<String?>(region),
      'postalCode': serializer.toJson<String?>(postalCode),
      'country': serializer.toJson<String?>(country),
      'logoPath': serializer.toJson<String?>(logoPath),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'quotePrefix': serializer.toJson<String>(quotePrefix),
      'nextQuoteNumber': serializer.toJson<int>(nextQuoteNumber),
      'defaultTaxBps': serializer.toJson<int>(defaultTaxBps),
      'defaultValidityDays': serializer.toJson<int>(defaultValidityDays),
      'defaultNotes': serializer.toJson<String>(defaultNotes),
      'defaultTerms': serializer.toJson<String>(defaultTerms),
      'pdfFooter': serializer.toJson<String>(pdfFooter),
      'tagline': serializer.toJson<String>(tagline),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BusinessProfile copyWith({
    int? id,
    String? businessName,
    String? ownerName,
    Value<String?> taxId = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> website = const Value.absent(),
    Value<String?> addressLine = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<String?> region = const Value.absent(),
    Value<String?> postalCode = const Value.absent(),
    Value<String?> country = const Value.absent(),
    Value<String?> logoPath = const Value.absent(),
    String? currencyCode,
    String? quotePrefix,
    int? nextQuoteNumber,
    int? defaultTaxBps,
    int? defaultValidityDays,
    String? defaultNotes,
    String? defaultTerms,
    String? pdfFooter,
    String? tagline,
    DateTime? updatedAt,
  }) => BusinessProfile(
    id: id ?? this.id,
    businessName: businessName ?? this.businessName,
    ownerName: ownerName ?? this.ownerName,
    taxId: taxId.present ? taxId.value : this.taxId,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    website: website.present ? website.value : this.website,
    addressLine: addressLine.present ? addressLine.value : this.addressLine,
    city: city.present ? city.value : this.city,
    region: region.present ? region.value : this.region,
    postalCode: postalCode.present ? postalCode.value : this.postalCode,
    country: country.present ? country.value : this.country,
    logoPath: logoPath.present ? logoPath.value : this.logoPath,
    currencyCode: currencyCode ?? this.currencyCode,
    quotePrefix: quotePrefix ?? this.quotePrefix,
    nextQuoteNumber: nextQuoteNumber ?? this.nextQuoteNumber,
    defaultTaxBps: defaultTaxBps ?? this.defaultTaxBps,
    defaultValidityDays: defaultValidityDays ?? this.defaultValidityDays,
    defaultNotes: defaultNotes ?? this.defaultNotes,
    defaultTerms: defaultTerms ?? this.defaultTerms,
    pdfFooter: pdfFooter ?? this.pdfFooter,
    tagline: tagline ?? this.tagline,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BusinessProfile copyWithCompanion(BusinessProfilesCompanion data) {
    return BusinessProfile(
      id: data.id.present ? data.id.value : this.id,
      businessName: data.businessName.present
          ? data.businessName.value
          : this.businessName,
      ownerName: data.ownerName.present ? data.ownerName.value : this.ownerName,
      taxId: data.taxId.present ? data.taxId.value : this.taxId,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      website: data.website.present ? data.website.value : this.website,
      addressLine: data.addressLine.present
          ? data.addressLine.value
          : this.addressLine,
      city: data.city.present ? data.city.value : this.city,
      region: data.region.present ? data.region.value : this.region,
      postalCode: data.postalCode.present
          ? data.postalCode.value
          : this.postalCode,
      country: data.country.present ? data.country.value : this.country,
      logoPath: data.logoPath.present ? data.logoPath.value : this.logoPath,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      quotePrefix: data.quotePrefix.present
          ? data.quotePrefix.value
          : this.quotePrefix,
      nextQuoteNumber: data.nextQuoteNumber.present
          ? data.nextQuoteNumber.value
          : this.nextQuoteNumber,
      defaultTaxBps: data.defaultTaxBps.present
          ? data.defaultTaxBps.value
          : this.defaultTaxBps,
      defaultValidityDays: data.defaultValidityDays.present
          ? data.defaultValidityDays.value
          : this.defaultValidityDays,
      defaultNotes: data.defaultNotes.present
          ? data.defaultNotes.value
          : this.defaultNotes,
      defaultTerms: data.defaultTerms.present
          ? data.defaultTerms.value
          : this.defaultTerms,
      pdfFooter: data.pdfFooter.present ? data.pdfFooter.value : this.pdfFooter,
      tagline: data.tagline.present ? data.tagline.value : this.tagline,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessProfile(')
          ..write('id: $id, ')
          ..write('businessName: $businessName, ')
          ..write('ownerName: $ownerName, ')
          ..write('taxId: $taxId, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('website: $website, ')
          ..write('addressLine: $addressLine, ')
          ..write('city: $city, ')
          ..write('region: $region, ')
          ..write('postalCode: $postalCode, ')
          ..write('country: $country, ')
          ..write('logoPath: $logoPath, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('quotePrefix: $quotePrefix, ')
          ..write('nextQuoteNumber: $nextQuoteNumber, ')
          ..write('defaultTaxBps: $defaultTaxBps, ')
          ..write('defaultValidityDays: $defaultValidityDays, ')
          ..write('defaultNotes: $defaultNotes, ')
          ..write('defaultTerms: $defaultTerms, ')
          ..write('pdfFooter: $pdfFooter, ')
          ..write('tagline: $tagline, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    businessName,
    ownerName,
    taxId,
    email,
    phone,
    website,
    addressLine,
    city,
    region,
    postalCode,
    country,
    logoPath,
    currencyCode,
    quotePrefix,
    nextQuoteNumber,
    defaultTaxBps,
    defaultValidityDays,
    defaultNotes,
    defaultTerms,
    pdfFooter,
    tagline,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessProfile &&
          other.id == this.id &&
          other.businessName == this.businessName &&
          other.ownerName == this.ownerName &&
          other.taxId == this.taxId &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.website == this.website &&
          other.addressLine == this.addressLine &&
          other.city == this.city &&
          other.region == this.region &&
          other.postalCode == this.postalCode &&
          other.country == this.country &&
          other.logoPath == this.logoPath &&
          other.currencyCode == this.currencyCode &&
          other.quotePrefix == this.quotePrefix &&
          other.nextQuoteNumber == this.nextQuoteNumber &&
          other.defaultTaxBps == this.defaultTaxBps &&
          other.defaultValidityDays == this.defaultValidityDays &&
          other.defaultNotes == this.defaultNotes &&
          other.defaultTerms == this.defaultTerms &&
          other.pdfFooter == this.pdfFooter &&
          other.tagline == this.tagline &&
          other.updatedAt == this.updatedAt);
}

class BusinessProfilesCompanion extends UpdateCompanion<BusinessProfile> {
  final Value<int> id;
  final Value<String> businessName;
  final Value<String> ownerName;
  final Value<String?> taxId;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> website;
  final Value<String?> addressLine;
  final Value<String?> city;
  final Value<String?> region;
  final Value<String?> postalCode;
  final Value<String?> country;
  final Value<String?> logoPath;
  final Value<String> currencyCode;
  final Value<String> quotePrefix;
  final Value<int> nextQuoteNumber;
  final Value<int> defaultTaxBps;
  final Value<int> defaultValidityDays;
  final Value<String> defaultNotes;
  final Value<String> defaultTerms;
  final Value<String> pdfFooter;
  final Value<String> tagline;
  final Value<DateTime> updatedAt;
  const BusinessProfilesCompanion({
    this.id = const Value.absent(),
    this.businessName = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.taxId = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.website = const Value.absent(),
    this.addressLine = const Value.absent(),
    this.city = const Value.absent(),
    this.region = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.country = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.quotePrefix = const Value.absent(),
    this.nextQuoteNumber = const Value.absent(),
    this.defaultTaxBps = const Value.absent(),
    this.defaultValidityDays = const Value.absent(),
    this.defaultNotes = const Value.absent(),
    this.defaultTerms = const Value.absent(),
    this.pdfFooter = const Value.absent(),
    this.tagline = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BusinessProfilesCompanion.insert({
    this.id = const Value.absent(),
    this.businessName = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.taxId = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.website = const Value.absent(),
    this.addressLine = const Value.absent(),
    this.city = const Value.absent(),
    this.region = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.country = const Value.absent(),
    this.logoPath = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.quotePrefix = const Value.absent(),
    this.nextQuoteNumber = const Value.absent(),
    this.defaultTaxBps = const Value.absent(),
    this.defaultValidityDays = const Value.absent(),
    this.defaultNotes = const Value.absent(),
    this.defaultTerms = const Value.absent(),
    this.pdfFooter = const Value.absent(),
    this.tagline = const Value.absent(),
    required DateTime updatedAt,
  }) : updatedAt = Value(updatedAt);
  static Insertable<BusinessProfile> custom({
    Expression<int>? id,
    Expression<String>? businessName,
    Expression<String>? ownerName,
    Expression<String>? taxId,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? website,
    Expression<String>? addressLine,
    Expression<String>? city,
    Expression<String>? region,
    Expression<String>? postalCode,
    Expression<String>? country,
    Expression<String>? logoPath,
    Expression<String>? currencyCode,
    Expression<String>? quotePrefix,
    Expression<int>? nextQuoteNumber,
    Expression<int>? defaultTaxBps,
    Expression<int>? defaultValidityDays,
    Expression<String>? defaultNotes,
    Expression<String>? defaultTerms,
    Expression<String>? pdfFooter,
    Expression<String>? tagline,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (businessName != null) 'business_name': businessName,
      if (ownerName != null) 'owner_name': ownerName,
      if (taxId != null) 'tax_id': taxId,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (website != null) 'website': website,
      if (addressLine != null) 'address_line': addressLine,
      if (city != null) 'city': city,
      if (region != null) 'region': region,
      if (postalCode != null) 'postal_code': postalCode,
      if (country != null) 'country': country,
      if (logoPath != null) 'logo_path': logoPath,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (quotePrefix != null) 'quote_prefix': quotePrefix,
      if (nextQuoteNumber != null) 'next_quote_number': nextQuoteNumber,
      if (defaultTaxBps != null) 'default_tax_bps': defaultTaxBps,
      if (defaultValidityDays != null)
        'default_validity_days': defaultValidityDays,
      if (defaultNotes != null) 'default_notes': defaultNotes,
      if (defaultTerms != null) 'default_terms': defaultTerms,
      if (pdfFooter != null) 'pdf_footer': pdfFooter,
      if (tagline != null) 'tagline': tagline,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BusinessProfilesCompanion copyWith({
    Value<int>? id,
    Value<String>? businessName,
    Value<String>? ownerName,
    Value<String?>? taxId,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? website,
    Value<String?>? addressLine,
    Value<String?>? city,
    Value<String?>? region,
    Value<String?>? postalCode,
    Value<String?>? country,
    Value<String?>? logoPath,
    Value<String>? currencyCode,
    Value<String>? quotePrefix,
    Value<int>? nextQuoteNumber,
    Value<int>? defaultTaxBps,
    Value<int>? defaultValidityDays,
    Value<String>? defaultNotes,
    Value<String>? defaultTerms,
    Value<String>? pdfFooter,
    Value<String>? tagline,
    Value<DateTime>? updatedAt,
  }) {
    return BusinessProfilesCompanion(
      id: id ?? this.id,
      businessName: businessName ?? this.businessName,
      ownerName: ownerName ?? this.ownerName,
      taxId: taxId ?? this.taxId,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      addressLine: addressLine ?? this.addressLine,
      city: city ?? this.city,
      region: region ?? this.region,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      logoPath: logoPath ?? this.logoPath,
      currencyCode: currencyCode ?? this.currencyCode,
      quotePrefix: quotePrefix ?? this.quotePrefix,
      nextQuoteNumber: nextQuoteNumber ?? this.nextQuoteNumber,
      defaultTaxBps: defaultTaxBps ?? this.defaultTaxBps,
      defaultValidityDays: defaultValidityDays ?? this.defaultValidityDays,
      defaultNotes: defaultNotes ?? this.defaultNotes,
      defaultTerms: defaultTerms ?? this.defaultTerms,
      pdfFooter: pdfFooter ?? this.pdfFooter,
      tagline: tagline ?? this.tagline,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (businessName.present) {
      map['business_name'] = Variable<String>(businessName.value);
    }
    if (ownerName.present) {
      map['owner_name'] = Variable<String>(ownerName.value);
    }
    if (taxId.present) {
      map['tax_id'] = Variable<String>(taxId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (addressLine.present) {
      map['address_line'] = Variable<String>(addressLine.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (logoPath.present) {
      map['logo_path'] = Variable<String>(logoPath.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (quotePrefix.present) {
      map['quote_prefix'] = Variable<String>(quotePrefix.value);
    }
    if (nextQuoteNumber.present) {
      map['next_quote_number'] = Variable<int>(nextQuoteNumber.value);
    }
    if (defaultTaxBps.present) {
      map['default_tax_bps'] = Variable<int>(defaultTaxBps.value);
    }
    if (defaultValidityDays.present) {
      map['default_validity_days'] = Variable<int>(defaultValidityDays.value);
    }
    if (defaultNotes.present) {
      map['default_notes'] = Variable<String>(defaultNotes.value);
    }
    if (defaultTerms.present) {
      map['default_terms'] = Variable<String>(defaultTerms.value);
    }
    if (pdfFooter.present) {
      map['pdf_footer'] = Variable<String>(pdfFooter.value);
    }
    if (tagline.present) {
      map['tagline'] = Variable<String>(tagline.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessProfilesCompanion(')
          ..write('id: $id, ')
          ..write('businessName: $businessName, ')
          ..write('ownerName: $ownerName, ')
          ..write('taxId: $taxId, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('website: $website, ')
          ..write('addressLine: $addressLine, ')
          ..write('city: $city, ')
          ..write('region: $region, ')
          ..write('postalCode: $postalCode, ')
          ..write('country: $country, ')
          ..write('logoPath: $logoPath, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('quotePrefix: $quotePrefix, ')
          ..write('nextQuoteNumber: $nextQuoteNumber, ')
          ..write('defaultTaxBps: $defaultTaxBps, ')
          ..write('defaultValidityDays: $defaultValidityDays, ')
          ..write('defaultNotes: $defaultNotes, ')
          ..write('defaultTerms: $defaultTerms, ')
          ..write('pdfFooter: $pdfFooter, ')
          ..write('tagline: $tagline, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _themeModeMeta = const VerificationMeta(
    'themeMode',
  );
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
    'theme_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('system'),
  );
  static const VerificationMeta _localeCodeMeta = const VerificationMeta(
    'localeCode',
  );
  @override
  late final GeneratedColumn<String> localeCode = GeneratedColumn<String>(
    'locale_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _isProMeta = const VerificationMeta('isPro');
  @override
  late final GeneratedColumn<bool> isPro = GeneratedColumn<bool>(
    'is_pro',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_pro" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _proProductIdMeta = const VerificationMeta(
    'proProductId',
  );
  @override
  late final GeneratedColumn<String> proProductId = GeneratedColumn<String>(
    'pro_product_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _proTransactionIdMeta = const VerificationMeta(
    'proTransactionId',
  );
  @override
  late final GeneratedColumn<String> proTransactionId = GeneratedColumn<String>(
    'pro_transaction_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _proUnlockedAtMeta = const VerificationMeta(
    'proUnlockedAt',
  );
  @override
  late final GeneratedColumn<DateTime> proUnlockedAt =
      GeneratedColumn<DateTime>(
        'pro_unlocked_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _pdfShowNotesMeta = const VerificationMeta(
    'pdfShowNotes',
  );
  @override
  late final GeneratedColumn<bool> pdfShowNotes = GeneratedColumn<bool>(
    'pdf_show_notes',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pdf_show_notes" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _pdfShowTermsMeta = const VerificationMeta(
    'pdfShowTerms',
  );
  @override
  late final GeneratedColumn<bool> pdfShowTerms = GeneratedColumn<bool>(
    'pdf_show_terms',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pdf_show_terms" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _pdfShowLogoMeta = const VerificationMeta(
    'pdfShowLogo',
  );
  @override
  late final GeneratedColumn<bool> pdfShowLogo = GeneratedColumn<bool>(
    'pdf_show_logo',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pdf_show_logo" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _pdfHideBrandingMeta = const VerificationMeta(
    'pdfHideBranding',
  );
  @override
  late final GeneratedColumn<bool> pdfHideBranding = GeneratedColumn<bool>(
    'pdf_hide_branding',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pdf_hide_branding" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _pdfShowSignatureMeta = const VerificationMeta(
    'pdfShowSignature',
  );
  @override
  late final GeneratedColumn<bool> pdfShowSignature = GeneratedColumn<bool>(
    'pdf_show_signature',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pdf_show_signature" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _pdfShowTaglineMeta = const VerificationMeta(
    'pdfShowTagline',
  );
  @override
  late final GeneratedColumn<bool> pdfShowTagline = GeneratedColumn<bool>(
    'pdf_show_tagline',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pdf_show_tagline" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    themeMode,
    localeCode,
    isPro,
    proProductId,
    proTransactionId,
    proUnlockedAt,
    pdfShowNotes,
    pdfShowTerms,
    pdfShowLogo,
    pdfHideBranding,
    pdfShowSignature,
    pdfShowTagline,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('theme_mode')) {
      context.handle(
        _themeModeMeta,
        themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta),
      );
    }
    if (data.containsKey('locale_code')) {
      context.handle(
        _localeCodeMeta,
        localeCode.isAcceptableOrUnknown(data['locale_code']!, _localeCodeMeta),
      );
    }
    if (data.containsKey('is_pro')) {
      context.handle(
        _isProMeta,
        isPro.isAcceptableOrUnknown(data['is_pro']!, _isProMeta),
      );
    }
    if (data.containsKey('pro_product_id')) {
      context.handle(
        _proProductIdMeta,
        proProductId.isAcceptableOrUnknown(
          data['pro_product_id']!,
          _proProductIdMeta,
        ),
      );
    }
    if (data.containsKey('pro_transaction_id')) {
      context.handle(
        _proTransactionIdMeta,
        proTransactionId.isAcceptableOrUnknown(
          data['pro_transaction_id']!,
          _proTransactionIdMeta,
        ),
      );
    }
    if (data.containsKey('pro_unlocked_at')) {
      context.handle(
        _proUnlockedAtMeta,
        proUnlockedAt.isAcceptableOrUnknown(
          data['pro_unlocked_at']!,
          _proUnlockedAtMeta,
        ),
      );
    }
    if (data.containsKey('pdf_show_notes')) {
      context.handle(
        _pdfShowNotesMeta,
        pdfShowNotes.isAcceptableOrUnknown(
          data['pdf_show_notes']!,
          _pdfShowNotesMeta,
        ),
      );
    }
    if (data.containsKey('pdf_show_terms')) {
      context.handle(
        _pdfShowTermsMeta,
        pdfShowTerms.isAcceptableOrUnknown(
          data['pdf_show_terms']!,
          _pdfShowTermsMeta,
        ),
      );
    }
    if (data.containsKey('pdf_show_logo')) {
      context.handle(
        _pdfShowLogoMeta,
        pdfShowLogo.isAcceptableOrUnknown(
          data['pdf_show_logo']!,
          _pdfShowLogoMeta,
        ),
      );
    }
    if (data.containsKey('pdf_hide_branding')) {
      context.handle(
        _pdfHideBrandingMeta,
        pdfHideBranding.isAcceptableOrUnknown(
          data['pdf_hide_branding']!,
          _pdfHideBrandingMeta,
        ),
      );
    }
    if (data.containsKey('pdf_show_signature')) {
      context.handle(
        _pdfShowSignatureMeta,
        pdfShowSignature.isAcceptableOrUnknown(
          data['pdf_show_signature']!,
          _pdfShowSignatureMeta,
        ),
      );
    }
    if (data.containsKey('pdf_show_tagline')) {
      context.handle(
        _pdfShowTaglineMeta,
        pdfShowTagline.isAcceptableOrUnknown(
          data['pdf_show_tagline']!,
          _pdfShowTaglineMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      themeMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}theme_mode'],
      )!,
      localeCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}locale_code'],
      )!,
      isPro: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_pro'],
      )!,
      proProductId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pro_product_id'],
      ),
      proTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pro_transaction_id'],
      ),
      proUnlockedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}pro_unlocked_at'],
      ),
      pdfShowNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pdf_show_notes'],
      )!,
      pdfShowTerms: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pdf_show_terms'],
      )!,
      pdfShowLogo: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pdf_show_logo'],
      )!,
      pdfHideBranding: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pdf_hide_branding'],
      )!,
      pdfShowSignature: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pdf_show_signature'],
      )!,
      pdfShowTagline: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pdf_show_tagline'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int id;
  final String themeMode;
  final String localeCode;
  final bool isPro;
  final String? proProductId;
  final String? proTransactionId;
  final DateTime? proUnlockedAt;
  final bool pdfShowNotes;
  final bool pdfShowTerms;
  final bool pdfShowLogo;
  final bool pdfHideBranding;
  final bool pdfShowSignature;
  final bool pdfShowTagline;
  final DateTime updatedAt;
  const AppSetting({
    required this.id,
    required this.themeMode,
    required this.localeCode,
    required this.isPro,
    this.proProductId,
    this.proTransactionId,
    this.proUnlockedAt,
    required this.pdfShowNotes,
    required this.pdfShowTerms,
    required this.pdfShowLogo,
    required this.pdfHideBranding,
    required this.pdfShowSignature,
    required this.pdfShowTagline,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['theme_mode'] = Variable<String>(themeMode);
    map['locale_code'] = Variable<String>(localeCode);
    map['is_pro'] = Variable<bool>(isPro);
    if (!nullToAbsent || proProductId != null) {
      map['pro_product_id'] = Variable<String>(proProductId);
    }
    if (!nullToAbsent || proTransactionId != null) {
      map['pro_transaction_id'] = Variable<String>(proTransactionId);
    }
    if (!nullToAbsent || proUnlockedAt != null) {
      map['pro_unlocked_at'] = Variable<DateTime>(proUnlockedAt);
    }
    map['pdf_show_notes'] = Variable<bool>(pdfShowNotes);
    map['pdf_show_terms'] = Variable<bool>(pdfShowTerms);
    map['pdf_show_logo'] = Variable<bool>(pdfShowLogo);
    map['pdf_hide_branding'] = Variable<bool>(pdfHideBranding);
    map['pdf_show_signature'] = Variable<bool>(pdfShowSignature);
    map['pdf_show_tagline'] = Variable<bool>(pdfShowTagline);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      themeMode: Value(themeMode),
      localeCode: Value(localeCode),
      isPro: Value(isPro),
      proProductId: proProductId == null && nullToAbsent
          ? const Value.absent()
          : Value(proProductId),
      proTransactionId: proTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(proTransactionId),
      proUnlockedAt: proUnlockedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(proUnlockedAt),
      pdfShowNotes: Value(pdfShowNotes),
      pdfShowTerms: Value(pdfShowTerms),
      pdfShowLogo: Value(pdfShowLogo),
      pdfHideBranding: Value(pdfHideBranding),
      pdfShowSignature: Value(pdfShowSignature),
      pdfShowTagline: Value(pdfShowTagline),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      localeCode: serializer.fromJson<String>(json['localeCode']),
      isPro: serializer.fromJson<bool>(json['isPro']),
      proProductId: serializer.fromJson<String?>(json['proProductId']),
      proTransactionId: serializer.fromJson<String?>(json['proTransactionId']),
      proUnlockedAt: serializer.fromJson<DateTime?>(json['proUnlockedAt']),
      pdfShowNotes: serializer.fromJson<bool>(json['pdfShowNotes']),
      pdfShowTerms: serializer.fromJson<bool>(json['pdfShowTerms']),
      pdfShowLogo: serializer.fromJson<bool>(json['pdfShowLogo']),
      pdfHideBranding: serializer.fromJson<bool>(json['pdfHideBranding']),
      pdfShowSignature: serializer.fromJson<bool>(json['pdfShowSignature']),
      pdfShowTagline: serializer.fromJson<bool>(json['pdfShowTagline']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'themeMode': serializer.toJson<String>(themeMode),
      'localeCode': serializer.toJson<String>(localeCode),
      'isPro': serializer.toJson<bool>(isPro),
      'proProductId': serializer.toJson<String?>(proProductId),
      'proTransactionId': serializer.toJson<String?>(proTransactionId),
      'proUnlockedAt': serializer.toJson<DateTime?>(proUnlockedAt),
      'pdfShowNotes': serializer.toJson<bool>(pdfShowNotes),
      'pdfShowTerms': serializer.toJson<bool>(pdfShowTerms),
      'pdfShowLogo': serializer.toJson<bool>(pdfShowLogo),
      'pdfHideBranding': serializer.toJson<bool>(pdfHideBranding),
      'pdfShowSignature': serializer.toJson<bool>(pdfShowSignature),
      'pdfShowTagline': serializer.toJson<bool>(pdfShowTagline),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith({
    int? id,
    String? themeMode,
    String? localeCode,
    bool? isPro,
    Value<String?> proProductId = const Value.absent(),
    Value<String?> proTransactionId = const Value.absent(),
    Value<DateTime?> proUnlockedAt = const Value.absent(),
    bool? pdfShowNotes,
    bool? pdfShowTerms,
    bool? pdfShowLogo,
    bool? pdfHideBranding,
    bool? pdfShowSignature,
    bool? pdfShowTagline,
    DateTime? updatedAt,
  }) => AppSetting(
    id: id ?? this.id,
    themeMode: themeMode ?? this.themeMode,
    localeCode: localeCode ?? this.localeCode,
    isPro: isPro ?? this.isPro,
    proProductId: proProductId.present ? proProductId.value : this.proProductId,
    proTransactionId: proTransactionId.present
        ? proTransactionId.value
        : this.proTransactionId,
    proUnlockedAt: proUnlockedAt.present
        ? proUnlockedAt.value
        : this.proUnlockedAt,
    pdfShowNotes: pdfShowNotes ?? this.pdfShowNotes,
    pdfShowTerms: pdfShowTerms ?? this.pdfShowTerms,
    pdfShowLogo: pdfShowLogo ?? this.pdfShowLogo,
    pdfHideBranding: pdfHideBranding ?? this.pdfHideBranding,
    pdfShowSignature: pdfShowSignature ?? this.pdfShowSignature,
    pdfShowTagline: pdfShowTagline ?? this.pdfShowTagline,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      localeCode: data.localeCode.present
          ? data.localeCode.value
          : this.localeCode,
      isPro: data.isPro.present ? data.isPro.value : this.isPro,
      proProductId: data.proProductId.present
          ? data.proProductId.value
          : this.proProductId,
      proTransactionId: data.proTransactionId.present
          ? data.proTransactionId.value
          : this.proTransactionId,
      proUnlockedAt: data.proUnlockedAt.present
          ? data.proUnlockedAt.value
          : this.proUnlockedAt,
      pdfShowNotes: data.pdfShowNotes.present
          ? data.pdfShowNotes.value
          : this.pdfShowNotes,
      pdfShowTerms: data.pdfShowTerms.present
          ? data.pdfShowTerms.value
          : this.pdfShowTerms,
      pdfShowLogo: data.pdfShowLogo.present
          ? data.pdfShowLogo.value
          : this.pdfShowLogo,
      pdfHideBranding: data.pdfHideBranding.present
          ? data.pdfHideBranding.value
          : this.pdfHideBranding,
      pdfShowSignature: data.pdfShowSignature.present
          ? data.pdfShowSignature.value
          : this.pdfShowSignature,
      pdfShowTagline: data.pdfShowTagline.present
          ? data.pdfShowTagline.value
          : this.pdfShowTagline,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('localeCode: $localeCode, ')
          ..write('isPro: $isPro, ')
          ..write('proProductId: $proProductId, ')
          ..write('proTransactionId: $proTransactionId, ')
          ..write('proUnlockedAt: $proUnlockedAt, ')
          ..write('pdfShowNotes: $pdfShowNotes, ')
          ..write('pdfShowTerms: $pdfShowTerms, ')
          ..write('pdfShowLogo: $pdfShowLogo, ')
          ..write('pdfHideBranding: $pdfHideBranding, ')
          ..write('pdfShowSignature: $pdfShowSignature, ')
          ..write('pdfShowTagline: $pdfShowTagline, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    themeMode,
    localeCode,
    isPro,
    proProductId,
    proTransactionId,
    proUnlockedAt,
    pdfShowNotes,
    pdfShowTerms,
    pdfShowLogo,
    pdfHideBranding,
    pdfShowSignature,
    pdfShowTagline,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.themeMode == this.themeMode &&
          other.localeCode == this.localeCode &&
          other.isPro == this.isPro &&
          other.proProductId == this.proProductId &&
          other.proTransactionId == this.proTransactionId &&
          other.proUnlockedAt == this.proUnlockedAt &&
          other.pdfShowNotes == this.pdfShowNotes &&
          other.pdfShowTerms == this.pdfShowTerms &&
          other.pdfShowLogo == this.pdfShowLogo &&
          other.pdfHideBranding == this.pdfHideBranding &&
          other.pdfShowSignature == this.pdfShowSignature &&
          other.pdfShowTagline == this.pdfShowTagline &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<String> themeMode;
  final Value<String> localeCode;
  final Value<bool> isPro;
  final Value<String?> proProductId;
  final Value<String?> proTransactionId;
  final Value<DateTime?> proUnlockedAt;
  final Value<bool> pdfShowNotes;
  final Value<bool> pdfShowTerms;
  final Value<bool> pdfShowLogo;
  final Value<bool> pdfHideBranding;
  final Value<bool> pdfShowSignature;
  final Value<bool> pdfShowTagline;
  final Value<DateTime> updatedAt;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.localeCode = const Value.absent(),
    this.isPro = const Value.absent(),
    this.proProductId = const Value.absent(),
    this.proTransactionId = const Value.absent(),
    this.proUnlockedAt = const Value.absent(),
    this.pdfShowNotes = const Value.absent(),
    this.pdfShowTerms = const Value.absent(),
    this.pdfShowLogo = const Value.absent(),
    this.pdfHideBranding = const Value.absent(),
    this.pdfShowSignature = const Value.absent(),
    this.pdfShowTagline = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.localeCode = const Value.absent(),
    this.isPro = const Value.absent(),
    this.proProductId = const Value.absent(),
    this.proTransactionId = const Value.absent(),
    this.proUnlockedAt = const Value.absent(),
    this.pdfShowNotes = const Value.absent(),
    this.pdfShowTerms = const Value.absent(),
    this.pdfShowLogo = const Value.absent(),
    this.pdfHideBranding = const Value.absent(),
    this.pdfShowSignature = const Value.absent(),
    this.pdfShowTagline = const Value.absent(),
    required DateTime updatedAt,
  }) : updatedAt = Value(updatedAt);
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<String>? themeMode,
    Expression<String>? localeCode,
    Expression<bool>? isPro,
    Expression<String>? proProductId,
    Expression<String>? proTransactionId,
    Expression<DateTime>? proUnlockedAt,
    Expression<bool>? pdfShowNotes,
    Expression<bool>? pdfShowTerms,
    Expression<bool>? pdfShowLogo,
    Expression<bool>? pdfHideBranding,
    Expression<bool>? pdfShowSignature,
    Expression<bool>? pdfShowTagline,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (themeMode != null) 'theme_mode': themeMode,
      if (localeCode != null) 'locale_code': localeCode,
      if (isPro != null) 'is_pro': isPro,
      if (proProductId != null) 'pro_product_id': proProductId,
      if (proTransactionId != null) 'pro_transaction_id': proTransactionId,
      if (proUnlockedAt != null) 'pro_unlocked_at': proUnlockedAt,
      if (pdfShowNotes != null) 'pdf_show_notes': pdfShowNotes,
      if (pdfShowTerms != null) 'pdf_show_terms': pdfShowTerms,
      if (pdfShowLogo != null) 'pdf_show_logo': pdfShowLogo,
      if (pdfHideBranding != null) 'pdf_hide_branding': pdfHideBranding,
      if (pdfShowSignature != null) 'pdf_show_signature': pdfShowSignature,
      if (pdfShowTagline != null) 'pdf_show_tagline': pdfShowTagline,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AppSettingsCompanion copyWith({
    Value<int>? id,
    Value<String>? themeMode,
    Value<String>? localeCode,
    Value<bool>? isPro,
    Value<String?>? proProductId,
    Value<String?>? proTransactionId,
    Value<DateTime?>? proUnlockedAt,
    Value<bool>? pdfShowNotes,
    Value<bool>? pdfShowTerms,
    Value<bool>? pdfShowLogo,
    Value<bool>? pdfHideBranding,
    Value<bool>? pdfShowSignature,
    Value<bool>? pdfShowTagline,
    Value<DateTime>? updatedAt,
  }) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      themeMode: themeMode ?? this.themeMode,
      localeCode: localeCode ?? this.localeCode,
      isPro: isPro ?? this.isPro,
      proProductId: proProductId ?? this.proProductId,
      proTransactionId: proTransactionId ?? this.proTransactionId,
      proUnlockedAt: proUnlockedAt ?? this.proUnlockedAt,
      pdfShowNotes: pdfShowNotes ?? this.pdfShowNotes,
      pdfShowTerms: pdfShowTerms ?? this.pdfShowTerms,
      pdfShowLogo: pdfShowLogo ?? this.pdfShowLogo,
      pdfHideBranding: pdfHideBranding ?? this.pdfHideBranding,
      pdfShowSignature: pdfShowSignature ?? this.pdfShowSignature,
      pdfShowTagline: pdfShowTagline ?? this.pdfShowTagline,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (localeCode.present) {
      map['locale_code'] = Variable<String>(localeCode.value);
    }
    if (isPro.present) {
      map['is_pro'] = Variable<bool>(isPro.value);
    }
    if (proProductId.present) {
      map['pro_product_id'] = Variable<String>(proProductId.value);
    }
    if (proTransactionId.present) {
      map['pro_transaction_id'] = Variable<String>(proTransactionId.value);
    }
    if (proUnlockedAt.present) {
      map['pro_unlocked_at'] = Variable<DateTime>(proUnlockedAt.value);
    }
    if (pdfShowNotes.present) {
      map['pdf_show_notes'] = Variable<bool>(pdfShowNotes.value);
    }
    if (pdfShowTerms.present) {
      map['pdf_show_terms'] = Variable<bool>(pdfShowTerms.value);
    }
    if (pdfShowLogo.present) {
      map['pdf_show_logo'] = Variable<bool>(pdfShowLogo.value);
    }
    if (pdfHideBranding.present) {
      map['pdf_hide_branding'] = Variable<bool>(pdfHideBranding.value);
    }
    if (pdfShowSignature.present) {
      map['pdf_show_signature'] = Variable<bool>(pdfShowSignature.value);
    }
    if (pdfShowTagline.present) {
      map['pdf_show_tagline'] = Variable<bool>(pdfShowTagline.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('localeCode: $localeCode, ')
          ..write('isPro: $isPro, ')
          ..write('proProductId: $proProductId, ')
          ..write('proTransactionId: $proTransactionId, ')
          ..write('proUnlockedAt: $proUnlockedAt, ')
          ..write('pdfShowNotes: $pdfShowNotes, ')
          ..write('pdfShowTerms: $pdfShowTerms, ')
          ..write('pdfShowLogo: $pdfShowLogo, ')
          ..write('pdfHideBranding: $pdfHideBranding, ')
          ..write('pdfShowSignature: $pdfShowSignature, ')
          ..write('pdfShowTagline: $pdfShowTagline, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ClientsTable extends Clients with TableInfo<$ClientsTable, Client> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _companyMeta = const VerificationMeta(
    'company',
  );
  @override
  late final GeneratedColumn<String> company = GeneratedColumn<String>(
    'company',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taxIdMeta = const VerificationMeta('taxId');
  @override
  late final GeneratedColumn<String> taxId = GeneratedColumn<String>(
    'tax_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    company,
    email,
    phone,
    address,
    taxId,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients';
  @override
  VerificationContext validateIntegrity(
    Insertable<Client> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('company')) {
      context.handle(
        _companyMeta,
        company.isAcceptableOrUnknown(data['company']!, _companyMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('tax_id')) {
      context.handle(
        _taxIdMeta,
        taxId.isAcceptableOrUnknown(data['tax_id']!, _taxIdMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Client map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Client(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      company: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}company'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      taxId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ClientsTable createAlias(String alias) {
    return $ClientsTable(attachedDatabase, alias);
  }
}

class Client extends DataClass implements Insertable<Client> {
  final int id;
  final String name;
  final String? company;
  final String? email;
  final String? phone;
  final String? address;
  final String? taxId;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Client({
    required this.id,
    required this.name,
    this.company,
    this.email,
    this.phone,
    this.address,
    this.taxId,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || company != null) {
      map['company'] = Variable<String>(company);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || taxId != null) {
      map['tax_id'] = Variable<String>(taxId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ClientsCompanion toCompanion(bool nullToAbsent) {
    return ClientsCompanion(
      id: Value(id),
      name: Value(name),
      company: company == null && nullToAbsent
          ? const Value.absent()
          : Value(company),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      taxId: taxId == null && nullToAbsent
          ? const Value.absent()
          : Value(taxId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Client.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Client(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      company: serializer.fromJson<String?>(json['company']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      address: serializer.fromJson<String?>(json['address']),
      taxId: serializer.fromJson<String?>(json['taxId']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'company': serializer.toJson<String?>(company),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'address': serializer.toJson<String?>(address),
      'taxId': serializer.toJson<String?>(taxId),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Client copyWith({
    int? id,
    String? name,
    Value<String?> company = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> taxId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Client(
    id: id ?? this.id,
    name: name ?? this.name,
    company: company.present ? company.value : this.company,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    address: address.present ? address.value : this.address,
    taxId: taxId.present ? taxId.value : this.taxId,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Client copyWithCompanion(ClientsCompanion data) {
    return Client(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      company: data.company.present ? data.company.value : this.company,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      taxId: data.taxId.present ? data.taxId.value : this.taxId,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Client(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('company: $company, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('taxId: $taxId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    company,
    email,
    phone,
    address,
    taxId,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Client &&
          other.id == this.id &&
          other.name == this.name &&
          other.company == this.company &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.taxId == this.taxId &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ClientsCompanion extends UpdateCompanion<Client> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> company;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> address;
  final Value<String?> taxId;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.company = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.taxId = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ClientsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.company = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.taxId = const Value.absent(),
    this.notes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Client> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? company,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<String>? taxId,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (company != null) 'company': company,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (taxId != null) 'tax_id': taxId,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ClientsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? company,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? address,
    Value<String?>? taxId,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return ClientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      company: company ?? this.company,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      taxId: taxId ?? this.taxId,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (company.present) {
      map['company'] = Variable<String>(company.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (taxId.present) {
      map['tax_id'] = Variable<String>(taxId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('company: $company, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('taxId: $taxId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CatalogItemsTable extends CatalogItems
    with TableInfo<$CatalogItemsTable, CatalogItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatalogItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unit'),
  );
  static const VerificationMeta _unitPriceMinorMeta = const VerificationMeta(
    'unitPriceMinor',
  );
  @override
  late final GeneratedColumn<int> unitPriceMinor = GeneratedColumn<int>(
    'unit_price_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    category,
    unit,
    unitPriceMinor,
    kind,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'catalog_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CatalogItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    }
    if (data.containsKey('unit_price_minor')) {
      context.handle(
        _unitPriceMinorMeta,
        unitPriceMinor.isAcceptableOrUnknown(
          data['unit_price_minor']!,
          _unitPriceMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMinorMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CatalogItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CatalogItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      unitPriceMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price_minor'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CatalogItemsTable createAlias(String alias) {
    return $CatalogItemsTable(attachedDatabase, alias);
  }
}

class CatalogItem extends DataClass implements Insertable<CatalogItem> {
  final int id;
  final String name;
  final String? description;
  final String category;
  final String unit;
  final int unitPriceMinor;
  final String kind;
  final DateTime createdAt;
  final DateTime updatedAt;
  const CatalogItem({
    required this.id,
    required this.name,
    this.description,
    required this.category,
    required this.unit,
    required this.unitPriceMinor,
    required this.kind,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['category'] = Variable<String>(category);
    map['unit'] = Variable<String>(unit);
    map['unit_price_minor'] = Variable<int>(unitPriceMinor);
    map['kind'] = Variable<String>(kind);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CatalogItemsCompanion toCompanion(bool nullToAbsent) {
    return CatalogItemsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      category: Value(category),
      unit: Value(unit),
      unitPriceMinor: Value(unitPriceMinor),
      kind: Value(kind),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CatalogItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CatalogItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      category: serializer.fromJson<String>(json['category']),
      unit: serializer.fromJson<String>(json['unit']),
      unitPriceMinor: serializer.fromJson<int>(json['unitPriceMinor']),
      kind: serializer.fromJson<String>(json['kind']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'category': serializer.toJson<String>(category),
      'unit': serializer.toJson<String>(unit),
      'unitPriceMinor': serializer.toJson<int>(unitPriceMinor),
      'kind': serializer.toJson<String>(kind),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CatalogItem copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
    String? category,
    String? unit,
    int? unitPriceMinor,
    String? kind,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => CatalogItem(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    category: category ?? this.category,
    unit: unit ?? this.unit,
    unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
    kind: kind ?? this.kind,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CatalogItem copyWithCompanion(CatalogItemsCompanion data) {
    return CatalogItem(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      category: data.category.present ? data.category.value : this.category,
      unit: data.unit.present ? data.unit.value : this.unit,
      unitPriceMinor: data.unitPriceMinor.present
          ? data.unitPriceMinor.value
          : this.unitPriceMinor,
      kind: data.kind.present ? data.kind.value : this.kind,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CatalogItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('unit: $unit, ')
          ..write('unitPriceMinor: $unitPriceMinor, ')
          ..write('kind: $kind, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    category,
    unit,
    unitPriceMinor,
    kind,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatalogItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.category == this.category &&
          other.unit == this.unit &&
          other.unitPriceMinor == this.unitPriceMinor &&
          other.kind == this.kind &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CatalogItemsCompanion extends UpdateCompanion<CatalogItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> category;
  final Value<String> unit;
  final Value<int> unitPriceMinor;
  final Value<String> kind;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CatalogItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.unit = const Value.absent(),
    this.unitPriceMinor = const Value.absent(),
    this.kind = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CatalogItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.category = const Value.absent(),
    this.unit = const Value.absent(),
    required int unitPriceMinor,
    required String kind,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : name = Value(name),
       unitPriceMinor = Value(unitPriceMinor),
       kind = Value(kind),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CatalogItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? category,
    Expression<String>? unit,
    Expression<int>? unitPriceMinor,
    Expression<String>? kind,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (category != null) 'category': category,
      if (unit != null) 'unit': unit,
      if (unitPriceMinor != null) 'unit_price_minor': unitPriceMinor,
      if (kind != null) 'kind': kind,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CatalogItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<String>? category,
    Value<String>? unit,
    Value<int>? unitPriceMinor,
    Value<String>? kind,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return CatalogItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      unit: unit ?? this.unit,
      unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
      kind: kind ?? this.kind,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (unitPriceMinor.present) {
      map['unit_price_minor'] = Variable<int>(unitPriceMinor.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatalogItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('category: $category, ')
          ..write('unit: $unit, ')
          ..write('unitPriceMinor: $unitPriceMinor, ')
          ..write('kind: $kind, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $QuotationsTable extends Quotations
    with TableInfo<$QuotationsTable, Quotation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuotationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
    'client_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clients (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _clientNameMeta = const VerificationMeta(
    'clientName',
  );
  @override
  late final GeneratedColumn<String> clientName = GeneratedColumn<String>(
    'client_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientCompanyMeta = const VerificationMeta(
    'clientCompany',
  );
  @override
  late final GeneratedColumn<String> clientCompany = GeneratedColumn<String>(
    'client_company',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clientEmailMeta = const VerificationMeta(
    'clientEmail',
  );
  @override
  late final GeneratedColumn<String> clientEmail = GeneratedColumn<String>(
    'client_email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clientPhoneMeta = const VerificationMeta(
    'clientPhone',
  );
  @override
  late final GeneratedColumn<String> clientPhone = GeneratedColumn<String>(
    'client_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clientAddressMeta = const VerificationMeta(
    'clientAddress',
  );
  @override
  late final GeneratedColumn<String> clientAddress = GeneratedColumn<String>(
    'client_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _clientTaxIdMeta = const VerificationMeta(
    'clientTaxId',
  );
  @override
  late final GeneratedColumn<String> clientTaxId = GeneratedColumn<String>(
    'client_tax_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _issueDateMeta = const VerificationMeta(
    'issueDate',
  );
  @override
  late final GeneratedColumn<DateTime> issueDate = GeneratedColumn<DateTime>(
    'issue_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _validUntilMeta = const VerificationMeta(
    'validUntil',
  );
  @override
  late final GeneratedColumn<DateTime> validUntil = GeneratedColumn<DateTime>(
    'valid_until',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _termsMeta = const VerificationMeta('terms');
  @override
  late final GeneratedColumn<String> terms = GeneratedColumn<String>(
    'terms',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _discountModeMeta = const VerificationMeta(
    'discountMode',
  );
  @override
  late final GeneratedColumn<String> discountMode = GeneratedColumn<String>(
    'discount_mode',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('none'),
  );
  static const VerificationMeta _discountBpsMeta = const VerificationMeta(
    'discountBps',
  );
  @override
  late final GeneratedColumn<int> discountBps = GeneratedColumn<int>(
    'discount_bps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _discountFixedMinorMeta =
      const VerificationMeta('discountFixedMinor');
  @override
  late final GeneratedColumn<int> discountFixedMinor = GeneratedColumn<int>(
    'discount_fixed_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _taxRateBpsMeta = const VerificationMeta(
    'taxRateBps',
  );
  @override
  late final GeneratedColumn<int> taxRateBps = GeneratedColumn<int>(
    'tax_rate_bps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _feeLabelMeta = const VerificationMeta(
    'feeLabel',
  );
  @override
  late final GeneratedColumn<String> feeLabel = GeneratedColumn<String>(
    'fee_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _feeMinorMeta = const VerificationMeta(
    'feeMinor',
  );
  @override
  late final GeneratedColumn<int> feeMinor = GeneratedColumn<int>(
    'fee_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _subtotalMinorMeta = const VerificationMeta(
    'subtotalMinor',
  );
  @override
  late final GeneratedColumn<int> subtotalMinor = GeneratedColumn<int>(
    'subtotal_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountMinorMeta = const VerificationMeta(
    'discountMinor',
  );
  @override
  late final GeneratedColumn<int> discountMinor = GeneratedColumn<int>(
    'discount_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taxMinorMeta = const VerificationMeta(
    'taxMinor',
  );
  @override
  late final GeneratedColumn<int> taxMinor = GeneratedColumn<int>(
    'tax_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMinorMeta = const VerificationMeta(
    'totalMinor',
  );
  @override
  late final GeneratedColumn<int> totalMinor = GeneratedColumn<int>(
    'total_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessNameMeta = const VerificationMeta(
    'businessName',
  );
  @override
  late final GeneratedColumn<String> businessName = GeneratedColumn<String>(
    'business_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _businessOwnerMeta = const VerificationMeta(
    'businessOwner',
  );
  @override
  late final GeneratedColumn<String> businessOwner = GeneratedColumn<String>(
    'business_owner',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _businessTaxIdMeta = const VerificationMeta(
    'businessTaxId',
  );
  @override
  late final GeneratedColumn<String> businessTaxId = GeneratedColumn<String>(
    'business_tax_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _businessEmailMeta = const VerificationMeta(
    'businessEmail',
  );
  @override
  late final GeneratedColumn<String> businessEmail = GeneratedColumn<String>(
    'business_email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _businessPhoneMeta = const VerificationMeta(
    'businessPhone',
  );
  @override
  late final GeneratedColumn<String> businessPhone = GeneratedColumn<String>(
    'business_phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _businessAddressMeta = const VerificationMeta(
    'businessAddress',
  );
  @override
  late final GeneratedColumn<String> businessAddress = GeneratedColumn<String>(
    'business_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _businessWebsiteMeta = const VerificationMeta(
    'businessWebsite',
  );
  @override
  late final GeneratedColumn<String> businessWebsite = GeneratedColumn<String>(
    'business_website',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _businessTaglineMeta = const VerificationMeta(
    'businessTagline',
  );
  @override
  late final GeneratedColumn<String> businessTagline = GeneratedColumn<String>(
    'business_tagline',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _businessFooterMeta = const VerificationMeta(
    'businessFooter',
  );
  @override
  late final GeneratedColumn<String> businessFooter = GeneratedColumn<String>(
    'business_footer',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _logoSnapshotPathMeta = const VerificationMeta(
    'logoSnapshotPath',
  );
  @override
  late final GeneratedColumn<String> logoSnapshotPath = GeneratedColumn<String>(
    'logo_snapshot_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    number,
    status,
    clientId,
    clientName,
    clientCompany,
    clientEmail,
    clientPhone,
    clientAddress,
    clientTaxId,
    issueDate,
    validUntil,
    currencyCode,
    notes,
    terms,
    discountMode,
    discountBps,
    discountFixedMinor,
    taxRateBps,
    feeLabel,
    feeMinor,
    subtotalMinor,
    discountMinor,
    taxMinor,
    totalMinor,
    businessName,
    businessOwner,
    businessTaxId,
    businessEmail,
    businessPhone,
    businessAddress,
    businessWebsite,
    businessTagline,
    businessFooter,
    logoSnapshotPath,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quotations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Quotation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    }
    if (data.containsKey('client_name')) {
      context.handle(
        _clientNameMeta,
        clientName.isAcceptableOrUnknown(data['client_name']!, _clientNameMeta),
      );
    } else if (isInserting) {
      context.missing(_clientNameMeta);
    }
    if (data.containsKey('client_company')) {
      context.handle(
        _clientCompanyMeta,
        clientCompany.isAcceptableOrUnknown(
          data['client_company']!,
          _clientCompanyMeta,
        ),
      );
    }
    if (data.containsKey('client_email')) {
      context.handle(
        _clientEmailMeta,
        clientEmail.isAcceptableOrUnknown(
          data['client_email']!,
          _clientEmailMeta,
        ),
      );
    }
    if (data.containsKey('client_phone')) {
      context.handle(
        _clientPhoneMeta,
        clientPhone.isAcceptableOrUnknown(
          data['client_phone']!,
          _clientPhoneMeta,
        ),
      );
    }
    if (data.containsKey('client_address')) {
      context.handle(
        _clientAddressMeta,
        clientAddress.isAcceptableOrUnknown(
          data['client_address']!,
          _clientAddressMeta,
        ),
      );
    }
    if (data.containsKey('client_tax_id')) {
      context.handle(
        _clientTaxIdMeta,
        clientTaxId.isAcceptableOrUnknown(
          data['client_tax_id']!,
          _clientTaxIdMeta,
        ),
      );
    }
    if (data.containsKey('issue_date')) {
      context.handle(
        _issueDateMeta,
        issueDate.isAcceptableOrUnknown(data['issue_date']!, _issueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_issueDateMeta);
    }
    if (data.containsKey('valid_until')) {
      context.handle(
        _validUntilMeta,
        validUntil.isAcceptableOrUnknown(data['valid_until']!, _validUntilMeta),
      );
    } else if (isInserting) {
      context.missing(_validUntilMeta);
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('terms')) {
      context.handle(
        _termsMeta,
        terms.isAcceptableOrUnknown(data['terms']!, _termsMeta),
      );
    }
    if (data.containsKey('discount_mode')) {
      context.handle(
        _discountModeMeta,
        discountMode.isAcceptableOrUnknown(
          data['discount_mode']!,
          _discountModeMeta,
        ),
      );
    }
    if (data.containsKey('discount_bps')) {
      context.handle(
        _discountBpsMeta,
        discountBps.isAcceptableOrUnknown(
          data['discount_bps']!,
          _discountBpsMeta,
        ),
      );
    }
    if (data.containsKey('discount_fixed_minor')) {
      context.handle(
        _discountFixedMinorMeta,
        discountFixedMinor.isAcceptableOrUnknown(
          data['discount_fixed_minor']!,
          _discountFixedMinorMeta,
        ),
      );
    }
    if (data.containsKey('tax_rate_bps')) {
      context.handle(
        _taxRateBpsMeta,
        taxRateBps.isAcceptableOrUnknown(
          data['tax_rate_bps']!,
          _taxRateBpsMeta,
        ),
      );
    }
    if (data.containsKey('fee_label')) {
      context.handle(
        _feeLabelMeta,
        feeLabel.isAcceptableOrUnknown(data['fee_label']!, _feeLabelMeta),
      );
    }
    if (data.containsKey('fee_minor')) {
      context.handle(
        _feeMinorMeta,
        feeMinor.isAcceptableOrUnknown(data['fee_minor']!, _feeMinorMeta),
      );
    }
    if (data.containsKey('subtotal_minor')) {
      context.handle(
        _subtotalMinorMeta,
        subtotalMinor.isAcceptableOrUnknown(
          data['subtotal_minor']!,
          _subtotalMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subtotalMinorMeta);
    }
    if (data.containsKey('discount_minor')) {
      context.handle(
        _discountMinorMeta,
        discountMinor.isAcceptableOrUnknown(
          data['discount_minor']!,
          _discountMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_discountMinorMeta);
    }
    if (data.containsKey('tax_minor')) {
      context.handle(
        _taxMinorMeta,
        taxMinor.isAcceptableOrUnknown(data['tax_minor']!, _taxMinorMeta),
      );
    } else if (isInserting) {
      context.missing(_taxMinorMeta);
    }
    if (data.containsKey('total_minor')) {
      context.handle(
        _totalMinorMeta,
        totalMinor.isAcceptableOrUnknown(data['total_minor']!, _totalMinorMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMinorMeta);
    }
    if (data.containsKey('business_name')) {
      context.handle(
        _businessNameMeta,
        businessName.isAcceptableOrUnknown(
          data['business_name']!,
          _businessNameMeta,
        ),
      );
    }
    if (data.containsKey('business_owner')) {
      context.handle(
        _businessOwnerMeta,
        businessOwner.isAcceptableOrUnknown(
          data['business_owner']!,
          _businessOwnerMeta,
        ),
      );
    }
    if (data.containsKey('business_tax_id')) {
      context.handle(
        _businessTaxIdMeta,
        businessTaxId.isAcceptableOrUnknown(
          data['business_tax_id']!,
          _businessTaxIdMeta,
        ),
      );
    }
    if (data.containsKey('business_email')) {
      context.handle(
        _businessEmailMeta,
        businessEmail.isAcceptableOrUnknown(
          data['business_email']!,
          _businessEmailMeta,
        ),
      );
    }
    if (data.containsKey('business_phone')) {
      context.handle(
        _businessPhoneMeta,
        businessPhone.isAcceptableOrUnknown(
          data['business_phone']!,
          _businessPhoneMeta,
        ),
      );
    }
    if (data.containsKey('business_address')) {
      context.handle(
        _businessAddressMeta,
        businessAddress.isAcceptableOrUnknown(
          data['business_address']!,
          _businessAddressMeta,
        ),
      );
    }
    if (data.containsKey('business_website')) {
      context.handle(
        _businessWebsiteMeta,
        businessWebsite.isAcceptableOrUnknown(
          data['business_website']!,
          _businessWebsiteMeta,
        ),
      );
    }
    if (data.containsKey('business_tagline')) {
      context.handle(
        _businessTaglineMeta,
        businessTagline.isAcceptableOrUnknown(
          data['business_tagline']!,
          _businessTaglineMeta,
        ),
      );
    }
    if (data.containsKey('business_footer')) {
      context.handle(
        _businessFooterMeta,
        businessFooter.isAcceptableOrUnknown(
          data['business_footer']!,
          _businessFooterMeta,
        ),
      );
    }
    if (data.containsKey('logo_snapshot_path')) {
      context.handle(
        _logoSnapshotPathMeta,
        logoSnapshotPath.isAcceptableOrUnknown(
          data['logo_snapshot_path']!,
          _logoSnapshotPathMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Quotation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Quotation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}client_id'],
      ),
      clientName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_name'],
      )!,
      clientCompany: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_company'],
      ),
      clientEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_email'],
      ),
      clientPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_phone'],
      ),
      clientAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_address'],
      ),
      clientTaxId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_tax_id'],
      ),
      issueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}issue_date'],
      )!,
      validUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}valid_until'],
      )!,
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      terms: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}terms'],
      )!,
      discountMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}discount_mode'],
      )!,
      discountBps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_bps'],
      )!,
      discountFixedMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_fixed_minor'],
      )!,
      taxRateBps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax_rate_bps'],
      )!,
      feeLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fee_label'],
      )!,
      feeMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fee_minor'],
      )!,
      subtotalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subtotal_minor'],
      )!,
      discountMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}discount_minor'],
      )!,
      taxMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tax_minor'],
      )!,
      totalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_minor'],
      )!,
      businessName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_name'],
      )!,
      businessOwner: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_owner'],
      )!,
      businessTaxId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_tax_id'],
      ),
      businessEmail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_email'],
      ),
      businessPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_phone'],
      ),
      businessAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_address'],
      ),
      businessWebsite: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_website'],
      ),
      businessTagline: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_tagline'],
      )!,
      businessFooter: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_footer'],
      )!,
      logoSnapshotPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_snapshot_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $QuotationsTable createAlias(String alias) {
    return $QuotationsTable(attachedDatabase, alias);
  }
}

class Quotation extends DataClass implements Insertable<Quotation> {
  final int id;
  final String number;
  final String status;
  final int? clientId;
  final String clientName;
  final String? clientCompany;
  final String? clientEmail;
  final String? clientPhone;
  final String? clientAddress;
  final String? clientTaxId;
  final DateTime issueDate;
  final DateTime validUntil;
  final String currencyCode;
  final String notes;
  final String terms;
  final String discountMode;
  final int discountBps;
  final int discountFixedMinor;
  final int taxRateBps;
  final String feeLabel;
  final int feeMinor;
  final int subtotalMinor;
  final int discountMinor;
  final int taxMinor;
  final int totalMinor;
  final String businessName;
  final String businessOwner;
  final String? businessTaxId;
  final String? businessEmail;
  final String? businessPhone;
  final String? businessAddress;
  final String? businessWebsite;
  final String businessTagline;
  final String businessFooter;
  final String? logoSnapshotPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Quotation({
    required this.id,
    required this.number,
    required this.status,
    this.clientId,
    required this.clientName,
    this.clientCompany,
    this.clientEmail,
    this.clientPhone,
    this.clientAddress,
    this.clientTaxId,
    required this.issueDate,
    required this.validUntil,
    required this.currencyCode,
    required this.notes,
    required this.terms,
    required this.discountMode,
    required this.discountBps,
    required this.discountFixedMinor,
    required this.taxRateBps,
    required this.feeLabel,
    required this.feeMinor,
    required this.subtotalMinor,
    required this.discountMinor,
    required this.taxMinor,
    required this.totalMinor,
    required this.businessName,
    required this.businessOwner,
    this.businessTaxId,
    this.businessEmail,
    this.businessPhone,
    this.businessAddress,
    this.businessWebsite,
    required this.businessTagline,
    required this.businessFooter,
    this.logoSnapshotPath,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['number'] = Variable<String>(number);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || clientId != null) {
      map['client_id'] = Variable<int>(clientId);
    }
    map['client_name'] = Variable<String>(clientName);
    if (!nullToAbsent || clientCompany != null) {
      map['client_company'] = Variable<String>(clientCompany);
    }
    if (!nullToAbsent || clientEmail != null) {
      map['client_email'] = Variable<String>(clientEmail);
    }
    if (!nullToAbsent || clientPhone != null) {
      map['client_phone'] = Variable<String>(clientPhone);
    }
    if (!nullToAbsent || clientAddress != null) {
      map['client_address'] = Variable<String>(clientAddress);
    }
    if (!nullToAbsent || clientTaxId != null) {
      map['client_tax_id'] = Variable<String>(clientTaxId);
    }
    map['issue_date'] = Variable<DateTime>(issueDate);
    map['valid_until'] = Variable<DateTime>(validUntil);
    map['currency_code'] = Variable<String>(currencyCode);
    map['notes'] = Variable<String>(notes);
    map['terms'] = Variable<String>(terms);
    map['discount_mode'] = Variable<String>(discountMode);
    map['discount_bps'] = Variable<int>(discountBps);
    map['discount_fixed_minor'] = Variable<int>(discountFixedMinor);
    map['tax_rate_bps'] = Variable<int>(taxRateBps);
    map['fee_label'] = Variable<String>(feeLabel);
    map['fee_minor'] = Variable<int>(feeMinor);
    map['subtotal_minor'] = Variable<int>(subtotalMinor);
    map['discount_minor'] = Variable<int>(discountMinor);
    map['tax_minor'] = Variable<int>(taxMinor);
    map['total_minor'] = Variable<int>(totalMinor);
    map['business_name'] = Variable<String>(businessName);
    map['business_owner'] = Variable<String>(businessOwner);
    if (!nullToAbsent || businessTaxId != null) {
      map['business_tax_id'] = Variable<String>(businessTaxId);
    }
    if (!nullToAbsent || businessEmail != null) {
      map['business_email'] = Variable<String>(businessEmail);
    }
    if (!nullToAbsent || businessPhone != null) {
      map['business_phone'] = Variable<String>(businessPhone);
    }
    if (!nullToAbsent || businessAddress != null) {
      map['business_address'] = Variable<String>(businessAddress);
    }
    if (!nullToAbsent || businessWebsite != null) {
      map['business_website'] = Variable<String>(businessWebsite);
    }
    map['business_tagline'] = Variable<String>(businessTagline);
    map['business_footer'] = Variable<String>(businessFooter);
    if (!nullToAbsent || logoSnapshotPath != null) {
      map['logo_snapshot_path'] = Variable<String>(logoSnapshotPath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  QuotationsCompanion toCompanion(bool nullToAbsent) {
    return QuotationsCompanion(
      id: Value(id),
      number: Value(number),
      status: Value(status),
      clientId: clientId == null && nullToAbsent
          ? const Value.absent()
          : Value(clientId),
      clientName: Value(clientName),
      clientCompany: clientCompany == null && nullToAbsent
          ? const Value.absent()
          : Value(clientCompany),
      clientEmail: clientEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(clientEmail),
      clientPhone: clientPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(clientPhone),
      clientAddress: clientAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(clientAddress),
      clientTaxId: clientTaxId == null && nullToAbsent
          ? const Value.absent()
          : Value(clientTaxId),
      issueDate: Value(issueDate),
      validUntil: Value(validUntil),
      currencyCode: Value(currencyCode),
      notes: Value(notes),
      terms: Value(terms),
      discountMode: Value(discountMode),
      discountBps: Value(discountBps),
      discountFixedMinor: Value(discountFixedMinor),
      taxRateBps: Value(taxRateBps),
      feeLabel: Value(feeLabel),
      feeMinor: Value(feeMinor),
      subtotalMinor: Value(subtotalMinor),
      discountMinor: Value(discountMinor),
      taxMinor: Value(taxMinor),
      totalMinor: Value(totalMinor),
      businessName: Value(businessName),
      businessOwner: Value(businessOwner),
      businessTaxId: businessTaxId == null && nullToAbsent
          ? const Value.absent()
          : Value(businessTaxId),
      businessEmail: businessEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(businessEmail),
      businessPhone: businessPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(businessPhone),
      businessAddress: businessAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(businessAddress),
      businessWebsite: businessWebsite == null && nullToAbsent
          ? const Value.absent()
          : Value(businessWebsite),
      businessTagline: Value(businessTagline),
      businessFooter: Value(businessFooter),
      logoSnapshotPath: logoSnapshotPath == null && nullToAbsent
          ? const Value.absent()
          : Value(logoSnapshotPath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Quotation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Quotation(
      id: serializer.fromJson<int>(json['id']),
      number: serializer.fromJson<String>(json['number']),
      status: serializer.fromJson<String>(json['status']),
      clientId: serializer.fromJson<int?>(json['clientId']),
      clientName: serializer.fromJson<String>(json['clientName']),
      clientCompany: serializer.fromJson<String?>(json['clientCompany']),
      clientEmail: serializer.fromJson<String?>(json['clientEmail']),
      clientPhone: serializer.fromJson<String?>(json['clientPhone']),
      clientAddress: serializer.fromJson<String?>(json['clientAddress']),
      clientTaxId: serializer.fromJson<String?>(json['clientTaxId']),
      issueDate: serializer.fromJson<DateTime>(json['issueDate']),
      validUntil: serializer.fromJson<DateTime>(json['validUntil']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      notes: serializer.fromJson<String>(json['notes']),
      terms: serializer.fromJson<String>(json['terms']),
      discountMode: serializer.fromJson<String>(json['discountMode']),
      discountBps: serializer.fromJson<int>(json['discountBps']),
      discountFixedMinor: serializer.fromJson<int>(json['discountFixedMinor']),
      taxRateBps: serializer.fromJson<int>(json['taxRateBps']),
      feeLabel: serializer.fromJson<String>(json['feeLabel']),
      feeMinor: serializer.fromJson<int>(json['feeMinor']),
      subtotalMinor: serializer.fromJson<int>(json['subtotalMinor']),
      discountMinor: serializer.fromJson<int>(json['discountMinor']),
      taxMinor: serializer.fromJson<int>(json['taxMinor']),
      totalMinor: serializer.fromJson<int>(json['totalMinor']),
      businessName: serializer.fromJson<String>(json['businessName']),
      businessOwner: serializer.fromJson<String>(json['businessOwner']),
      businessTaxId: serializer.fromJson<String?>(json['businessTaxId']),
      businessEmail: serializer.fromJson<String?>(json['businessEmail']),
      businessPhone: serializer.fromJson<String?>(json['businessPhone']),
      businessAddress: serializer.fromJson<String?>(json['businessAddress']),
      businessWebsite: serializer.fromJson<String?>(json['businessWebsite']),
      businessTagline: serializer.fromJson<String>(json['businessTagline']),
      businessFooter: serializer.fromJson<String>(json['businessFooter']),
      logoSnapshotPath: serializer.fromJson<String?>(json['logoSnapshotPath']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'number': serializer.toJson<String>(number),
      'status': serializer.toJson<String>(status),
      'clientId': serializer.toJson<int?>(clientId),
      'clientName': serializer.toJson<String>(clientName),
      'clientCompany': serializer.toJson<String?>(clientCompany),
      'clientEmail': serializer.toJson<String?>(clientEmail),
      'clientPhone': serializer.toJson<String?>(clientPhone),
      'clientAddress': serializer.toJson<String?>(clientAddress),
      'clientTaxId': serializer.toJson<String?>(clientTaxId),
      'issueDate': serializer.toJson<DateTime>(issueDate),
      'validUntil': serializer.toJson<DateTime>(validUntil),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'notes': serializer.toJson<String>(notes),
      'terms': serializer.toJson<String>(terms),
      'discountMode': serializer.toJson<String>(discountMode),
      'discountBps': serializer.toJson<int>(discountBps),
      'discountFixedMinor': serializer.toJson<int>(discountFixedMinor),
      'taxRateBps': serializer.toJson<int>(taxRateBps),
      'feeLabel': serializer.toJson<String>(feeLabel),
      'feeMinor': serializer.toJson<int>(feeMinor),
      'subtotalMinor': serializer.toJson<int>(subtotalMinor),
      'discountMinor': serializer.toJson<int>(discountMinor),
      'taxMinor': serializer.toJson<int>(taxMinor),
      'totalMinor': serializer.toJson<int>(totalMinor),
      'businessName': serializer.toJson<String>(businessName),
      'businessOwner': serializer.toJson<String>(businessOwner),
      'businessTaxId': serializer.toJson<String?>(businessTaxId),
      'businessEmail': serializer.toJson<String?>(businessEmail),
      'businessPhone': serializer.toJson<String?>(businessPhone),
      'businessAddress': serializer.toJson<String?>(businessAddress),
      'businessWebsite': serializer.toJson<String?>(businessWebsite),
      'businessTagline': serializer.toJson<String>(businessTagline),
      'businessFooter': serializer.toJson<String>(businessFooter),
      'logoSnapshotPath': serializer.toJson<String?>(logoSnapshotPath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Quotation copyWith({
    int? id,
    String? number,
    String? status,
    Value<int?> clientId = const Value.absent(),
    String? clientName,
    Value<String?> clientCompany = const Value.absent(),
    Value<String?> clientEmail = const Value.absent(),
    Value<String?> clientPhone = const Value.absent(),
    Value<String?> clientAddress = const Value.absent(),
    Value<String?> clientTaxId = const Value.absent(),
    DateTime? issueDate,
    DateTime? validUntil,
    String? currencyCode,
    String? notes,
    String? terms,
    String? discountMode,
    int? discountBps,
    int? discountFixedMinor,
    int? taxRateBps,
    String? feeLabel,
    int? feeMinor,
    int? subtotalMinor,
    int? discountMinor,
    int? taxMinor,
    int? totalMinor,
    String? businessName,
    String? businessOwner,
    Value<String?> businessTaxId = const Value.absent(),
    Value<String?> businessEmail = const Value.absent(),
    Value<String?> businessPhone = const Value.absent(),
    Value<String?> businessAddress = const Value.absent(),
    Value<String?> businessWebsite = const Value.absent(),
    String? businessTagline,
    String? businessFooter,
    Value<String?> logoSnapshotPath = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Quotation(
    id: id ?? this.id,
    number: number ?? this.number,
    status: status ?? this.status,
    clientId: clientId.present ? clientId.value : this.clientId,
    clientName: clientName ?? this.clientName,
    clientCompany: clientCompany.present
        ? clientCompany.value
        : this.clientCompany,
    clientEmail: clientEmail.present ? clientEmail.value : this.clientEmail,
    clientPhone: clientPhone.present ? clientPhone.value : this.clientPhone,
    clientAddress: clientAddress.present
        ? clientAddress.value
        : this.clientAddress,
    clientTaxId: clientTaxId.present ? clientTaxId.value : this.clientTaxId,
    issueDate: issueDate ?? this.issueDate,
    validUntil: validUntil ?? this.validUntil,
    currencyCode: currencyCode ?? this.currencyCode,
    notes: notes ?? this.notes,
    terms: terms ?? this.terms,
    discountMode: discountMode ?? this.discountMode,
    discountBps: discountBps ?? this.discountBps,
    discountFixedMinor: discountFixedMinor ?? this.discountFixedMinor,
    taxRateBps: taxRateBps ?? this.taxRateBps,
    feeLabel: feeLabel ?? this.feeLabel,
    feeMinor: feeMinor ?? this.feeMinor,
    subtotalMinor: subtotalMinor ?? this.subtotalMinor,
    discountMinor: discountMinor ?? this.discountMinor,
    taxMinor: taxMinor ?? this.taxMinor,
    totalMinor: totalMinor ?? this.totalMinor,
    businessName: businessName ?? this.businessName,
    businessOwner: businessOwner ?? this.businessOwner,
    businessTaxId: businessTaxId.present
        ? businessTaxId.value
        : this.businessTaxId,
    businessEmail: businessEmail.present
        ? businessEmail.value
        : this.businessEmail,
    businessPhone: businessPhone.present
        ? businessPhone.value
        : this.businessPhone,
    businessAddress: businessAddress.present
        ? businessAddress.value
        : this.businessAddress,
    businessWebsite: businessWebsite.present
        ? businessWebsite.value
        : this.businessWebsite,
    businessTagline: businessTagline ?? this.businessTagline,
    businessFooter: businessFooter ?? this.businessFooter,
    logoSnapshotPath: logoSnapshotPath.present
        ? logoSnapshotPath.value
        : this.logoSnapshotPath,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Quotation copyWithCompanion(QuotationsCompanion data) {
    return Quotation(
      id: data.id.present ? data.id.value : this.id,
      number: data.number.present ? data.number.value : this.number,
      status: data.status.present ? data.status.value : this.status,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      clientName: data.clientName.present
          ? data.clientName.value
          : this.clientName,
      clientCompany: data.clientCompany.present
          ? data.clientCompany.value
          : this.clientCompany,
      clientEmail: data.clientEmail.present
          ? data.clientEmail.value
          : this.clientEmail,
      clientPhone: data.clientPhone.present
          ? data.clientPhone.value
          : this.clientPhone,
      clientAddress: data.clientAddress.present
          ? data.clientAddress.value
          : this.clientAddress,
      clientTaxId: data.clientTaxId.present
          ? data.clientTaxId.value
          : this.clientTaxId,
      issueDate: data.issueDate.present ? data.issueDate.value : this.issueDate,
      validUntil: data.validUntil.present
          ? data.validUntil.value
          : this.validUntil,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      notes: data.notes.present ? data.notes.value : this.notes,
      terms: data.terms.present ? data.terms.value : this.terms,
      discountMode: data.discountMode.present
          ? data.discountMode.value
          : this.discountMode,
      discountBps: data.discountBps.present
          ? data.discountBps.value
          : this.discountBps,
      discountFixedMinor: data.discountFixedMinor.present
          ? data.discountFixedMinor.value
          : this.discountFixedMinor,
      taxRateBps: data.taxRateBps.present
          ? data.taxRateBps.value
          : this.taxRateBps,
      feeLabel: data.feeLabel.present ? data.feeLabel.value : this.feeLabel,
      feeMinor: data.feeMinor.present ? data.feeMinor.value : this.feeMinor,
      subtotalMinor: data.subtotalMinor.present
          ? data.subtotalMinor.value
          : this.subtotalMinor,
      discountMinor: data.discountMinor.present
          ? data.discountMinor.value
          : this.discountMinor,
      taxMinor: data.taxMinor.present ? data.taxMinor.value : this.taxMinor,
      totalMinor: data.totalMinor.present
          ? data.totalMinor.value
          : this.totalMinor,
      businessName: data.businessName.present
          ? data.businessName.value
          : this.businessName,
      businessOwner: data.businessOwner.present
          ? data.businessOwner.value
          : this.businessOwner,
      businessTaxId: data.businessTaxId.present
          ? data.businessTaxId.value
          : this.businessTaxId,
      businessEmail: data.businessEmail.present
          ? data.businessEmail.value
          : this.businessEmail,
      businessPhone: data.businessPhone.present
          ? data.businessPhone.value
          : this.businessPhone,
      businessAddress: data.businessAddress.present
          ? data.businessAddress.value
          : this.businessAddress,
      businessWebsite: data.businessWebsite.present
          ? data.businessWebsite.value
          : this.businessWebsite,
      businessTagline: data.businessTagline.present
          ? data.businessTagline.value
          : this.businessTagline,
      businessFooter: data.businessFooter.present
          ? data.businessFooter.value
          : this.businessFooter,
      logoSnapshotPath: data.logoSnapshotPath.present
          ? data.logoSnapshotPath.value
          : this.logoSnapshotPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Quotation(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('status: $status, ')
          ..write('clientId: $clientId, ')
          ..write('clientName: $clientName, ')
          ..write('clientCompany: $clientCompany, ')
          ..write('clientEmail: $clientEmail, ')
          ..write('clientPhone: $clientPhone, ')
          ..write('clientAddress: $clientAddress, ')
          ..write('clientTaxId: $clientTaxId, ')
          ..write('issueDate: $issueDate, ')
          ..write('validUntil: $validUntil, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('notes: $notes, ')
          ..write('terms: $terms, ')
          ..write('discountMode: $discountMode, ')
          ..write('discountBps: $discountBps, ')
          ..write('discountFixedMinor: $discountFixedMinor, ')
          ..write('taxRateBps: $taxRateBps, ')
          ..write('feeLabel: $feeLabel, ')
          ..write('feeMinor: $feeMinor, ')
          ..write('subtotalMinor: $subtotalMinor, ')
          ..write('discountMinor: $discountMinor, ')
          ..write('taxMinor: $taxMinor, ')
          ..write('totalMinor: $totalMinor, ')
          ..write('businessName: $businessName, ')
          ..write('businessOwner: $businessOwner, ')
          ..write('businessTaxId: $businessTaxId, ')
          ..write('businessEmail: $businessEmail, ')
          ..write('businessPhone: $businessPhone, ')
          ..write('businessAddress: $businessAddress, ')
          ..write('businessWebsite: $businessWebsite, ')
          ..write('businessTagline: $businessTagline, ')
          ..write('businessFooter: $businessFooter, ')
          ..write('logoSnapshotPath: $logoSnapshotPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    number,
    status,
    clientId,
    clientName,
    clientCompany,
    clientEmail,
    clientPhone,
    clientAddress,
    clientTaxId,
    issueDate,
    validUntil,
    currencyCode,
    notes,
    terms,
    discountMode,
    discountBps,
    discountFixedMinor,
    taxRateBps,
    feeLabel,
    feeMinor,
    subtotalMinor,
    discountMinor,
    taxMinor,
    totalMinor,
    businessName,
    businessOwner,
    businessTaxId,
    businessEmail,
    businessPhone,
    businessAddress,
    businessWebsite,
    businessTagline,
    businessFooter,
    logoSnapshotPath,
    createdAt,
    updatedAt,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Quotation &&
          other.id == this.id &&
          other.number == this.number &&
          other.status == this.status &&
          other.clientId == this.clientId &&
          other.clientName == this.clientName &&
          other.clientCompany == this.clientCompany &&
          other.clientEmail == this.clientEmail &&
          other.clientPhone == this.clientPhone &&
          other.clientAddress == this.clientAddress &&
          other.clientTaxId == this.clientTaxId &&
          other.issueDate == this.issueDate &&
          other.validUntil == this.validUntil &&
          other.currencyCode == this.currencyCode &&
          other.notes == this.notes &&
          other.terms == this.terms &&
          other.discountMode == this.discountMode &&
          other.discountBps == this.discountBps &&
          other.discountFixedMinor == this.discountFixedMinor &&
          other.taxRateBps == this.taxRateBps &&
          other.feeLabel == this.feeLabel &&
          other.feeMinor == this.feeMinor &&
          other.subtotalMinor == this.subtotalMinor &&
          other.discountMinor == this.discountMinor &&
          other.taxMinor == this.taxMinor &&
          other.totalMinor == this.totalMinor &&
          other.businessName == this.businessName &&
          other.businessOwner == this.businessOwner &&
          other.businessTaxId == this.businessTaxId &&
          other.businessEmail == this.businessEmail &&
          other.businessPhone == this.businessPhone &&
          other.businessAddress == this.businessAddress &&
          other.businessWebsite == this.businessWebsite &&
          other.businessTagline == this.businessTagline &&
          other.businessFooter == this.businessFooter &&
          other.logoSnapshotPath == this.logoSnapshotPath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class QuotationsCompanion extends UpdateCompanion<Quotation> {
  final Value<int> id;
  final Value<String> number;
  final Value<String> status;
  final Value<int?> clientId;
  final Value<String> clientName;
  final Value<String?> clientCompany;
  final Value<String?> clientEmail;
  final Value<String?> clientPhone;
  final Value<String?> clientAddress;
  final Value<String?> clientTaxId;
  final Value<DateTime> issueDate;
  final Value<DateTime> validUntil;
  final Value<String> currencyCode;
  final Value<String> notes;
  final Value<String> terms;
  final Value<String> discountMode;
  final Value<int> discountBps;
  final Value<int> discountFixedMinor;
  final Value<int> taxRateBps;
  final Value<String> feeLabel;
  final Value<int> feeMinor;
  final Value<int> subtotalMinor;
  final Value<int> discountMinor;
  final Value<int> taxMinor;
  final Value<int> totalMinor;
  final Value<String> businessName;
  final Value<String> businessOwner;
  final Value<String?> businessTaxId;
  final Value<String?> businessEmail;
  final Value<String?> businessPhone;
  final Value<String?> businessAddress;
  final Value<String?> businessWebsite;
  final Value<String> businessTagline;
  final Value<String> businessFooter;
  final Value<String?> logoSnapshotPath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const QuotationsCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.status = const Value.absent(),
    this.clientId = const Value.absent(),
    this.clientName = const Value.absent(),
    this.clientCompany = const Value.absent(),
    this.clientEmail = const Value.absent(),
    this.clientPhone = const Value.absent(),
    this.clientAddress = const Value.absent(),
    this.clientTaxId = const Value.absent(),
    this.issueDate = const Value.absent(),
    this.validUntil = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.notes = const Value.absent(),
    this.terms = const Value.absent(),
    this.discountMode = const Value.absent(),
    this.discountBps = const Value.absent(),
    this.discountFixedMinor = const Value.absent(),
    this.taxRateBps = const Value.absent(),
    this.feeLabel = const Value.absent(),
    this.feeMinor = const Value.absent(),
    this.subtotalMinor = const Value.absent(),
    this.discountMinor = const Value.absent(),
    this.taxMinor = const Value.absent(),
    this.totalMinor = const Value.absent(),
    this.businessName = const Value.absent(),
    this.businessOwner = const Value.absent(),
    this.businessTaxId = const Value.absent(),
    this.businessEmail = const Value.absent(),
    this.businessPhone = const Value.absent(),
    this.businessAddress = const Value.absent(),
    this.businessWebsite = const Value.absent(),
    this.businessTagline = const Value.absent(),
    this.businessFooter = const Value.absent(),
    this.logoSnapshotPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  QuotationsCompanion.insert({
    this.id = const Value.absent(),
    required String number,
    required String status,
    this.clientId = const Value.absent(),
    required String clientName,
    this.clientCompany = const Value.absent(),
    this.clientEmail = const Value.absent(),
    this.clientPhone = const Value.absent(),
    this.clientAddress = const Value.absent(),
    this.clientTaxId = const Value.absent(),
    required DateTime issueDate,
    required DateTime validUntil,
    required String currencyCode,
    this.notes = const Value.absent(),
    this.terms = const Value.absent(),
    this.discountMode = const Value.absent(),
    this.discountBps = const Value.absent(),
    this.discountFixedMinor = const Value.absent(),
    this.taxRateBps = const Value.absent(),
    this.feeLabel = const Value.absent(),
    this.feeMinor = const Value.absent(),
    required int subtotalMinor,
    required int discountMinor,
    required int taxMinor,
    required int totalMinor,
    this.businessName = const Value.absent(),
    this.businessOwner = const Value.absent(),
    this.businessTaxId = const Value.absent(),
    this.businessEmail = const Value.absent(),
    this.businessPhone = const Value.absent(),
    this.businessAddress = const Value.absent(),
    this.businessWebsite = const Value.absent(),
    this.businessTagline = const Value.absent(),
    this.businessFooter = const Value.absent(),
    this.logoSnapshotPath = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : number = Value(number),
       status = Value(status),
       clientName = Value(clientName),
       issueDate = Value(issueDate),
       validUntil = Value(validUntil),
       currencyCode = Value(currencyCode),
       subtotalMinor = Value(subtotalMinor),
       discountMinor = Value(discountMinor),
       taxMinor = Value(taxMinor),
       totalMinor = Value(totalMinor),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Quotation> custom({
    Expression<int>? id,
    Expression<String>? number,
    Expression<String>? status,
    Expression<int>? clientId,
    Expression<String>? clientName,
    Expression<String>? clientCompany,
    Expression<String>? clientEmail,
    Expression<String>? clientPhone,
    Expression<String>? clientAddress,
    Expression<String>? clientTaxId,
    Expression<DateTime>? issueDate,
    Expression<DateTime>? validUntil,
    Expression<String>? currencyCode,
    Expression<String>? notes,
    Expression<String>? terms,
    Expression<String>? discountMode,
    Expression<int>? discountBps,
    Expression<int>? discountFixedMinor,
    Expression<int>? taxRateBps,
    Expression<String>? feeLabel,
    Expression<int>? feeMinor,
    Expression<int>? subtotalMinor,
    Expression<int>? discountMinor,
    Expression<int>? taxMinor,
    Expression<int>? totalMinor,
    Expression<String>? businessName,
    Expression<String>? businessOwner,
    Expression<String>? businessTaxId,
    Expression<String>? businessEmail,
    Expression<String>? businessPhone,
    Expression<String>? businessAddress,
    Expression<String>? businessWebsite,
    Expression<String>? businessTagline,
    Expression<String>? businessFooter,
    Expression<String>? logoSnapshotPath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (status != null) 'status': status,
      if (clientId != null) 'client_id': clientId,
      if (clientName != null) 'client_name': clientName,
      if (clientCompany != null) 'client_company': clientCompany,
      if (clientEmail != null) 'client_email': clientEmail,
      if (clientPhone != null) 'client_phone': clientPhone,
      if (clientAddress != null) 'client_address': clientAddress,
      if (clientTaxId != null) 'client_tax_id': clientTaxId,
      if (issueDate != null) 'issue_date': issueDate,
      if (validUntil != null) 'valid_until': validUntil,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (notes != null) 'notes': notes,
      if (terms != null) 'terms': terms,
      if (discountMode != null) 'discount_mode': discountMode,
      if (discountBps != null) 'discount_bps': discountBps,
      if (discountFixedMinor != null)
        'discount_fixed_minor': discountFixedMinor,
      if (taxRateBps != null) 'tax_rate_bps': taxRateBps,
      if (feeLabel != null) 'fee_label': feeLabel,
      if (feeMinor != null) 'fee_minor': feeMinor,
      if (subtotalMinor != null) 'subtotal_minor': subtotalMinor,
      if (discountMinor != null) 'discount_minor': discountMinor,
      if (taxMinor != null) 'tax_minor': taxMinor,
      if (totalMinor != null) 'total_minor': totalMinor,
      if (businessName != null) 'business_name': businessName,
      if (businessOwner != null) 'business_owner': businessOwner,
      if (businessTaxId != null) 'business_tax_id': businessTaxId,
      if (businessEmail != null) 'business_email': businessEmail,
      if (businessPhone != null) 'business_phone': businessPhone,
      if (businessAddress != null) 'business_address': businessAddress,
      if (businessWebsite != null) 'business_website': businessWebsite,
      if (businessTagline != null) 'business_tagline': businessTagline,
      if (businessFooter != null) 'business_footer': businessFooter,
      if (logoSnapshotPath != null) 'logo_snapshot_path': logoSnapshotPath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  QuotationsCompanion copyWith({
    Value<int>? id,
    Value<String>? number,
    Value<String>? status,
    Value<int?>? clientId,
    Value<String>? clientName,
    Value<String?>? clientCompany,
    Value<String?>? clientEmail,
    Value<String?>? clientPhone,
    Value<String?>? clientAddress,
    Value<String?>? clientTaxId,
    Value<DateTime>? issueDate,
    Value<DateTime>? validUntil,
    Value<String>? currencyCode,
    Value<String>? notes,
    Value<String>? terms,
    Value<String>? discountMode,
    Value<int>? discountBps,
    Value<int>? discountFixedMinor,
    Value<int>? taxRateBps,
    Value<String>? feeLabel,
    Value<int>? feeMinor,
    Value<int>? subtotalMinor,
    Value<int>? discountMinor,
    Value<int>? taxMinor,
    Value<int>? totalMinor,
    Value<String>? businessName,
    Value<String>? businessOwner,
    Value<String?>? businessTaxId,
    Value<String?>? businessEmail,
    Value<String?>? businessPhone,
    Value<String?>? businessAddress,
    Value<String?>? businessWebsite,
    Value<String>? businessTagline,
    Value<String>? businessFooter,
    Value<String?>? logoSnapshotPath,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return QuotationsCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      status: status ?? this.status,
      clientId: clientId ?? this.clientId,
      clientName: clientName ?? this.clientName,
      clientCompany: clientCompany ?? this.clientCompany,
      clientEmail: clientEmail ?? this.clientEmail,
      clientPhone: clientPhone ?? this.clientPhone,
      clientAddress: clientAddress ?? this.clientAddress,
      clientTaxId: clientTaxId ?? this.clientTaxId,
      issueDate: issueDate ?? this.issueDate,
      validUntil: validUntil ?? this.validUntil,
      currencyCode: currencyCode ?? this.currencyCode,
      notes: notes ?? this.notes,
      terms: terms ?? this.terms,
      discountMode: discountMode ?? this.discountMode,
      discountBps: discountBps ?? this.discountBps,
      discountFixedMinor: discountFixedMinor ?? this.discountFixedMinor,
      taxRateBps: taxRateBps ?? this.taxRateBps,
      feeLabel: feeLabel ?? this.feeLabel,
      feeMinor: feeMinor ?? this.feeMinor,
      subtotalMinor: subtotalMinor ?? this.subtotalMinor,
      discountMinor: discountMinor ?? this.discountMinor,
      taxMinor: taxMinor ?? this.taxMinor,
      totalMinor: totalMinor ?? this.totalMinor,
      businessName: businessName ?? this.businessName,
      businessOwner: businessOwner ?? this.businessOwner,
      businessTaxId: businessTaxId ?? this.businessTaxId,
      businessEmail: businessEmail ?? this.businessEmail,
      businessPhone: businessPhone ?? this.businessPhone,
      businessAddress: businessAddress ?? this.businessAddress,
      businessWebsite: businessWebsite ?? this.businessWebsite,
      businessTagline: businessTagline ?? this.businessTagline,
      businessFooter: businessFooter ?? this.businessFooter,
      logoSnapshotPath: logoSnapshotPath ?? this.logoSnapshotPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (clientName.present) {
      map['client_name'] = Variable<String>(clientName.value);
    }
    if (clientCompany.present) {
      map['client_company'] = Variable<String>(clientCompany.value);
    }
    if (clientEmail.present) {
      map['client_email'] = Variable<String>(clientEmail.value);
    }
    if (clientPhone.present) {
      map['client_phone'] = Variable<String>(clientPhone.value);
    }
    if (clientAddress.present) {
      map['client_address'] = Variable<String>(clientAddress.value);
    }
    if (clientTaxId.present) {
      map['client_tax_id'] = Variable<String>(clientTaxId.value);
    }
    if (issueDate.present) {
      map['issue_date'] = Variable<DateTime>(issueDate.value);
    }
    if (validUntil.present) {
      map['valid_until'] = Variable<DateTime>(validUntil.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (terms.present) {
      map['terms'] = Variable<String>(terms.value);
    }
    if (discountMode.present) {
      map['discount_mode'] = Variable<String>(discountMode.value);
    }
    if (discountBps.present) {
      map['discount_bps'] = Variable<int>(discountBps.value);
    }
    if (discountFixedMinor.present) {
      map['discount_fixed_minor'] = Variable<int>(discountFixedMinor.value);
    }
    if (taxRateBps.present) {
      map['tax_rate_bps'] = Variable<int>(taxRateBps.value);
    }
    if (feeLabel.present) {
      map['fee_label'] = Variable<String>(feeLabel.value);
    }
    if (feeMinor.present) {
      map['fee_minor'] = Variable<int>(feeMinor.value);
    }
    if (subtotalMinor.present) {
      map['subtotal_minor'] = Variable<int>(subtotalMinor.value);
    }
    if (discountMinor.present) {
      map['discount_minor'] = Variable<int>(discountMinor.value);
    }
    if (taxMinor.present) {
      map['tax_minor'] = Variable<int>(taxMinor.value);
    }
    if (totalMinor.present) {
      map['total_minor'] = Variable<int>(totalMinor.value);
    }
    if (businessName.present) {
      map['business_name'] = Variable<String>(businessName.value);
    }
    if (businessOwner.present) {
      map['business_owner'] = Variable<String>(businessOwner.value);
    }
    if (businessTaxId.present) {
      map['business_tax_id'] = Variable<String>(businessTaxId.value);
    }
    if (businessEmail.present) {
      map['business_email'] = Variable<String>(businessEmail.value);
    }
    if (businessPhone.present) {
      map['business_phone'] = Variable<String>(businessPhone.value);
    }
    if (businessAddress.present) {
      map['business_address'] = Variable<String>(businessAddress.value);
    }
    if (businessWebsite.present) {
      map['business_website'] = Variable<String>(businessWebsite.value);
    }
    if (businessTagline.present) {
      map['business_tagline'] = Variable<String>(businessTagline.value);
    }
    if (businessFooter.present) {
      map['business_footer'] = Variable<String>(businessFooter.value);
    }
    if (logoSnapshotPath.present) {
      map['logo_snapshot_path'] = Variable<String>(logoSnapshotPath.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuotationsCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('status: $status, ')
          ..write('clientId: $clientId, ')
          ..write('clientName: $clientName, ')
          ..write('clientCompany: $clientCompany, ')
          ..write('clientEmail: $clientEmail, ')
          ..write('clientPhone: $clientPhone, ')
          ..write('clientAddress: $clientAddress, ')
          ..write('clientTaxId: $clientTaxId, ')
          ..write('issueDate: $issueDate, ')
          ..write('validUntil: $validUntil, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('notes: $notes, ')
          ..write('terms: $terms, ')
          ..write('discountMode: $discountMode, ')
          ..write('discountBps: $discountBps, ')
          ..write('discountFixedMinor: $discountFixedMinor, ')
          ..write('taxRateBps: $taxRateBps, ')
          ..write('feeLabel: $feeLabel, ')
          ..write('feeMinor: $feeMinor, ')
          ..write('subtotalMinor: $subtotalMinor, ')
          ..write('discountMinor: $discountMinor, ')
          ..write('taxMinor: $taxMinor, ')
          ..write('totalMinor: $totalMinor, ')
          ..write('businessName: $businessName, ')
          ..write('businessOwner: $businessOwner, ')
          ..write('businessTaxId: $businessTaxId, ')
          ..write('businessEmail: $businessEmail, ')
          ..write('businessPhone: $businessPhone, ')
          ..write('businessAddress: $businessAddress, ')
          ..write('businessWebsite: $businessWebsite, ')
          ..write('businessTagline: $businessTagline, ')
          ..write('businessFooter: $businessFooter, ')
          ..write('logoSnapshotPath: $logoSnapshotPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $QuotationLinesTable extends QuotationLines
    with TableInfo<$QuotationLinesTable, QuotationLine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuotationLinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _quotationIdMeta = const VerificationMeta(
    'quotationId',
  );
  @override
  late final GeneratedColumn<int> quotationId = GeneratedColumn<int>(
    'quotation_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES quotations (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<int> position = GeneratedColumn<int>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _catalogItemIdMeta = const VerificationMeta(
    'catalogItemId',
  );
  @override
  late final GeneratedColumn<int> catalogItemId = GeneratedColumn<int>(
    'catalog_item_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES catalog_items (id) ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMilliMeta = const VerificationMeta(
    'quantityMilli',
  );
  @override
  late final GeneratedColumn<int> quantityMilli = GeneratedColumn<int>(
    'quantity_milli',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitPriceMinorMeta = const VerificationMeta(
    'unitPriceMinor',
  );
  @override
  late final GeneratedColumn<int> unitPriceMinor = GeneratedColumn<int>(
    'unit_price_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lineTotalMinorMeta = const VerificationMeta(
    'lineTotalMinor',
  );
  @override
  late final GeneratedColumn<int> lineTotalMinor = GeneratedColumn<int>(
    'line_total_minor',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    quotationId,
    position,
    catalogItemId,
    name,
    description,
    unit,
    kind,
    quantityMilli,
    unitPriceMinor,
    lineTotalMinor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quotation_lines';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuotationLine> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('quotation_id')) {
      context.handle(
        _quotationIdMeta,
        quotationId.isAcceptableOrUnknown(
          data['quotation_id']!,
          _quotationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quotationIdMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('catalog_item_id')) {
      context.handle(
        _catalogItemIdMeta,
        catalogItemId.isAcceptableOrUnknown(
          data['catalog_item_id']!,
          _catalogItemIdMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('quantity_milli')) {
      context.handle(
        _quantityMilliMeta,
        quantityMilli.isAcceptableOrUnknown(
          data['quantity_milli']!,
          _quantityMilliMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quantityMilliMeta);
    }
    if (data.containsKey('unit_price_minor')) {
      context.handle(
        _unitPriceMinorMeta,
        unitPriceMinor.isAcceptableOrUnknown(
          data['unit_price_minor']!,
          _unitPriceMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMinorMeta);
    }
    if (data.containsKey('line_total_minor')) {
      context.handle(
        _lineTotalMinorMeta,
        lineTotalMinor.isAcceptableOrUnknown(
          data['line_total_minor']!,
          _lineTotalMinorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lineTotalMinorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuotationLine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuotationLine(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      quotationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quotation_id'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position'],
      )!,
      catalogItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}catalog_item_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      quantityMilli: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity_milli'],
      )!,
      unitPriceMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price_minor'],
      )!,
      lineTotalMinor: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_total_minor'],
      )!,
    );
  }

  @override
  $QuotationLinesTable createAlias(String alias) {
    return $QuotationLinesTable(attachedDatabase, alias);
  }
}

class QuotationLine extends DataClass implements Insertable<QuotationLine> {
  final int id;
  final int quotationId;
  final int position;
  final int? catalogItemId;
  final String name;
  final String? description;
  final String unit;
  final String kind;
  final int quantityMilli;
  final int unitPriceMinor;
  final int lineTotalMinor;
  const QuotationLine({
    required this.id,
    required this.quotationId,
    required this.position,
    this.catalogItemId,
    required this.name,
    this.description,
    required this.unit,
    required this.kind,
    required this.quantityMilli,
    required this.unitPriceMinor,
    required this.lineTotalMinor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['quotation_id'] = Variable<int>(quotationId);
    map['position'] = Variable<int>(position);
    if (!nullToAbsent || catalogItemId != null) {
      map['catalog_item_id'] = Variable<int>(catalogItemId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['unit'] = Variable<String>(unit);
    map['kind'] = Variable<String>(kind);
    map['quantity_milli'] = Variable<int>(quantityMilli);
    map['unit_price_minor'] = Variable<int>(unitPriceMinor);
    map['line_total_minor'] = Variable<int>(lineTotalMinor);
    return map;
  }

  QuotationLinesCompanion toCompanion(bool nullToAbsent) {
    return QuotationLinesCompanion(
      id: Value(id),
      quotationId: Value(quotationId),
      position: Value(position),
      catalogItemId: catalogItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(catalogItemId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      unit: Value(unit),
      kind: Value(kind),
      quantityMilli: Value(quantityMilli),
      unitPriceMinor: Value(unitPriceMinor),
      lineTotalMinor: Value(lineTotalMinor),
    );
  }

  factory QuotationLine.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuotationLine(
      id: serializer.fromJson<int>(json['id']),
      quotationId: serializer.fromJson<int>(json['quotationId']),
      position: serializer.fromJson<int>(json['position']),
      catalogItemId: serializer.fromJson<int?>(json['catalogItemId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      unit: serializer.fromJson<String>(json['unit']),
      kind: serializer.fromJson<String>(json['kind']),
      quantityMilli: serializer.fromJson<int>(json['quantityMilli']),
      unitPriceMinor: serializer.fromJson<int>(json['unitPriceMinor']),
      lineTotalMinor: serializer.fromJson<int>(json['lineTotalMinor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quotationId': serializer.toJson<int>(quotationId),
      'position': serializer.toJson<int>(position),
      'catalogItemId': serializer.toJson<int?>(catalogItemId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'unit': serializer.toJson<String>(unit),
      'kind': serializer.toJson<String>(kind),
      'quantityMilli': serializer.toJson<int>(quantityMilli),
      'unitPriceMinor': serializer.toJson<int>(unitPriceMinor),
      'lineTotalMinor': serializer.toJson<int>(lineTotalMinor),
    };
  }

  QuotationLine copyWith({
    int? id,
    int? quotationId,
    int? position,
    Value<int?> catalogItemId = const Value.absent(),
    String? name,
    Value<String?> description = const Value.absent(),
    String? unit,
    String? kind,
    int? quantityMilli,
    int? unitPriceMinor,
    int? lineTotalMinor,
  }) => QuotationLine(
    id: id ?? this.id,
    quotationId: quotationId ?? this.quotationId,
    position: position ?? this.position,
    catalogItemId: catalogItemId.present
        ? catalogItemId.value
        : this.catalogItemId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    unit: unit ?? this.unit,
    kind: kind ?? this.kind,
    quantityMilli: quantityMilli ?? this.quantityMilli,
    unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
    lineTotalMinor: lineTotalMinor ?? this.lineTotalMinor,
  );
  QuotationLine copyWithCompanion(QuotationLinesCompanion data) {
    return QuotationLine(
      id: data.id.present ? data.id.value : this.id,
      quotationId: data.quotationId.present
          ? data.quotationId.value
          : this.quotationId,
      position: data.position.present ? data.position.value : this.position,
      catalogItemId: data.catalogItemId.present
          ? data.catalogItemId.value
          : this.catalogItemId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      unit: data.unit.present ? data.unit.value : this.unit,
      kind: data.kind.present ? data.kind.value : this.kind,
      quantityMilli: data.quantityMilli.present
          ? data.quantityMilli.value
          : this.quantityMilli,
      unitPriceMinor: data.unitPriceMinor.present
          ? data.unitPriceMinor.value
          : this.unitPriceMinor,
      lineTotalMinor: data.lineTotalMinor.present
          ? data.lineTotalMinor.value
          : this.lineTotalMinor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuotationLine(')
          ..write('id: $id, ')
          ..write('quotationId: $quotationId, ')
          ..write('position: $position, ')
          ..write('catalogItemId: $catalogItemId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('unit: $unit, ')
          ..write('kind: $kind, ')
          ..write('quantityMilli: $quantityMilli, ')
          ..write('unitPriceMinor: $unitPriceMinor, ')
          ..write('lineTotalMinor: $lineTotalMinor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    quotationId,
    position,
    catalogItemId,
    name,
    description,
    unit,
    kind,
    quantityMilli,
    unitPriceMinor,
    lineTotalMinor,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuotationLine &&
          other.id == this.id &&
          other.quotationId == this.quotationId &&
          other.position == this.position &&
          other.catalogItemId == this.catalogItemId &&
          other.name == this.name &&
          other.description == this.description &&
          other.unit == this.unit &&
          other.kind == this.kind &&
          other.quantityMilli == this.quantityMilli &&
          other.unitPriceMinor == this.unitPriceMinor &&
          other.lineTotalMinor == this.lineTotalMinor);
}

class QuotationLinesCompanion extends UpdateCompanion<QuotationLine> {
  final Value<int> id;
  final Value<int> quotationId;
  final Value<int> position;
  final Value<int?> catalogItemId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> unit;
  final Value<String> kind;
  final Value<int> quantityMilli;
  final Value<int> unitPriceMinor;
  final Value<int> lineTotalMinor;
  const QuotationLinesCompanion({
    this.id = const Value.absent(),
    this.quotationId = const Value.absent(),
    this.position = const Value.absent(),
    this.catalogItemId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.unit = const Value.absent(),
    this.kind = const Value.absent(),
    this.quantityMilli = const Value.absent(),
    this.unitPriceMinor = const Value.absent(),
    this.lineTotalMinor = const Value.absent(),
  });
  QuotationLinesCompanion.insert({
    this.id = const Value.absent(),
    required int quotationId,
    required int position,
    this.catalogItemId = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required String unit,
    required String kind,
    required int quantityMilli,
    required int unitPriceMinor,
    required int lineTotalMinor,
  }) : quotationId = Value(quotationId),
       position = Value(position),
       name = Value(name),
       unit = Value(unit),
       kind = Value(kind),
       quantityMilli = Value(quantityMilli),
       unitPriceMinor = Value(unitPriceMinor),
       lineTotalMinor = Value(lineTotalMinor);
  static Insertable<QuotationLine> custom({
    Expression<int>? id,
    Expression<int>? quotationId,
    Expression<int>? position,
    Expression<int>? catalogItemId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? unit,
    Expression<String>? kind,
    Expression<int>? quantityMilli,
    Expression<int>? unitPriceMinor,
    Expression<int>? lineTotalMinor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quotationId != null) 'quotation_id': quotationId,
      if (position != null) 'position': position,
      if (catalogItemId != null) 'catalog_item_id': catalogItemId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (unit != null) 'unit': unit,
      if (kind != null) 'kind': kind,
      if (quantityMilli != null) 'quantity_milli': quantityMilli,
      if (unitPriceMinor != null) 'unit_price_minor': unitPriceMinor,
      if (lineTotalMinor != null) 'line_total_minor': lineTotalMinor,
    });
  }

  QuotationLinesCompanion copyWith({
    Value<int>? id,
    Value<int>? quotationId,
    Value<int>? position,
    Value<int?>? catalogItemId,
    Value<String>? name,
    Value<String?>? description,
    Value<String>? unit,
    Value<String>? kind,
    Value<int>? quantityMilli,
    Value<int>? unitPriceMinor,
    Value<int>? lineTotalMinor,
  }) {
    return QuotationLinesCompanion(
      id: id ?? this.id,
      quotationId: quotationId ?? this.quotationId,
      position: position ?? this.position,
      catalogItemId: catalogItemId ?? this.catalogItemId,
      name: name ?? this.name,
      description: description ?? this.description,
      unit: unit ?? this.unit,
      kind: kind ?? this.kind,
      quantityMilli: quantityMilli ?? this.quantityMilli,
      unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
      lineTotalMinor: lineTotalMinor ?? this.lineTotalMinor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (quotationId.present) {
      map['quotation_id'] = Variable<int>(quotationId.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (catalogItemId.present) {
      map['catalog_item_id'] = Variable<int>(catalogItemId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (quantityMilli.present) {
      map['quantity_milli'] = Variable<int>(quantityMilli.value);
    }
    if (unitPriceMinor.present) {
      map['unit_price_minor'] = Variable<int>(unitPriceMinor.value);
    }
    if (lineTotalMinor.present) {
      map['line_total_minor'] = Variable<int>(lineTotalMinor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuotationLinesCompanion(')
          ..write('id: $id, ')
          ..write('quotationId: $quotationId, ')
          ..write('position: $position, ')
          ..write('catalogItemId: $catalogItemId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('unit: $unit, ')
          ..write('kind: $kind, ')
          ..write('quantityMilli: $quantityMilli, ')
          ..write('unitPriceMinor: $unitPriceMinor, ')
          ..write('lineTotalMinor: $lineTotalMinor')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BusinessProfilesTable businessProfiles = $BusinessProfilesTable(
    this,
  );
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $ClientsTable clients = $ClientsTable(this);
  late final $CatalogItemsTable catalogItems = $CatalogItemsTable(this);
  late final $QuotationsTable quotations = $QuotationsTable(this);
  late final $QuotationLinesTable quotationLines = $QuotationLinesTable(this);
  late final Index idxCatalogCategory = Index(
    'idx_catalog_category',
    'CREATE INDEX idx_catalog_category ON catalog_items (category)',
  );
  late final Index idxQuotesClient = Index(
    'idx_quotes_client',
    'CREATE INDEX idx_quotes_client ON quotations (client_id)',
  );
  late final Index idxQuotesUpdated = Index(
    'idx_quotes_updated',
    'CREATE INDEX idx_quotes_updated ON quotations (updated_at)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    businessProfiles,
    appSettings,
    clients,
    catalogItems,
    quotations,
    quotationLines,
    idxCatalogCategory,
    idxQuotesClient,
    idxQuotesUpdated,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'clients',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('quotations', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'quotations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('quotation_lines', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'catalog_items',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('quotation_lines', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$BusinessProfilesTableCreateCompanionBuilder =
    BusinessProfilesCompanion Function({
      Value<int> id,
      Value<String> businessName,
      Value<String> ownerName,
      Value<String?> taxId,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> website,
      Value<String?> addressLine,
      Value<String?> city,
      Value<String?> region,
      Value<String?> postalCode,
      Value<String?> country,
      Value<String?> logoPath,
      Value<String> currencyCode,
      Value<String> quotePrefix,
      Value<int> nextQuoteNumber,
      Value<int> defaultTaxBps,
      Value<int> defaultValidityDays,
      Value<String> defaultNotes,
      Value<String> defaultTerms,
      Value<String> pdfFooter,
      Value<String> tagline,
      required DateTime updatedAt,
    });
typedef $$BusinessProfilesTableUpdateCompanionBuilder =
    BusinessProfilesCompanion Function({
      Value<int> id,
      Value<String> businessName,
      Value<String> ownerName,
      Value<String?> taxId,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> website,
      Value<String?> addressLine,
      Value<String?> city,
      Value<String?> region,
      Value<String?> postalCode,
      Value<String?> country,
      Value<String?> logoPath,
      Value<String> currencyCode,
      Value<String> quotePrefix,
      Value<int> nextQuoteNumber,
      Value<int> defaultTaxBps,
      Value<int> defaultValidityDays,
      Value<String> defaultNotes,
      Value<String> defaultTerms,
      Value<String> pdfFooter,
      Value<String> tagline,
      Value<DateTime> updatedAt,
    });

class $$BusinessProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessProfilesTable> {
  $$BusinessProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxId => $composableBuilder(
    column: $table.taxId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addressLine => $composableBuilder(
    column: $table.addressLine,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postalCode => $composableBuilder(
    column: $table.postalCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quotePrefix => $composableBuilder(
    column: $table.quotePrefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextQuoteNumber => $composableBuilder(
    column: $table.nextQuoteNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultTaxBps => $composableBuilder(
    column: $table.defaultTaxBps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultValidityDays => $composableBuilder(
    column: $table.defaultValidityDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultNotes => $composableBuilder(
    column: $table.defaultNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get defaultTerms => $composableBuilder(
    column: $table.defaultTerms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pdfFooter => $composableBuilder(
    column: $table.pdfFooter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tagline => $composableBuilder(
    column: $table.tagline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BusinessProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessProfilesTable> {
  $$BusinessProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerName => $composableBuilder(
    column: $table.ownerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxId => $composableBuilder(
    column: $table.taxId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get website => $composableBuilder(
    column: $table.website,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addressLine => $composableBuilder(
    column: $table.addressLine,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postalCode => $composableBuilder(
    column: $table.postalCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoPath => $composableBuilder(
    column: $table.logoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quotePrefix => $composableBuilder(
    column: $table.quotePrefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextQuoteNumber => $composableBuilder(
    column: $table.nextQuoteNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultTaxBps => $composableBuilder(
    column: $table.defaultTaxBps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultValidityDays => $composableBuilder(
    column: $table.defaultValidityDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultNotes => $composableBuilder(
    column: $table.defaultNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get defaultTerms => $composableBuilder(
    column: $table.defaultTerms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pdfFooter => $composableBuilder(
    column: $table.pdfFooter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tagline => $composableBuilder(
    column: $table.tagline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BusinessProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessProfilesTable> {
  $$BusinessProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerName =>
      $composableBuilder(column: $table.ownerName, builder: (column) => column);

  GeneratedColumn<String> get taxId =>
      $composableBuilder(column: $table.taxId, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get addressLine => $composableBuilder(
    column: $table.addressLine,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get region =>
      $composableBuilder(column: $table.region, builder: (column) => column);

  GeneratedColumn<String> get postalCode => $composableBuilder(
    column: $table.postalCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get logoPath =>
      $composableBuilder(column: $table.logoPath, builder: (column) => column);

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quotePrefix => $composableBuilder(
    column: $table.quotePrefix,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nextQuoteNumber => $composableBuilder(
    column: $table.nextQuoteNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get defaultTaxBps => $composableBuilder(
    column: $table.defaultTaxBps,
    builder: (column) => column,
  );

  GeneratedColumn<int> get defaultValidityDays => $composableBuilder(
    column: $table.defaultValidityDays,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultNotes => $composableBuilder(
    column: $table.defaultNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get defaultTerms => $composableBuilder(
    column: $table.defaultTerms,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pdfFooter =>
      $composableBuilder(column: $table.pdfFooter, builder: (column) => column);

  GeneratedColumn<String> get tagline =>
      $composableBuilder(column: $table.tagline, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BusinessProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusinessProfilesTable,
          BusinessProfile,
          $$BusinessProfilesTableFilterComposer,
          $$BusinessProfilesTableOrderingComposer,
          $$BusinessProfilesTableAnnotationComposer,
          $$BusinessProfilesTableCreateCompanionBuilder,
          $$BusinessProfilesTableUpdateCompanionBuilder,
          (
            BusinessProfile,
            BaseReferences<
              _$AppDatabase,
              $BusinessProfilesTable,
              BusinessProfile
            >,
          ),
          BusinessProfile,
          PrefetchHooks Function()
        > {
  $$BusinessProfilesTableTableManager(
    _$AppDatabase db,
    $BusinessProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> businessName = const Value.absent(),
                Value<String> ownerName = const Value.absent(),
                Value<String?> taxId = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> website = const Value.absent(),
                Value<String?> addressLine = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> region = const Value.absent(),
                Value<String?> postalCode = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<String> quotePrefix = const Value.absent(),
                Value<int> nextQuoteNumber = const Value.absent(),
                Value<int> defaultTaxBps = const Value.absent(),
                Value<int> defaultValidityDays = const Value.absent(),
                Value<String> defaultNotes = const Value.absent(),
                Value<String> defaultTerms = const Value.absent(),
                Value<String> pdfFooter = const Value.absent(),
                Value<String> tagline = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => BusinessProfilesCompanion(
                id: id,
                businessName: businessName,
                ownerName: ownerName,
                taxId: taxId,
                email: email,
                phone: phone,
                website: website,
                addressLine: addressLine,
                city: city,
                region: region,
                postalCode: postalCode,
                country: country,
                logoPath: logoPath,
                currencyCode: currencyCode,
                quotePrefix: quotePrefix,
                nextQuoteNumber: nextQuoteNumber,
                defaultTaxBps: defaultTaxBps,
                defaultValidityDays: defaultValidityDays,
                defaultNotes: defaultNotes,
                defaultTerms: defaultTerms,
                pdfFooter: pdfFooter,
                tagline: tagline,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> businessName = const Value.absent(),
                Value<String> ownerName = const Value.absent(),
                Value<String?> taxId = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> website = const Value.absent(),
                Value<String?> addressLine = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> region = const Value.absent(),
                Value<String?> postalCode = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> logoPath = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<String> quotePrefix = const Value.absent(),
                Value<int> nextQuoteNumber = const Value.absent(),
                Value<int> defaultTaxBps = const Value.absent(),
                Value<int> defaultValidityDays = const Value.absent(),
                Value<String> defaultNotes = const Value.absent(),
                Value<String> defaultTerms = const Value.absent(),
                Value<String> pdfFooter = const Value.absent(),
                Value<String> tagline = const Value.absent(),
                required DateTime updatedAt,
              }) => BusinessProfilesCompanion.insert(
                id: id,
                businessName: businessName,
                ownerName: ownerName,
                taxId: taxId,
                email: email,
                phone: phone,
                website: website,
                addressLine: addressLine,
                city: city,
                region: region,
                postalCode: postalCode,
                country: country,
                logoPath: logoPath,
                currencyCode: currencyCode,
                quotePrefix: quotePrefix,
                nextQuoteNumber: nextQuoteNumber,
                defaultTaxBps: defaultTaxBps,
                defaultValidityDays: defaultValidityDays,
                defaultNotes: defaultNotes,
                defaultTerms: defaultTerms,
                pdfFooter: pdfFooter,
                tagline: tagline,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BusinessProfilesTable, BusinessProfile>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $BusinessProfilesTable,
                    BusinessProfile
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BusinessProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusinessProfilesTable,
      BusinessProfile,
      $$BusinessProfilesTableFilterComposer,
      $$BusinessProfilesTableOrderingComposer,
      $$BusinessProfilesTableAnnotationComposer,
      $$BusinessProfilesTableCreateCompanionBuilder,
      $$BusinessProfilesTableUpdateCompanionBuilder,
      (
        BusinessProfile,
        BaseReferences<_$AppDatabase, $BusinessProfilesTable, BusinessProfile>,
      ),
      BusinessProfile,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      Value<String> themeMode,
      Value<String> localeCode,
      Value<bool> isPro,
      Value<String?> proProductId,
      Value<String?> proTransactionId,
      Value<DateTime?> proUnlockedAt,
      Value<bool> pdfShowNotes,
      Value<bool> pdfShowTerms,
      Value<bool> pdfShowLogo,
      Value<bool> pdfHideBranding,
      Value<bool> pdfShowSignature,
      Value<bool> pdfShowTagline,
      required DateTime updatedAt,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      Value<String> themeMode,
      Value<String> localeCode,
      Value<bool> isPro,
      Value<String?> proProductId,
      Value<String?> proTransactionId,
      Value<DateTime?> proUnlockedAt,
      Value<bool> pdfShowNotes,
      Value<bool> pdfShowTerms,
      Value<bool> pdfShowLogo,
      Value<bool> pdfHideBranding,
      Value<bool> pdfShowSignature,
      Value<bool> pdfShowTagline,
      Value<DateTime> updatedAt,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localeCode => $composableBuilder(
    column: $table.localeCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPro => $composableBuilder(
    column: $table.isPro,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get proProductId => $composableBuilder(
    column: $table.proProductId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get proTransactionId => $composableBuilder(
    column: $table.proTransactionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get proUnlockedAt => $composableBuilder(
    column: $table.proUnlockedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pdfShowNotes => $composableBuilder(
    column: $table.pdfShowNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pdfShowTerms => $composableBuilder(
    column: $table.pdfShowTerms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pdfShowLogo => $composableBuilder(
    column: $table.pdfShowLogo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pdfHideBranding => $composableBuilder(
    column: $table.pdfHideBranding,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pdfShowSignature => $composableBuilder(
    column: $table.pdfShowSignature,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pdfShowTagline => $composableBuilder(
    column: $table.pdfShowTagline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localeCode => $composableBuilder(
    column: $table.localeCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPro => $composableBuilder(
    column: $table.isPro,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get proProductId => $composableBuilder(
    column: $table.proProductId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get proTransactionId => $composableBuilder(
    column: $table.proTransactionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get proUnlockedAt => $composableBuilder(
    column: $table.proUnlockedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pdfShowNotes => $composableBuilder(
    column: $table.pdfShowNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pdfShowTerms => $composableBuilder(
    column: $table.pdfShowTerms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pdfShowLogo => $composableBuilder(
    column: $table.pdfShowLogo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pdfHideBranding => $composableBuilder(
    column: $table.pdfHideBranding,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pdfShowSignature => $composableBuilder(
    column: $table.pdfShowSignature,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pdfShowTagline => $composableBuilder(
    column: $table.pdfShowTagline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<String> get localeCode => $composableBuilder(
    column: $table.localeCode,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isPro =>
      $composableBuilder(column: $table.isPro, builder: (column) => column);

  GeneratedColumn<String> get proProductId => $composableBuilder(
    column: $table.proProductId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get proTransactionId => $composableBuilder(
    column: $table.proTransactionId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get proUnlockedAt => $composableBuilder(
    column: $table.proUnlockedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get pdfShowNotes => $composableBuilder(
    column: $table.pdfShowNotes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get pdfShowTerms => $composableBuilder(
    column: $table.pdfShowTerms,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get pdfShowLogo => $composableBuilder(
    column: $table.pdfShowLogo,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get pdfHideBranding => $composableBuilder(
    column: $table.pdfHideBranding,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get pdfShowSignature => $composableBuilder(
    column: $table.pdfShowSignature,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get pdfShowTagline => $composableBuilder(
    column: $table.pdfShowTagline,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<String> localeCode = const Value.absent(),
                Value<bool> isPro = const Value.absent(),
                Value<String?> proProductId = const Value.absent(),
                Value<String?> proTransactionId = const Value.absent(),
                Value<DateTime?> proUnlockedAt = const Value.absent(),
                Value<bool> pdfShowNotes = const Value.absent(),
                Value<bool> pdfShowTerms = const Value.absent(),
                Value<bool> pdfShowLogo = const Value.absent(),
                Value<bool> pdfHideBranding = const Value.absent(),
                Value<bool> pdfShowSignature = const Value.absent(),
                Value<bool> pdfShowTagline = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AppSettingsCompanion(
                id: id,
                themeMode: themeMode,
                localeCode: localeCode,
                isPro: isPro,
                proProductId: proProductId,
                proTransactionId: proTransactionId,
                proUnlockedAt: proUnlockedAt,
                pdfShowNotes: pdfShowNotes,
                pdfShowTerms: pdfShowTerms,
                pdfShowLogo: pdfShowLogo,
                pdfHideBranding: pdfHideBranding,
                pdfShowSignature: pdfShowSignature,
                pdfShowTagline: pdfShowTagline,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> themeMode = const Value.absent(),
                Value<String> localeCode = const Value.absent(),
                Value<bool> isPro = const Value.absent(),
                Value<String?> proProductId = const Value.absent(),
                Value<String?> proTransactionId = const Value.absent(),
                Value<DateTime?> proUnlockedAt = const Value.absent(),
                Value<bool> pdfShowNotes = const Value.absent(),
                Value<bool> pdfShowTerms = const Value.absent(),
                Value<bool> pdfShowLogo = const Value.absent(),
                Value<bool> pdfHideBranding = const Value.absent(),
                Value<bool> pdfShowSignature = const Value.absent(),
                Value<bool> pdfShowTagline = const Value.absent(),
                required DateTime updatedAt,
              }) => AppSettingsCompanion.insert(
                id: id,
                themeMode: themeMode,
                localeCode: localeCode,
                isPro: isPro,
                proProductId: proProductId,
                proTransactionId: proTransactionId,
                proUnlockedAt: proUnlockedAt,
                pdfShowNotes: pdfShowNotes,
                pdfShowTerms: pdfShowTerms,
                pdfShowLogo: pdfShowLogo,
                pdfHideBranding: pdfHideBranding,
                pdfShowSignature: pdfShowSignature,
                pdfShowTagline: pdfShowTagline,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$AppSettingsTable, AppSetting>(table),
                  BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;
typedef $$ClientsTableCreateCompanionBuilder =
    ClientsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> company,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> address,
      Value<String?> taxId,
      Value<String?> notes,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$ClientsTableUpdateCompanionBuilder =
    ClientsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> company,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> address,
      Value<String?> taxId,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$ClientsTableReferences
    extends BaseReferences<_$AppDatabase, $ClientsTable, Client> {
  $$ClientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$QuotationsTable, List<Quotation>>
  _quotationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.quotations,
    aliasName: 'clients__id__quotations__client_id',
  );

  $$QuotationsTableProcessedTableManager get quotationsRefs {
    final manager = $$QuotationsTableTableManager(
      $_db,
      $_db.quotations,
    ).filter((f) => f.clientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_quotationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ClientsTableFilterComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get company => $composableBuilder(
    column: $table.company,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxId => $composableBuilder(
    column: $table.taxId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> quotationsRefs(
    Expression<bool> Function($$QuotationsTableFilterComposer f) f,
  ) {
    final $$QuotationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.quotations,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuotationsTableFilterComposer(
            $db: $db,
            $table: $db.quotations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get company => $composableBuilder(
    column: $table.company,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxId => $composableBuilder(
    column: $table.taxId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get company =>
      $composableBuilder(column: $table.company, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get taxId =>
      $composableBuilder(column: $table.taxId, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> quotationsRefs<T extends Object>(
    Expression<T> Function($$QuotationsTableAnnotationComposer a) f,
  ) {
    final $$QuotationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.quotations,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuotationsTableAnnotationComposer(
            $db: $db,
            $table: $db.quotations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientsTable,
          Client,
          $$ClientsTableFilterComposer,
          $$ClientsTableOrderingComposer,
          $$ClientsTableAnnotationComposer,
          $$ClientsTableCreateCompanionBuilder,
          $$ClientsTableUpdateCompanionBuilder,
          (Client, $$ClientsTableReferences),
          Client,
          PrefetchHooks Function({bool quotationsRefs})
        > {
  $$ClientsTableTableManager(_$AppDatabase db, $ClientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> company = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> taxId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ClientsCompanion(
                id: id,
                name: name,
                company: company,
                email: email,
                phone: phone,
                address: address,
                taxId: taxId,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> company = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> taxId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => ClientsCompanion.insert(
                id: id,
                name: name,
                company: company,
                email: email,
                phone: phone,
                address: address,
                taxId: taxId,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ClientsTable, Client>(table),
                  $$ClientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({quotationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (quotationsRefs) db.quotations],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (quotationsRefs)
                    await $_getPrefetchedData<Client, $ClientsTable, Quotation>(
                      currentTable: table,
                      referencedTable: $$ClientsTableReferences
                          ._quotationsRefsTable(db),
                      managerFromTypedResult: (p0) => $$ClientsTableReferences(
                        db,
                        table,
                        p0,
                      ).quotationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.clientId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ClientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientsTable,
      Client,
      $$ClientsTableFilterComposer,
      $$ClientsTableOrderingComposer,
      $$ClientsTableAnnotationComposer,
      $$ClientsTableCreateCompanionBuilder,
      $$ClientsTableUpdateCompanionBuilder,
      (Client, $$ClientsTableReferences),
      Client,
      PrefetchHooks Function({bool quotationsRefs})
    >;
typedef $$CatalogItemsTableCreateCompanionBuilder =
    CatalogItemsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
      Value<String> category,
      Value<String> unit,
      required int unitPriceMinor,
      required String kind,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$CatalogItemsTableUpdateCompanionBuilder =
    CatalogItemsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
      Value<String> category,
      Value<String> unit,
      Value<int> unitPriceMinor,
      Value<String> kind,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$CatalogItemsTableReferences
    extends BaseReferences<_$AppDatabase, $CatalogItemsTable, CatalogItem> {
  $$CatalogItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$QuotationLinesTable, List<QuotationLine>>
  _quotationLinesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.quotationLines,
    aliasName: 'catalog_items__id__quotation_lines__catalog_item_id',
  );

  $$QuotationLinesTableProcessedTableManager get quotationLinesRefs {
    final manager = $$QuotationLinesTableTableManager(
      $_db,
      $_db.quotationLines,
    ).filter((f) => f.catalogItemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_quotationLinesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CatalogItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CatalogItemsTable> {
  $$CatalogItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> quotationLinesRefs(
    Expression<bool> Function($$QuotationLinesTableFilterComposer f) f,
  ) {
    final $$QuotationLinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.quotationLines,
      getReferencedColumn: (t) => t.catalogItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuotationLinesTableFilterComposer(
            $db: $db,
            $table: $db.quotationLines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CatalogItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CatalogItemsTable> {
  $$CatalogItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CatalogItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CatalogItemsTable> {
  $$CatalogItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> quotationLinesRefs<T extends Object>(
    Expression<T> Function($$QuotationLinesTableAnnotationComposer a) f,
  ) {
    final $$QuotationLinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.quotationLines,
      getReferencedColumn: (t) => t.catalogItemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuotationLinesTableAnnotationComposer(
            $db: $db,
            $table: $db.quotationLines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CatalogItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CatalogItemsTable,
          CatalogItem,
          $$CatalogItemsTableFilterComposer,
          $$CatalogItemsTableOrderingComposer,
          $$CatalogItemsTableAnnotationComposer,
          $$CatalogItemsTableCreateCompanionBuilder,
          $$CatalogItemsTableUpdateCompanionBuilder,
          (CatalogItem, $$CatalogItemsTableReferences),
          CatalogItem,
          PrefetchHooks Function({bool quotationLinesRefs})
        > {
  $$CatalogItemsTableTableManager(_$AppDatabase db, $CatalogItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CatalogItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CatalogItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CatalogItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<int> unitPriceMinor = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CatalogItemsCompanion(
                id: id,
                name: name,
                description: description,
                category: category,
                unit: unit,
                unitPriceMinor: unitPriceMinor,
                kind: kind,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> unit = const Value.absent(),
                required int unitPriceMinor,
                required String kind,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => CatalogItemsCompanion.insert(
                id: id,
                name: name,
                description: description,
                category: category,
                unit: unit,
                unitPriceMinor: unitPriceMinor,
                kind: kind,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CatalogItemsTable, CatalogItem>(table),
                  $$CatalogItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({quotationLinesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (quotationLinesRefs) db.quotationLines,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (quotationLinesRefs)
                    await $_getPrefetchedData<
                      CatalogItem,
                      $CatalogItemsTable,
                      QuotationLine
                    >(
                      currentTable: table,
                      referencedTable: $$CatalogItemsTableReferences
                          ._quotationLinesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CatalogItemsTableReferences(
                            db,
                            table,
                            p0,
                          ).quotationLinesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.catalogItemId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CatalogItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CatalogItemsTable,
      CatalogItem,
      $$CatalogItemsTableFilterComposer,
      $$CatalogItemsTableOrderingComposer,
      $$CatalogItemsTableAnnotationComposer,
      $$CatalogItemsTableCreateCompanionBuilder,
      $$CatalogItemsTableUpdateCompanionBuilder,
      (CatalogItem, $$CatalogItemsTableReferences),
      CatalogItem,
      PrefetchHooks Function({bool quotationLinesRefs})
    >;
typedef $$QuotationsTableCreateCompanionBuilder =
    QuotationsCompanion Function({
      Value<int> id,
      required String number,
      required String status,
      Value<int?> clientId,
      required String clientName,
      Value<String?> clientCompany,
      Value<String?> clientEmail,
      Value<String?> clientPhone,
      Value<String?> clientAddress,
      Value<String?> clientTaxId,
      required DateTime issueDate,
      required DateTime validUntil,
      required String currencyCode,
      Value<String> notes,
      Value<String> terms,
      Value<String> discountMode,
      Value<int> discountBps,
      Value<int> discountFixedMinor,
      Value<int> taxRateBps,
      Value<String> feeLabel,
      Value<int> feeMinor,
      required int subtotalMinor,
      required int discountMinor,
      required int taxMinor,
      required int totalMinor,
      Value<String> businessName,
      Value<String> businessOwner,
      Value<String?> businessTaxId,
      Value<String?> businessEmail,
      Value<String?> businessPhone,
      Value<String?> businessAddress,
      Value<String?> businessWebsite,
      Value<String> businessTagline,
      Value<String> businessFooter,
      Value<String?> logoSnapshotPath,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$QuotationsTableUpdateCompanionBuilder =
    QuotationsCompanion Function({
      Value<int> id,
      Value<String> number,
      Value<String> status,
      Value<int?> clientId,
      Value<String> clientName,
      Value<String?> clientCompany,
      Value<String?> clientEmail,
      Value<String?> clientPhone,
      Value<String?> clientAddress,
      Value<String?> clientTaxId,
      Value<DateTime> issueDate,
      Value<DateTime> validUntil,
      Value<String> currencyCode,
      Value<String> notes,
      Value<String> terms,
      Value<String> discountMode,
      Value<int> discountBps,
      Value<int> discountFixedMinor,
      Value<int> taxRateBps,
      Value<String> feeLabel,
      Value<int> feeMinor,
      Value<int> subtotalMinor,
      Value<int> discountMinor,
      Value<int> taxMinor,
      Value<int> totalMinor,
      Value<String> businessName,
      Value<String> businessOwner,
      Value<String?> businessTaxId,
      Value<String?> businessEmail,
      Value<String?> businessPhone,
      Value<String?> businessAddress,
      Value<String?> businessWebsite,
      Value<String> businessTagline,
      Value<String> businessFooter,
      Value<String?> logoSnapshotPath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$QuotationsTableReferences
    extends BaseReferences<_$AppDatabase, $QuotationsTable, Quotation> {
  $$QuotationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTable _clientIdTable(_$AppDatabase db) =>
      db.clients.createAlias('quotations__client_id__clients__id');

  $$ClientsTableProcessedTableManager? get clientId {
    final $_column = $_itemColumn<int>('client_id');
    if ($_column == null) return null;
    final manager = $$ClientsTableTableManager(
      $_db,
      $_db.clients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$QuotationLinesTable, List<QuotationLine>>
  _quotationLinesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.quotationLines,
    aliasName: 'quotations__id__quotation_lines__quotation_id',
  );

  $$QuotationLinesTableProcessedTableManager get quotationLinesRefs {
    final manager = $$QuotationLinesTableTableManager(
      $_db,
      $_db.quotationLines,
    ).filter((f) => f.quotationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_quotationLinesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$QuotationsTableFilterComposer
    extends Composer<_$AppDatabase, $QuotationsTable> {
  $$QuotationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientCompany => $composableBuilder(
    column: $table.clientCompany,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientPhone => $composableBuilder(
    column: $table.clientPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientAddress => $composableBuilder(
    column: $table.clientAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientTaxId => $composableBuilder(
    column: $table.clientTaxId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get issueDate => $composableBuilder(
    column: $table.issueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get validUntil => $composableBuilder(
    column: $table.validUntil,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get terms => $composableBuilder(
    column: $table.terms,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get discountMode => $composableBuilder(
    column: $table.discountMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discountBps => $composableBuilder(
    column: $table.discountBps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discountFixedMinor => $composableBuilder(
    column: $table.discountFixedMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taxRateBps => $composableBuilder(
    column: $table.taxRateBps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get feeLabel => $composableBuilder(
    column: $table.feeLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get feeMinor => $composableBuilder(
    column: $table.feeMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get subtotalMinor => $composableBuilder(
    column: $table.subtotalMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get taxMinor => $composableBuilder(
    column: $table.taxMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessOwner => $composableBuilder(
    column: $table.businessOwner,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessTaxId => $composableBuilder(
    column: $table.businessTaxId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessEmail => $composableBuilder(
    column: $table.businessEmail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessPhone => $composableBuilder(
    column: $table.businessPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessAddress => $composableBuilder(
    column: $table.businessAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessWebsite => $composableBuilder(
    column: $table.businessWebsite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessTagline => $composableBuilder(
    column: $table.businessTagline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessFooter => $composableBuilder(
    column: $table.businessFooter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoSnapshotPath => $composableBuilder(
    column: $table.logoSnapshotPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableFilterComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> quotationLinesRefs(
    Expression<bool> Function($$QuotationLinesTableFilterComposer f) f,
  ) {
    final $$QuotationLinesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.quotationLines,
      getReferencedColumn: (t) => t.quotationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuotationLinesTableFilterComposer(
            $db: $db,
            $table: $db.quotationLines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuotationsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuotationsTable> {
  $$QuotationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientCompany => $composableBuilder(
    column: $table.clientCompany,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientPhone => $composableBuilder(
    column: $table.clientPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientAddress => $composableBuilder(
    column: $table.clientAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientTaxId => $composableBuilder(
    column: $table.clientTaxId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get issueDate => $composableBuilder(
    column: $table.issueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get validUntil => $composableBuilder(
    column: $table.validUntil,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get terms => $composableBuilder(
    column: $table.terms,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get discountMode => $composableBuilder(
    column: $table.discountMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountBps => $composableBuilder(
    column: $table.discountBps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountFixedMinor => $composableBuilder(
    column: $table.discountFixedMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get taxRateBps => $composableBuilder(
    column: $table.taxRateBps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get feeLabel => $composableBuilder(
    column: $table.feeLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get feeMinor => $composableBuilder(
    column: $table.feeMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get subtotalMinor => $composableBuilder(
    column: $table.subtotalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get taxMinor => $composableBuilder(
    column: $table.taxMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessOwner => $composableBuilder(
    column: $table.businessOwner,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessTaxId => $composableBuilder(
    column: $table.businessTaxId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessEmail => $composableBuilder(
    column: $table.businessEmail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessPhone => $composableBuilder(
    column: $table.businessPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessAddress => $composableBuilder(
    column: $table.businessAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessWebsite => $composableBuilder(
    column: $table.businessWebsite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessTagline => $composableBuilder(
    column: $table.businessTagline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessFooter => $composableBuilder(
    column: $table.businessFooter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoSnapshotPath => $composableBuilder(
    column: $table.logoSnapshotPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableOrderingComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuotationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuotationsTable> {
  $$QuotationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get clientName => $composableBuilder(
    column: $table.clientName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientCompany => $composableBuilder(
    column: $table.clientCompany,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientEmail => $composableBuilder(
    column: $table.clientEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientPhone => $composableBuilder(
    column: $table.clientPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientAddress => $composableBuilder(
    column: $table.clientAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get clientTaxId => $composableBuilder(
    column: $table.clientTaxId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get issueDate =>
      $composableBuilder(column: $table.issueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get validUntil => $composableBuilder(
    column: $table.validUntil,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get terms =>
      $composableBuilder(column: $table.terms, builder: (column) => column);

  GeneratedColumn<String> get discountMode => $composableBuilder(
    column: $table.discountMode,
    builder: (column) => column,
  );

  GeneratedColumn<int> get discountBps => $composableBuilder(
    column: $table.discountBps,
    builder: (column) => column,
  );

  GeneratedColumn<int> get discountFixedMinor => $composableBuilder(
    column: $table.discountFixedMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get taxRateBps => $composableBuilder(
    column: $table.taxRateBps,
    builder: (column) => column,
  );

  GeneratedColumn<String> get feeLabel =>
      $composableBuilder(column: $table.feeLabel, builder: (column) => column);

  GeneratedColumn<int> get feeMinor =>
      $composableBuilder(column: $table.feeMinor, builder: (column) => column);

  GeneratedColumn<int> get subtotalMinor => $composableBuilder(
    column: $table.subtotalMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get discountMinor => $composableBuilder(
    column: $table.discountMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get taxMinor =>
      $composableBuilder(column: $table.taxMinor, builder: (column) => column);

  GeneratedColumn<int> get totalMinor => $composableBuilder(
    column: $table.totalMinor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get businessOwner => $composableBuilder(
    column: $table.businessOwner,
    builder: (column) => column,
  );

  GeneratedColumn<String> get businessTaxId => $composableBuilder(
    column: $table.businessTaxId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get businessEmail => $composableBuilder(
    column: $table.businessEmail,
    builder: (column) => column,
  );

  GeneratedColumn<String> get businessPhone => $composableBuilder(
    column: $table.businessPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get businessAddress => $composableBuilder(
    column: $table.businessAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get businessWebsite => $composableBuilder(
    column: $table.businessWebsite,
    builder: (column) => column,
  );

  GeneratedColumn<String> get businessTagline => $composableBuilder(
    column: $table.businessTagline,
    builder: (column) => column,
  );

  GeneratedColumn<String> get businessFooter => $composableBuilder(
    column: $table.businessFooter,
    builder: (column) => column,
  );

  GeneratedColumn<String> get logoSnapshotPath => $composableBuilder(
    column: $table.logoSnapshotPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableAnnotationComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> quotationLinesRefs<T extends Object>(
    Expression<T> Function($$QuotationLinesTableAnnotationComposer a) f,
  ) {
    final $$QuotationLinesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.quotationLines,
      getReferencedColumn: (t) => t.quotationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuotationLinesTableAnnotationComposer(
            $db: $db,
            $table: $db.quotationLines,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuotationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuotationsTable,
          Quotation,
          $$QuotationsTableFilterComposer,
          $$QuotationsTableOrderingComposer,
          $$QuotationsTableAnnotationComposer,
          $$QuotationsTableCreateCompanionBuilder,
          $$QuotationsTableUpdateCompanionBuilder,
          (Quotation, $$QuotationsTableReferences),
          Quotation,
          PrefetchHooks Function({bool clientId, bool quotationLinesRefs})
        > {
  $$QuotationsTableTableManager(_$AppDatabase db, $QuotationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuotationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuotationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuotationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> number = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> clientId = const Value.absent(),
                Value<String> clientName = const Value.absent(),
                Value<String?> clientCompany = const Value.absent(),
                Value<String?> clientEmail = const Value.absent(),
                Value<String?> clientPhone = const Value.absent(),
                Value<String?> clientAddress = const Value.absent(),
                Value<String?> clientTaxId = const Value.absent(),
                Value<DateTime> issueDate = const Value.absent(),
                Value<DateTime> validUntil = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String> terms = const Value.absent(),
                Value<String> discountMode = const Value.absent(),
                Value<int> discountBps = const Value.absent(),
                Value<int> discountFixedMinor = const Value.absent(),
                Value<int> taxRateBps = const Value.absent(),
                Value<String> feeLabel = const Value.absent(),
                Value<int> feeMinor = const Value.absent(),
                Value<int> subtotalMinor = const Value.absent(),
                Value<int> discountMinor = const Value.absent(),
                Value<int> taxMinor = const Value.absent(),
                Value<int> totalMinor = const Value.absent(),
                Value<String> businessName = const Value.absent(),
                Value<String> businessOwner = const Value.absent(),
                Value<String?> businessTaxId = const Value.absent(),
                Value<String?> businessEmail = const Value.absent(),
                Value<String?> businessPhone = const Value.absent(),
                Value<String?> businessAddress = const Value.absent(),
                Value<String?> businessWebsite = const Value.absent(),
                Value<String> businessTagline = const Value.absent(),
                Value<String> businessFooter = const Value.absent(),
                Value<String?> logoSnapshotPath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => QuotationsCompanion(
                id: id,
                number: number,
                status: status,
                clientId: clientId,
                clientName: clientName,
                clientCompany: clientCompany,
                clientEmail: clientEmail,
                clientPhone: clientPhone,
                clientAddress: clientAddress,
                clientTaxId: clientTaxId,
                issueDate: issueDate,
                validUntil: validUntil,
                currencyCode: currencyCode,
                notes: notes,
                terms: terms,
                discountMode: discountMode,
                discountBps: discountBps,
                discountFixedMinor: discountFixedMinor,
                taxRateBps: taxRateBps,
                feeLabel: feeLabel,
                feeMinor: feeMinor,
                subtotalMinor: subtotalMinor,
                discountMinor: discountMinor,
                taxMinor: taxMinor,
                totalMinor: totalMinor,
                businessName: businessName,
                businessOwner: businessOwner,
                businessTaxId: businessTaxId,
                businessEmail: businessEmail,
                businessPhone: businessPhone,
                businessAddress: businessAddress,
                businessWebsite: businessWebsite,
                businessTagline: businessTagline,
                businessFooter: businessFooter,
                logoSnapshotPath: logoSnapshotPath,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String number,
                required String status,
                Value<int?> clientId = const Value.absent(),
                required String clientName,
                Value<String?> clientCompany = const Value.absent(),
                Value<String?> clientEmail = const Value.absent(),
                Value<String?> clientPhone = const Value.absent(),
                Value<String?> clientAddress = const Value.absent(),
                Value<String?> clientTaxId = const Value.absent(),
                required DateTime issueDate,
                required DateTime validUntil,
                required String currencyCode,
                Value<String> notes = const Value.absent(),
                Value<String> terms = const Value.absent(),
                Value<String> discountMode = const Value.absent(),
                Value<int> discountBps = const Value.absent(),
                Value<int> discountFixedMinor = const Value.absent(),
                Value<int> taxRateBps = const Value.absent(),
                Value<String> feeLabel = const Value.absent(),
                Value<int> feeMinor = const Value.absent(),
                required int subtotalMinor,
                required int discountMinor,
                required int taxMinor,
                required int totalMinor,
                Value<String> businessName = const Value.absent(),
                Value<String> businessOwner = const Value.absent(),
                Value<String?> businessTaxId = const Value.absent(),
                Value<String?> businessEmail = const Value.absent(),
                Value<String?> businessPhone = const Value.absent(),
                Value<String?> businessAddress = const Value.absent(),
                Value<String?> businessWebsite = const Value.absent(),
                Value<String> businessTagline = const Value.absent(),
                Value<String> businessFooter = const Value.absent(),
                Value<String?> logoSnapshotPath = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => QuotationsCompanion.insert(
                id: id,
                number: number,
                status: status,
                clientId: clientId,
                clientName: clientName,
                clientCompany: clientCompany,
                clientEmail: clientEmail,
                clientPhone: clientPhone,
                clientAddress: clientAddress,
                clientTaxId: clientTaxId,
                issueDate: issueDate,
                validUntil: validUntil,
                currencyCode: currencyCode,
                notes: notes,
                terms: terms,
                discountMode: discountMode,
                discountBps: discountBps,
                discountFixedMinor: discountFixedMinor,
                taxRateBps: taxRateBps,
                feeLabel: feeLabel,
                feeMinor: feeMinor,
                subtotalMinor: subtotalMinor,
                discountMinor: discountMinor,
                taxMinor: taxMinor,
                totalMinor: totalMinor,
                businessName: businessName,
                businessOwner: businessOwner,
                businessTaxId: businessTaxId,
                businessEmail: businessEmail,
                businessPhone: businessPhone,
                businessAddress: businessAddress,
                businessWebsite: businessWebsite,
                businessTagline: businessTagline,
                businessFooter: businessFooter,
                logoSnapshotPath: logoSnapshotPath,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$QuotationsTable, Quotation>(table),
                  $$QuotationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({clientId = false, quotationLinesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (quotationLinesRefs) db.quotationLines,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (clientId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.clientId,
                                    referencedTable: $$QuotationsTableReferences
                                        ._clientIdTable(db),
                                    referencedColumn:
                                        $$QuotationsTableReferences
                                            ._clientIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (quotationLinesRefs)
                        await $_getPrefetchedData<
                          Quotation,
                          $QuotationsTable,
                          QuotationLine
                        >(
                          currentTable: table,
                          referencedTable: $$QuotationsTableReferences
                              ._quotationLinesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$QuotationsTableReferences(
                                db,
                                table,
                                p0,
                              ).quotationLinesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.quotationId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$QuotationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuotationsTable,
      Quotation,
      $$QuotationsTableFilterComposer,
      $$QuotationsTableOrderingComposer,
      $$QuotationsTableAnnotationComposer,
      $$QuotationsTableCreateCompanionBuilder,
      $$QuotationsTableUpdateCompanionBuilder,
      (Quotation, $$QuotationsTableReferences),
      Quotation,
      PrefetchHooks Function({bool clientId, bool quotationLinesRefs})
    >;
typedef $$QuotationLinesTableCreateCompanionBuilder =
    QuotationLinesCompanion Function({
      Value<int> id,
      required int quotationId,
      required int position,
      Value<int?> catalogItemId,
      required String name,
      Value<String?> description,
      required String unit,
      required String kind,
      required int quantityMilli,
      required int unitPriceMinor,
      required int lineTotalMinor,
    });
typedef $$QuotationLinesTableUpdateCompanionBuilder =
    QuotationLinesCompanion Function({
      Value<int> id,
      Value<int> quotationId,
      Value<int> position,
      Value<int?> catalogItemId,
      Value<String> name,
      Value<String?> description,
      Value<String> unit,
      Value<String> kind,
      Value<int> quantityMilli,
      Value<int> unitPriceMinor,
      Value<int> lineTotalMinor,
    });

final class $$QuotationLinesTableReferences
    extends BaseReferences<_$AppDatabase, $QuotationLinesTable, QuotationLine> {
  $$QuotationLinesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $QuotationsTable _quotationIdTable(_$AppDatabase db) => db.quotations
      .createAlias('quotation_lines__quotation_id__quotations__id');

  $$QuotationsTableProcessedTableManager get quotationId {
    final $_column = $_itemColumn<int>('quotation_id')!;

    final manager = $$QuotationsTableTableManager(
      $_db,
      $_db.quotations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_quotationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CatalogItemsTable _catalogItemIdTable(_$AppDatabase db) => db
      .catalogItems
      .createAlias('quotation_lines__catalog_item_id__catalog_items__id');

  $$CatalogItemsTableProcessedTableManager? get catalogItemId {
    final $_column = $_itemColumn<int>('catalog_item_id');
    if ($_column == null) return null;
    final manager = $$CatalogItemsTableTableManager(
      $_db,
      $_db.catalogItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_catalogItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$QuotationLinesTableFilterComposer
    extends Composer<_$AppDatabase, $QuotationLinesTable> {
  $$QuotationLinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantityMilli => $composableBuilder(
    column: $table.quantityMilli,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => ColumnFilters(column),
  );

  $$QuotationsTableFilterComposer get quotationId {
    final $$QuotationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.quotationId,
      referencedTable: $db.quotations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuotationsTableFilterComposer(
            $db: $db,
            $table: $db.quotations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CatalogItemsTableFilterComposer get catalogItemId {
    final $$CatalogItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catalogItemId,
      referencedTable: $db.catalogItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatalogItemsTableFilterComposer(
            $db: $db,
            $table: $db.catalogItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuotationLinesTableOrderingComposer
    extends Composer<_$AppDatabase, $QuotationLinesTable> {
  $$QuotationLinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantityMilli => $composableBuilder(
    column: $table.quantityMilli,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => ColumnOrderings(column),
  );

  $$QuotationsTableOrderingComposer get quotationId {
    final $$QuotationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.quotationId,
      referencedTable: $db.quotations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuotationsTableOrderingComposer(
            $db: $db,
            $table: $db.quotations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CatalogItemsTableOrderingComposer get catalogItemId {
    final $$CatalogItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catalogItemId,
      referencedTable: $db.catalogItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatalogItemsTableOrderingComposer(
            $db: $db,
            $table: $db.catalogItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuotationLinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuotationLinesTable> {
  $$QuotationLinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<int> get quantityMilli => $composableBuilder(
    column: $table.quantityMilli,
    builder: (column) => column,
  );

  GeneratedColumn<int> get unitPriceMinor => $composableBuilder(
    column: $table.unitPriceMinor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lineTotalMinor => $composableBuilder(
    column: $table.lineTotalMinor,
    builder: (column) => column,
  );

  $$QuotationsTableAnnotationComposer get quotationId {
    final $$QuotationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.quotationId,
      referencedTable: $db.quotations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuotationsTableAnnotationComposer(
            $db: $db,
            $table: $db.quotations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CatalogItemsTableAnnotationComposer get catalogItemId {
    final $$CatalogItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.catalogItemId,
      referencedTable: $db.catalogItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CatalogItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.catalogItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuotationLinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuotationLinesTable,
          QuotationLine,
          $$QuotationLinesTableFilterComposer,
          $$QuotationLinesTableOrderingComposer,
          $$QuotationLinesTableAnnotationComposer,
          $$QuotationLinesTableCreateCompanionBuilder,
          $$QuotationLinesTableUpdateCompanionBuilder,
          (QuotationLine, $$QuotationLinesTableReferences),
          QuotationLine,
          PrefetchHooks Function({bool quotationId, bool catalogItemId})
        > {
  $$QuotationLinesTableTableManager(
    _$AppDatabase db,
    $QuotationLinesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuotationLinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuotationLinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuotationLinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> quotationId = const Value.absent(),
                Value<int> position = const Value.absent(),
                Value<int?> catalogItemId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<int> quantityMilli = const Value.absent(),
                Value<int> unitPriceMinor = const Value.absent(),
                Value<int> lineTotalMinor = const Value.absent(),
              }) => QuotationLinesCompanion(
                id: id,
                quotationId: quotationId,
                position: position,
                catalogItemId: catalogItemId,
                name: name,
                description: description,
                unit: unit,
                kind: kind,
                quantityMilli: quantityMilli,
                unitPriceMinor: unitPriceMinor,
                lineTotalMinor: lineTotalMinor,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int quotationId,
                required int position,
                Value<int?> catalogItemId = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                required String unit,
                required String kind,
                required int quantityMilli,
                required int unitPriceMinor,
                required int lineTotalMinor,
              }) => QuotationLinesCompanion.insert(
                id: id,
                quotationId: quotationId,
                position: position,
                catalogItemId: catalogItemId,
                name: name,
                description: description,
                unit: unit,
                kind: kind,
                quantityMilli: quantityMilli,
                unitPriceMinor: unitPriceMinor,
                lineTotalMinor: lineTotalMinor,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$QuotationLinesTable, QuotationLine>(table),
                  $$QuotationLinesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({quotationId = false, catalogItemId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (quotationId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.quotationId,
                                    referencedTable:
                                        $$QuotationLinesTableReferences
                                            ._quotationIdTable(db),
                                    referencedColumn:
                                        $$QuotationLinesTableReferences
                                            ._quotationIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (catalogItemId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.catalogItemId,
                                    referencedTable:
                                        $$QuotationLinesTableReferences
                                            ._catalogItemIdTable(db),
                                    referencedColumn:
                                        $$QuotationLinesTableReferences
                                            ._catalogItemIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$QuotationLinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuotationLinesTable,
      QuotationLine,
      $$QuotationLinesTableFilterComposer,
      $$QuotationLinesTableOrderingComposer,
      $$QuotationLinesTableAnnotationComposer,
      $$QuotationLinesTableCreateCompanionBuilder,
      $$QuotationLinesTableUpdateCompanionBuilder,
      (QuotationLine, $$QuotationLinesTableReferences),
      QuotationLine,
      PrefetchHooks Function({bool quotationId, bool catalogItemId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BusinessProfilesTableTableManager get businessProfiles =>
      $$BusinessProfilesTableTableManager(_db, _db.businessProfiles);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$ClientsTableTableManager get clients =>
      $$ClientsTableTableManager(_db, _db.clients);
  $$CatalogItemsTableTableManager get catalogItems =>
      $$CatalogItemsTableTableManager(_db, _db.catalogItems);
  $$QuotationsTableTableManager get quotations =>
      $$QuotationsTableTableManager(_db, _db.quotations);
  $$QuotationLinesTableTableManager get quotationLines =>
      $$QuotationLinesTableTableManager(_db, _db.quotationLines);
}
