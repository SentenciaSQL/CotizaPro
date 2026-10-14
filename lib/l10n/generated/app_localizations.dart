import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appName.
  ///
  /// In es, this message translates to:
  /// **'CotizaPro'**
  String get appName;

  /// No description provided for @save.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In es, this message translates to:
  /// **'Eliminar'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In es, this message translates to:
  /// **'Editar'**
  String get edit;

  /// No description provided for @duplicate.
  ///
  /// In es, this message translates to:
  /// **'Duplicar'**
  String get duplicate;

  /// No description provided for @close.
  ///
  /// In es, this message translates to:
  /// **'Cerrar'**
  String get close;

  /// No description provided for @continueAction.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get continueAction;

  /// No description provided for @retry.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get retry;

  /// No description provided for @done.
  ///
  /// In es, this message translates to:
  /// **'Listo'**
  String get done;

  /// No description provided for @loading.
  ///
  /// In es, this message translates to:
  /// **'Cargando'**
  String get loading;

  /// No description provided for @required.
  ///
  /// In es, this message translates to:
  /// **'Obligatorio'**
  String get required;

  /// No description provided for @errorGeneric.
  ///
  /// In es, this message translates to:
  /// **'No se pudo completar la acción. Inténtalo de nuevo.'**
  String get errorGeneric;

  /// No description provided for @saved.
  ///
  /// In es, this message translates to:
  /// **'Cambios guardados'**
  String get saved;

  /// No description provided for @deleted.
  ///
  /// In es, this message translates to:
  /// **'Eliminado'**
  String get deleted;

  /// No description provided for @upgrade.
  ///
  /// In es, this message translates to:
  /// **'Ver Pro'**
  String get upgrade;

  /// No description provided for @notNow.
  ///
  /// In es, this message translates to:
  /// **'Ahora no'**
  String get notNow;

  /// No description provided for @proRequiredTitle.
  ///
  /// In es, this message translates to:
  /// **'Función Pro'**
  String get proRequiredTitle;

  /// No description provided for @proRequiredBody.
  ///
  /// In es, this message translates to:
  /// **'Esta opción forma parte de CotizaPro Pro.'**
  String get proRequiredBody;

  /// No description provided for @navHome.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get navHome;

  /// No description provided for @navQuotes.
  ///
  /// In es, this message translates to:
  /// **'Cotizaciones'**
  String get navQuotes;

  /// No description provided for @navClients.
  ///
  /// In es, this message translates to:
  /// **'Clientes'**
  String get navClients;

  /// No description provided for @navCatalog.
  ///
  /// In es, this message translates to:
  /// **'Catálogo'**
  String get navCatalog;

  /// No description provided for @greetingMorning.
  ///
  /// In es, this message translates to:
  /// **'Buenos días'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In es, this message translates to:
  /// **'Buenas tardes'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In es, this message translates to:
  /// **'Buenas noches'**
  String get greetingEvening;

  /// No description provided for @yourBusiness.
  ///
  /// In es, this message translates to:
  /// **'Tu negocio'**
  String get yourBusiness;

  /// No description provided for @completeProfileTitle.
  ///
  /// In es, this message translates to:
  /// **'Completa tu perfil comercial'**
  String get completeProfileTitle;

  /// No description provided for @completeProfileBody.
  ///
  /// In es, this message translates to:
  /// **'El nombre, el contacto y la moneda aparecen en cada cotización.'**
  String get completeProfileBody;

  /// No description provided for @completeProfileAction.
  ///
  /// In es, this message translates to:
  /// **'Completar perfil'**
  String get completeProfileAction;

  /// No description provided for @newQuote.
  ///
  /// In es, this message translates to:
  /// **'Nueva cotización'**
  String get newQuote;

  /// No description provided for @newQuoteHint.
  ///
  /// In es, this message translates to:
  /// **'Cliente, conceptos y PDF en un solo flujo.'**
  String get newQuoteHint;

  /// No description provided for @summary.
  ///
  /// In es, this message translates to:
  /// **'Resumen'**
  String get summary;

  /// No description provided for @statQuotes.
  ///
  /// In es, this message translates to:
  /// **'Cotizaciones'**
  String get statQuotes;

  /// No description provided for @statOpen.
  ///
  /// In es, this message translates to:
  /// **'Abiertas'**
  String get statOpen;

  /// No description provided for @statAccepted.
  ///
  /// In es, this message translates to:
  /// **'Aceptadas'**
  String get statAccepted;

  /// No description provided for @recentQuotes.
  ///
  /// In es, this message translates to:
  /// **'Recientes'**
  String get recentQuotes;

  /// No description provided for @seeAll.
  ///
  /// In es, this message translates to:
  /// **'Ver todas'**
  String get seeAll;

  /// No description provided for @emptyQuotesTitle.
  ///
  /// In es, this message translates to:
  /// **'Todavía no hay cotizaciones'**
  String get emptyQuotesTitle;

  /// No description provided for @emptyQuotesBody.
  ///
  /// In es, this message translates to:
  /// **'Crea la primera con un cliente, los conceptos y el total calculado.'**
  String get emptyQuotesBody;

  /// No description provided for @createFirstQuote.
  ///
  /// In es, this message translates to:
  /// **'Crear la primera cotización'**
  String get createFirstQuote;

  /// No description provided for @shortcutClients.
  ///
  /// In es, this message translates to:
  /// **'Clientes'**
  String get shortcutClients;

  /// No description provided for @shortcutCatalog.
  ///
  /// In es, this message translates to:
  /// **'Catálogo'**
  String get shortcutCatalog;

  /// No description provided for @shortcutHistory.
  ///
  /// In es, this message translates to:
  /// **'Historial'**
  String get shortcutHistory;

  /// No description provided for @shortcutProfile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get shortcutProfile;

  /// No description provided for @shortcutClientsHint.
  ///
  /// In es, this message translates to:
  /// **'Contactos guardados'**
  String get shortcutClientsHint;

  /// No description provided for @shortcutCatalogHint.
  ///
  /// In es, this message translates to:
  /// **'Servicios y precios'**
  String get shortcutCatalogHint;

  /// No description provided for @shortcutHistoryHint.
  ///
  /// In es, this message translates to:
  /// **'Estados y PDF'**
  String get shortcutHistoryHint;

  /// No description provided for @shortcutProfileHint.
  ///
  /// In es, this message translates to:
  /// **'Datos del negocio'**
  String get shortcutProfileHint;

  /// No description provided for @quotesTitle.
  ///
  /// In es, this message translates to:
  /// **'Cotizaciones'**
  String get quotesTitle;

  /// No description provided for @searchQuotes.
  ///
  /// In es, this message translates to:
  /// **'Buscar por número o cliente'**
  String get searchQuotes;

  /// No description provided for @filterAll.
  ///
  /// In es, this message translates to:
  /// **'Todas'**
  String get filterAll;

  /// No description provided for @filterDraft.
  ///
  /// In es, this message translates to:
  /// **'Borradores'**
  String get filterDraft;

  /// No description provided for @filterSent.
  ///
  /// In es, this message translates to:
  /// **'Enviadas'**
  String get filterSent;

  /// No description provided for @filterAccepted.
  ///
  /// In es, this message translates to:
  /// **'Aceptadas'**
  String get filterAccepted;

  /// No description provided for @filterRejected.
  ///
  /// In es, this message translates to:
  /// **'Rechazadas'**
  String get filterRejected;

  /// No description provided for @filterExpired.
  ///
  /// In es, this message translates to:
  /// **'Vencidas'**
  String get filterExpired;

  /// No description provided for @statusDraft.
  ///
  /// In es, this message translates to:
  /// **'Borrador'**
  String get statusDraft;

  /// No description provided for @statusSent.
  ///
  /// In es, this message translates to:
  /// **'Enviada'**
  String get statusSent;

  /// No description provided for @statusAccepted.
  ///
  /// In es, this message translates to:
  /// **'Aceptada'**
  String get statusAccepted;

  /// No description provided for @statusRejected.
  ///
  /// In es, this message translates to:
  /// **'Rechazada'**
  String get statusRejected;

  /// No description provided for @statusExpired.
  ///
  /// In es, this message translates to:
  /// **'Vencida'**
  String get statusExpired;

  /// No description provided for @emptyHistoryTitle.
  ///
  /// In es, this message translates to:
  /// **'El historial está vacío'**
  String get emptyHistoryTitle;

  /// No description provided for @emptyHistoryBody.
  ///
  /// In es, this message translates to:
  /// **'Las cotizaciones que guardes aparecerán aquí.'**
  String get emptyHistoryBody;

  /// No description provided for @noFilterResults.
  ///
  /// In es, this message translates to:
  /// **'Ninguna cotización coincide con la búsqueda.'**
  String get noFilterResults;

  /// No description provided for @deleteQuoteTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar cotización?'**
  String get deleteQuoteTitle;

  /// No description provided for @deleteQuoteBody.
  ///
  /// In es, this message translates to:
  /// **'Se borrará el documento y sus conceptos. Esta acción no se puede deshacer.'**
  String get deleteQuoteBody;

  /// No description provided for @quoteLimitTitle.
  ///
  /// In es, this message translates to:
  /// **'Límite del plan gratuito'**
  String get quoteLimitTitle;

  /// No description provided for @quoteLimitBody.
  ///
  /// In es, this message translates to:
  /// **'Puedes guardar hasta 5 cotizaciones. Las que ya existen se pueden consultar y exportar. Pro elimina el límite.'**
  String get quoteLimitBody;

  /// No description provided for @dateFrom.
  ///
  /// In es, this message translates to:
  /// **'Desde'**
  String get dateFrom;

  /// No description provided for @dateTo.
  ///
  /// In es, this message translates to:
  /// **'Hasta'**
  String get dateTo;

  /// No description provided for @clearDates.
  ///
  /// In es, this message translates to:
  /// **'Quitar fechas'**
  String get clearDates;

  /// No description provided for @exportCsv.
  ///
  /// In es, this message translates to:
  /// **'Exportar CSV'**
  String get exportCsv;

  /// No description provided for @exportCsvProBody.
  ///
  /// In es, this message translates to:
  /// **'La exportación del historial está incluida en Pro.'**
  String get exportCsvProBody;

  /// No description provided for @stepClient.
  ///
  /// In es, this message translates to:
  /// **'Cliente y fechas'**
  String get stepClient;

  /// No description provided for @stepItems.
  ///
  /// In es, this message translates to:
  /// **'Conceptos'**
  String get stepItems;

  /// No description provided for @stepAmounts.
  ///
  /// In es, this message translates to:
  /// **'Importes'**
  String get stepAmounts;

  /// No description provided for @stepReview.
  ///
  /// In es, this message translates to:
  /// **'Revisión'**
  String get stepReview;

  /// No description provided for @quoteNumber.
  ///
  /// In es, this message translates to:
  /// **'Número'**
  String get quoteNumber;

  /// No description provided for @issueDate.
  ///
  /// In es, this message translates to:
  /// **'Fecha'**
  String get issueDate;

  /// No description provided for @validUntil.
  ///
  /// In es, this message translates to:
  /// **'Vencimiento'**
  String get validUntil;

  /// No description provided for @selectClient.
  ///
  /// In es, this message translates to:
  /// **'Elegir cliente'**
  String get selectClient;

  /// No description provided for @changeClient.
  ///
  /// In es, this message translates to:
  /// **'Cambiar cliente'**
  String get changeClient;

  /// No description provided for @noClientYet.
  ///
  /// In es, this message translates to:
  /// **'Aún no hay clientes'**
  String get noClientYet;

  /// No description provided for @quickClient.
  ///
  /// In es, this message translates to:
  /// **'Nuevo cliente'**
  String get quickClient;

  /// No description provided for @clientName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get clientName;

  /// No description provided for @company.
  ///
  /// In es, this message translates to:
  /// **'Empresa'**
  String get company;

  /// No description provided for @email.
  ///
  /// In es, this message translates to:
  /// **'Correo'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In es, this message translates to:
  /// **'Teléfono'**
  String get phone;

  /// No description provided for @address.
  ///
  /// In es, this message translates to:
  /// **'Dirección'**
  String get address;

  /// No description provided for @taxId.
  ///
  /// In es, this message translates to:
  /// **'Identificación fiscal'**
  String get taxId;

  /// No description provided for @notes.
  ///
  /// In es, this message translates to:
  /// **'Notas'**
  String get notes;

  /// No description provided for @terms.
  ///
  /// In es, this message translates to:
  /// **'Condiciones'**
  String get terms;

  /// No description provided for @invalidEmail.
  ///
  /// In es, this message translates to:
  /// **'El correo no es válido.'**
  String get invalidEmail;

  /// No description provided for @validityError.
  ///
  /// In es, this message translates to:
  /// **'El vencimiento no puede ser anterior a la fecha de emisión.'**
  String get validityError;

  /// No description provided for @duplicateNumber.
  ///
  /// In es, this message translates to:
  /// **'Ya existe una cotización con ese número.'**
  String get duplicateNumber;

  /// No description provided for @needClient.
  ///
  /// In es, this message translates to:
  /// **'Elige o crea un cliente para continuar.'**
  String get needClient;

  /// No description provided for @needLineToSend.
  ///
  /// In es, this message translates to:
  /// **'Añade al menos un concepto para marcarla como enviada.'**
  String get needLineToSend;

  /// No description provided for @unsavedTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Salir sin guardar?'**
  String get unsavedTitle;

  /// No description provided for @unsavedBody.
  ///
  /// In es, this message translates to:
  /// **'Los cambios de esta cotización se perderán.'**
  String get unsavedBody;

  /// No description provided for @discard.
  ///
  /// In es, this message translates to:
  /// **'Salir'**
  String get discard;

  /// No description provided for @keepEditing.
  ///
  /// In es, this message translates to:
  /// **'Seguir editando'**
  String get keepEditing;

  /// No description provided for @concepts.
  ///
  /// In es, this message translates to:
  /// **'Conceptos'**
  String get concepts;

  /// No description provided for @addFromCatalog.
  ///
  /// In es, this message translates to:
  /// **'Desde el catálogo'**
  String get addFromCatalog;

  /// No description provided for @addManual.
  ///
  /// In es, this message translates to:
  /// **'Añadir manual'**
  String get addManual;

  /// No description provided for @emptyLinesTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin conceptos'**
  String get emptyLinesTitle;

  /// No description provided for @emptyLinesBody.
  ///
  /// In es, this message translates to:
  /// **'Añade mano de obra, materiales o un servicio del catálogo.'**
  String get emptyLinesBody;

  /// No description provided for @quantity.
  ///
  /// In es, this message translates to:
  /// **'Cantidad'**
  String get quantity;

  /// No description provided for @unitPrice.
  ///
  /// In es, this message translates to:
  /// **'Precio unitario'**
  String get unitPrice;

  /// No description provided for @lineTotal.
  ///
  /// In es, this message translates to:
  /// **'Importe'**
  String get lineTotal;

  /// No description provided for @kindLabor.
  ///
  /// In es, this message translates to:
  /// **'Mano de obra'**
  String get kindLabor;

  /// No description provided for @kindMaterial.
  ///
  /// In es, this message translates to:
  /// **'Material'**
  String get kindMaterial;

  /// No description provided for @kindService.
  ///
  /// In es, this message translates to:
  /// **'Servicio'**
  String get kindService;

  /// No description provided for @kindProduct.
  ///
  /// In es, this message translates to:
  /// **'Producto'**
  String get kindProduct;

  /// No description provided for @unitUnit.
  ///
  /// In es, this message translates to:
  /// **'ud'**
  String get unitUnit;

  /// No description provided for @unitHour.
  ///
  /// In es, this message translates to:
  /// **'h'**
  String get unitHour;

  /// No description provided for @unitDay.
  ///
  /// In es, this message translates to:
  /// **'día'**
  String get unitDay;

  /// No description provided for @unitMeter.
  ///
  /// In es, this message translates to:
  /// **'m'**
  String get unitMeter;

  /// No description provided for @unitSquare.
  ///
  /// In es, this message translates to:
  /// **'m²'**
  String get unitSquare;

  /// No description provided for @unitKg.
  ///
  /// In es, this message translates to:
  /// **'kg'**
  String get unitKg;

  /// No description provided for @lineName.
  ///
  /// In es, this message translates to:
  /// **'Concepto'**
  String get lineName;

  /// No description provided for @lineDescription.
  ///
  /// In es, this message translates to:
  /// **'Descripción'**
  String get lineDescription;

  /// No description provided for @editConcept.
  ///
  /// In es, this message translates to:
  /// **'Editar concepto'**
  String get editConcept;

  /// No description provided for @removeConcept.
  ///
  /// In es, this message translates to:
  /// **'Quitar'**
  String get removeConcept;

  /// No description provided for @discount.
  ///
  /// In es, this message translates to:
  /// **'Descuento'**
  String get discount;

  /// No description provided for @discountNone.
  ///
  /// In es, this message translates to:
  /// **'Sin descuento'**
  String get discountNone;

  /// No description provided for @discountPercent.
  ///
  /// In es, this message translates to:
  /// **'Porcentaje'**
  String get discountPercent;

  /// No description provided for @discountFixed.
  ///
  /// In es, this message translates to:
  /// **'Importe fijo'**
  String get discountFixed;

  /// No description provided for @tax.
  ///
  /// In es, this message translates to:
  /// **'Impuesto'**
  String get tax;

  /// No description provided for @taxPercent.
  ///
  /// In es, this message translates to:
  /// **'Porcentaje de impuesto'**
  String get taxPercent;

  /// No description provided for @taxHint.
  ///
  /// In es, this message translates to:
  /// **'Se calcula sobre el subtotal menos el descuento. Los gastos adicionales no se gravan.'**
  String get taxHint;

  /// No description provided for @fee.
  ///
  /// In es, this message translates to:
  /// **'Gasto adicional'**
  String get fee;

  /// No description provided for @feeLabel.
  ///
  /// In es, this message translates to:
  /// **'Concepto del gasto'**
  String get feeLabel;

  /// No description provided for @feeAmount.
  ///
  /// In es, this message translates to:
  /// **'Importe del gasto'**
  String get feeAmount;

  /// No description provided for @subtotal.
  ///
  /// In es, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @total.
  ///
  /// In es, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @saveDraft.
  ///
  /// In es, this message translates to:
  /// **'Guardar borrador'**
  String get saveDraft;

  /// No description provided for @markSent.
  ///
  /// In es, this message translates to:
  /// **'Marcar como enviada'**
  String get markSent;

  /// No description provided for @previewPdf.
  ///
  /// In es, this message translates to:
  /// **'Vista previa PDF'**
  String get previewPdf;

  /// No description provided for @sharePdf.
  ///
  /// In es, this message translates to:
  /// **'Compartir PDF'**
  String get sharePdf;

  /// No description provided for @quoteSaved.
  ///
  /// In es, this message translates to:
  /// **'Cotización guardada'**
  String get quoteSaved;

  /// No description provided for @discountTooHigh.
  ///
  /// In es, this message translates to:
  /// **'El descuento no puede superar el subtotal.'**
  String get discountTooHigh;

  /// No description provided for @invalidAmount.
  ///
  /// In es, this message translates to:
  /// **'Introduce un importe válido.'**
  String get invalidAmount;

  /// No description provided for @invalidQuantity.
  ///
  /// In es, this message translates to:
  /// **'Introduce una cantidad mayor que cero.'**
  String get invalidQuantity;

  /// No description provided for @noMatches.
  ///
  /// In es, this message translates to:
  /// **'Sin resultados'**
  String get noMatches;

  /// No description provided for @addedConcept.
  ///
  /// In es, this message translates to:
  /// **'Concepto añadido'**
  String get addedConcept;

  /// No description provided for @fieldRequired.
  ///
  /// In es, this message translates to:
  /// **'Completa este campo.'**
  String get fieldRequired;

  /// No description provided for @logoTooLarge.
  ///
  /// In es, this message translates to:
  /// **'El logotipo debe pesar menos de 2 MB.'**
  String get logoTooLarge;

  /// No description provided for @clientsTitle.
  ///
  /// In es, this message translates to:
  /// **'Clientes'**
  String get clientsTitle;

  /// No description provided for @searchClients.
  ///
  /// In es, this message translates to:
  /// **'Buscar clientes'**
  String get searchClients;

  /// No description provided for @emptyClientsTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin clientes'**
  String get emptyClientsTitle;

  /// No description provided for @emptyClientsBody.
  ///
  /// In es, this message translates to:
  /// **'Guarda los contactos que usas al cotizar.'**
  String get emptyClientsBody;

  /// No description provided for @newClient.
  ///
  /// In es, this message translates to:
  /// **'Nuevo cliente'**
  String get newClient;

  /// No description provided for @editClient.
  ///
  /// In es, this message translates to:
  /// **'Editar cliente'**
  String get editClient;

  /// No description provided for @deleteClientTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar cliente?'**
  String get deleteClientTitle;

  /// No description provided for @deleteClientBody.
  ///
  /// In es, this message translates to:
  /// **'Las cotizaciones ya creadas conservan los datos que tenían en ese momento.'**
  String get deleteClientBody;

  /// No description provided for @clientSaved.
  ///
  /// In es, this message translates to:
  /// **'Cliente guardado'**
  String get clientSaved;

  /// No description provided for @clientQuotes.
  ///
  /// In es, this message translates to:
  /// **'Cotizaciones'**
  String get clientQuotes;

  /// No description provided for @noClientQuotes.
  ///
  /// In es, this message translates to:
  /// **'Este cliente todavía no tiene cotizaciones.'**
  String get noClientQuotes;

  /// No description provided for @clientLimitTitle.
  ///
  /// In es, this message translates to:
  /// **'Límite de clientes'**
  String get clientLimitTitle;

  /// No description provided for @clientLimitBody.
  ///
  /// In es, this message translates to:
  /// **'El plan gratuito permite 20 clientes. Pro los deja ilimitados.'**
  String get clientLimitBody;

  /// No description provided for @catalogTitle.
  ///
  /// In es, this message translates to:
  /// **'Catálogo'**
  String get catalogTitle;

  /// No description provided for @searchCatalog.
  ///
  /// In es, this message translates to:
  /// **'Buscar en el catálogo'**
  String get searchCatalog;

  /// No description provided for @emptyCatalogTitle.
  ///
  /// In es, this message translates to:
  /// **'Catálogo vacío'**
  String get emptyCatalogTitle;

  /// No description provided for @emptyCatalogBody.
  ///
  /// In es, this message translates to:
  /// **'Crea servicios y materiales para reutilizarlos en las cotizaciones.'**
  String get emptyCatalogBody;

  /// No description provided for @newItem.
  ///
  /// In es, this message translates to:
  /// **'Nuevo concepto'**
  String get newItem;

  /// No description provided for @editItem.
  ///
  /// In es, this message translates to:
  /// **'Editar concepto'**
  String get editItem;

  /// No description provided for @itemName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get itemName;

  /// No description provided for @itemDescription.
  ///
  /// In es, this message translates to:
  /// **'Descripción'**
  String get itemDescription;

  /// No description provided for @category.
  ///
  /// In es, this message translates to:
  /// **'Categoría'**
  String get category;

  /// No description provided for @catGeneral.
  ///
  /// In es, this message translates to:
  /// **'General'**
  String get catGeneral;

  /// No description provided for @catLabor.
  ///
  /// In es, this message translates to:
  /// **'Mano de obra'**
  String get catLabor;

  /// No description provided for @catMaterials.
  ///
  /// In es, this message translates to:
  /// **'Materiales'**
  String get catMaterials;

  /// No description provided for @catInstallation.
  ///
  /// In es, this message translates to:
  /// **'Instalación'**
  String get catInstallation;

  /// No description provided for @catRepair.
  ///
  /// In es, this message translates to:
  /// **'Reparación'**
  String get catRepair;

  /// No description provided for @catMaintenance.
  ///
  /// In es, this message translates to:
  /// **'Mantenimiento'**
  String get catMaintenance;

  /// No description provided for @catTransport.
  ///
  /// In es, this message translates to:
  /// **'Transporte'**
  String get catTransport;

  /// No description provided for @catTools.
  ///
  /// In es, this message translates to:
  /// **'Equipos y herramientas'**
  String get catTools;

  /// No description provided for @catProfessional.
  ///
  /// In es, this message translates to:
  /// **'Servicios profesionales'**
  String get catProfessional;

  /// No description provided for @catOther.
  ///
  /// In es, this message translates to:
  /// **'Otros'**
  String get catOther;

  /// No description provided for @allCategories.
  ///
  /// In es, this message translates to:
  /// **'Todas'**
  String get allCategories;

  /// No description provided for @uncategorized.
  ///
  /// In es, this message translates to:
  /// **'Sin categoría'**
  String get uncategorized;

  /// No description provided for @price.
  ///
  /// In es, this message translates to:
  /// **'Precio'**
  String get price;

  /// No description provided for @deleteItemTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar concepto?'**
  String get deleteItemTitle;

  /// No description provided for @deleteItemBody.
  ///
  /// In es, this message translates to:
  /// **'Las cotizaciones que ya lo usan conservan su propia copia.'**
  String get deleteItemBody;

  /// No description provided for @itemSaved.
  ///
  /// In es, this message translates to:
  /// **'Concepto guardado'**
  String get itemSaved;

  /// No description provided for @catalogLimitTitle.
  ///
  /// In es, this message translates to:
  /// **'Límite del catálogo'**
  String get catalogLimitTitle;

  /// No description provided for @catalogLimitBody.
  ///
  /// In es, this message translates to:
  /// **'El plan gratuito permite 30 conceptos. Pro los deja ilimitados.'**
  String get catalogLimitBody;

  /// No description provided for @kind.
  ///
  /// In es, this message translates to:
  /// **'Tipo'**
  String get kind;

  /// No description provided for @businessProfile.
  ///
  /// In es, this message translates to:
  /// **'Perfil comercial'**
  String get businessProfile;

  /// No description provided for @businessName.
  ///
  /// In es, this message translates to:
  /// **'Nombre comercial'**
  String get businessName;

  /// No description provided for @ownerName.
  ///
  /// In es, this message translates to:
  /// **'Responsable'**
  String get ownerName;

  /// No description provided for @website.
  ///
  /// In es, this message translates to:
  /// **'Sitio web'**
  String get website;

  /// No description provided for @city.
  ///
  /// In es, this message translates to:
  /// **'Ciudad'**
  String get city;

  /// No description provided for @region.
  ///
  /// In es, this message translates to:
  /// **'Región'**
  String get region;

  /// No description provided for @postalCode.
  ///
  /// In es, this message translates to:
  /// **'Código postal'**
  String get postalCode;

  /// No description provided for @country.
  ///
  /// In es, this message translates to:
  /// **'País'**
  String get country;

  /// No description provided for @logo.
  ///
  /// In es, this message translates to:
  /// **'Logotipo'**
  String get logo;

  /// No description provided for @chooseLogo.
  ///
  /// In es, this message translates to:
  /// **'Elegir logotipo'**
  String get chooseLogo;

  /// No description provided for @removeLogo.
  ///
  /// In es, this message translates to:
  /// **'Quitar logotipo'**
  String get removeLogo;

  /// No description provided for @logoHint.
  ///
  /// In es, this message translates to:
  /// **'Se muestra en el PDF con CotizaPro Pro.'**
  String get logoHint;

  /// No description provided for @currency.
  ///
  /// In es, this message translates to:
  /// **'Moneda'**
  String get currency;

  /// No description provided for @customCurrency.
  ///
  /// In es, this message translates to:
  /// **'Otra moneda (código ISO)'**
  String get customCurrency;

  /// No description provided for @invalidCurrency.
  ///
  /// In es, this message translates to:
  /// **'Usa un código de tres letras, por ejemplo USD.'**
  String get invalidCurrency;

  /// No description provided for @quotePrefix.
  ///
  /// In es, this message translates to:
  /// **'Prefijo'**
  String get quotePrefix;

  /// No description provided for @nextNumber.
  ///
  /// In es, this message translates to:
  /// **'Siguiente número'**
  String get nextNumber;

  /// No description provided for @defaultTax.
  ///
  /// In es, this message translates to:
  /// **'Impuesto predeterminado'**
  String get defaultTax;

  /// No description provided for @validityDays.
  ///
  /// In es, this message translates to:
  /// **'Días de validez'**
  String get validityDays;

  /// No description provided for @defaultNotes.
  ///
  /// In es, this message translates to:
  /// **'Notas predeterminadas'**
  String get defaultNotes;

  /// No description provided for @defaultTerms.
  ///
  /// In es, this message translates to:
  /// **'Condiciones predeterminadas'**
  String get defaultTerms;

  /// No description provided for @tagline.
  ///
  /// In es, this message translates to:
  /// **'Lema'**
  String get tagline;

  /// No description provided for @pdfFooter.
  ///
  /// In es, this message translates to:
  /// **'Pie del documento'**
  String get pdfFooter;

  /// No description provided for @profileSaved.
  ///
  /// In es, this message translates to:
  /// **'Perfil guardado'**
  String get profileSaved;

  /// No description provided for @settingsTitle.
  ///
  /// In es, this message translates to:
  /// **'Ajustes'**
  String get settingsTitle;

  /// No description provided for @appearance.
  ///
  /// In es, this message translates to:
  /// **'Apariencia'**
  String get appearance;

  /// No description provided for @themeSystem.
  ///
  /// In es, this message translates to:
  /// **'Automático'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In es, this message translates to:
  /// **'Claro'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In es, this message translates to:
  /// **'Oscuro'**
  String get themeDark;

  /// No description provided for @language.
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get language;

  /// No description provided for @languageSystem.
  ///
  /// In es, this message translates to:
  /// **'Del sistema'**
  String get languageSystem;

  /// No description provided for @languageSpanish.
  ///
  /// In es, this message translates to:
  /// **'Español'**
  String get languageSpanish;

  /// No description provided for @languageEnglish.
  ///
  /// In es, this message translates to:
  /// **'Inglés'**
  String get languageEnglish;

  /// No description provided for @numbering.
  ///
  /// In es, this message translates to:
  /// **'Numeración'**
  String get numbering;

  /// No description provided for @pdfSection.
  ///
  /// In es, this message translates to:
  /// **'Documento PDF'**
  String get pdfSection;

  /// No description provided for @showNotes.
  ///
  /// In es, this message translates to:
  /// **'Incluir notas'**
  String get showNotes;

  /// No description provided for @showTerms.
  ///
  /// In es, this message translates to:
  /// **'Incluir condiciones'**
  String get showTerms;

  /// No description provided for @showLogo.
  ///
  /// In es, this message translates to:
  /// **'Incluir logotipo'**
  String get showLogo;

  /// No description provided for @hideBranding.
  ///
  /// In es, this message translates to:
  /// **'Quitar la marca CotizaPro'**
  String get hideBranding;

  /// No description provided for @signatureLine.
  ///
  /// In es, this message translates to:
  /// **'Línea de aceptación'**
  String get signatureLine;

  /// No description provided for @showTagline.
  ///
  /// In es, this message translates to:
  /// **'Incluir lema'**
  String get showTagline;

  /// No description provided for @backup.
  ///
  /// In es, this message translates to:
  /// **'Copias de seguridad'**
  String get backup;

  /// No description provided for @about.
  ///
  /// In es, this message translates to:
  /// **'Acerca de'**
  String get about;

  /// No description provided for @versionLabel.
  ///
  /// In es, this message translates to:
  /// **'Versión'**
  String get versionLabel;

  /// No description provided for @offlineNote.
  ///
  /// In es, this message translates to:
  /// **'Tus datos permanecen en este dispositivo. CotizaPro funciona sin conexión.'**
  String get offlineNote;

  /// No description provided for @openPro.
  ///
  /// In es, this message translates to:
  /// **'CotizaPro Pro'**
  String get openPro;

  /// No description provided for @backupTitle.
  ///
  /// In es, this message translates to:
  /// **'Copias de seguridad'**
  String get backupTitle;

  /// No description provided for @backupBody.
  ///
  /// In es, this message translates to:
  /// **'Exporta o restaura clientes, catálogo, cotizaciones y el perfil. La compra Pro no se incluye: se restaura desde la tienda.'**
  String get backupBody;

  /// No description provided for @exportBackup.
  ///
  /// In es, this message translates to:
  /// **'Exportar copia'**
  String get exportBackup;

  /// No description provided for @importBackup.
  ///
  /// In es, this message translates to:
  /// **'Importar copia'**
  String get importBackup;

  /// No description provided for @importTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Reemplazar los datos de este dispositivo?'**
  String get importTitle;

  /// No description provided for @importBody.
  ///
  /// In es, this message translates to:
  /// **'La copia sustituirá clientes, catálogo, cotizaciones, perfil y preferencias. No se puede deshacer.'**
  String get importBody;

  /// No description provided for @exportDone.
  ///
  /// In es, this message translates to:
  /// **'Copia lista para compartir'**
  String get exportDone;

  /// No description provided for @importDone.
  ///
  /// In es, this message translates to:
  /// **'Copia importada'**
  String get importDone;

  /// No description provided for @importInvalid.
  ///
  /// In es, this message translates to:
  /// **'El archivo no es una copia válida de CotizaPro.'**
  String get importInvalid;

  /// No description provided for @backupWorking.
  ///
  /// In es, this message translates to:
  /// **'Preparando copia'**
  String get backupWorking;

  /// No description provided for @proTitle.
  ///
  /// In es, this message translates to:
  /// **'CotizaPro Pro'**
  String get proTitle;

  /// No description provided for @proSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Una compra única para trabajar sin límites.'**
  String get proSubtitle;

  /// No description provided for @proPriceNote.
  ///
  /// In es, this message translates to:
  /// **'Precio orientativo: US\$5.99. El precio final lo muestra la tienda.'**
  String get proPriceNote;

  /// No description provided for @featureUnlimited.
  ///
  /// In es, this message translates to:
  /// **'Cotizaciones, clientes y catálogo sin límite'**
  String get featureUnlimited;

  /// No description provided for @featureNoAds.
  ///
  /// In es, this message translates to:
  /// **'Sin anuncios'**
  String get featureNoAds;

  /// No description provided for @featureNoBrand.
  ///
  /// In es, this message translates to:
  /// **'PDF sin la marca CotizaPro'**
  String get featureNoBrand;

  /// No description provided for @featureCustomize.
  ///
  /// In es, this message translates to:
  /// **'Lema, logotipo y línea de aceptación'**
  String get featureCustomize;

  /// No description provided for @featureLogo.
  ///
  /// In es, this message translates to:
  /// **'Logotipo comercial en el documento'**
  String get featureLogo;

  /// No description provided for @featureHistory.
  ///
  /// In es, this message translates to:
  /// **'Filtro por fechas y exportación CSV'**
  String get featureHistory;

  /// No description provided for @buyPro.
  ///
  /// In es, this message translates to:
  /// **'Comprar Pro'**
  String get buyPro;

  /// No description provided for @restorePurchases.
  ///
  /// In es, this message translates to:
  /// **'Restaurar compras'**
  String get restorePurchases;

  /// No description provided for @proActiveTitle.
  ///
  /// In es, this message translates to:
  /// **'Pro está activo'**
  String get proActiveTitle;

  /// No description provided for @proActiveBody.
  ///
  /// In es, this message translates to:
  /// **'Los límites y la marca de los PDF ya están desbloqueados en este dispositivo.'**
  String get proActiveBody;

  /// No description provided for @productUnavailable.
  ///
  /// In es, this message translates to:
  /// **'El producto todavía no está disponible en la tienda.'**
  String get productUnavailable;

  /// No description provided for @purchasePending.
  ///
  /// In es, this message translates to:
  /// **'La compra está pendiente de confirmación.'**
  String get purchasePending;

  /// No description provided for @purchaseCancelled.
  ///
  /// In es, this message translates to:
  /// **'Compra cancelada.'**
  String get purchaseCancelled;

  /// No description provided for @purchaseFailed.
  ///
  /// In es, this message translates to:
  /// **'No se pudo confirmar la compra.'**
  String get purchaseFailed;

  /// No description provided for @storeUnavailable.
  ///
  /// In es, this message translates to:
  /// **'La tienda no está disponible en este momento.'**
  String get storeUnavailable;

  /// No description provided for @restoreEmpty.
  ///
  /// In es, this message translates to:
  /// **'No hay una compra de Pro para restaurar.'**
  String get restoreEmpty;

  /// No description provided for @restoreDone.
  ///
  /// In es, this message translates to:
  /// **'Compra restaurada'**
  String get restoreDone;

  /// No description provided for @priceFromStore.
  ///
  /// In es, this message translates to:
  /// **'Precio de la tienda'**
  String get priceFromStore;

  /// No description provided for @pdfQuote.
  ///
  /// In es, this message translates to:
  /// **'Cotización'**
  String get pdfQuote;

  /// No description provided for @pdfBillTo.
  ///
  /// In es, this message translates to:
  /// **'Cliente'**
  String get pdfBillTo;

  /// No description provided for @pdfFrom.
  ///
  /// In es, this message translates to:
  /// **'Emisor'**
  String get pdfFrom;

  /// No description provided for @pdfNumber.
  ///
  /// In es, this message translates to:
  /// **'Número'**
  String get pdfNumber;

  /// No description provided for @pdfIssueDate.
  ///
  /// In es, this message translates to:
  /// **'Emisión'**
  String get pdfIssueDate;

  /// No description provided for @pdfValidUntil.
  ///
  /// In es, this message translates to:
  /// **'Válida hasta'**
  String get pdfValidUntil;

  /// No description provided for @pdfConcept.
  ///
  /// In es, this message translates to:
  /// **'Concepto'**
  String get pdfConcept;

  /// No description provided for @pdfQty.
  ///
  /// In es, this message translates to:
  /// **'Cant.'**
  String get pdfQty;

  /// No description provided for @pdfUnit.
  ///
  /// In es, this message translates to:
  /// **'Unidad'**
  String get pdfUnit;

  /// No description provided for @pdfPrice.
  ///
  /// In es, this message translates to:
  /// **'Precio'**
  String get pdfPrice;

  /// No description provided for @pdfAmount.
  ///
  /// In es, this message translates to:
  /// **'Importe'**
  String get pdfAmount;

  /// No description provided for @pdfSubtotal.
  ///
  /// In es, this message translates to:
  /// **'Subtotal'**
  String get pdfSubtotal;

  /// No description provided for @pdfDiscount.
  ///
  /// In es, this message translates to:
  /// **'Descuento'**
  String get pdfDiscount;

  /// No description provided for @pdfTax.
  ///
  /// In es, this message translates to:
  /// **'Impuesto'**
  String get pdfTax;

  /// No description provided for @pdfFee.
  ///
  /// In es, this message translates to:
  /// **'Gastos'**
  String get pdfFee;

  /// No description provided for @pdfTotal.
  ///
  /// In es, this message translates to:
  /// **'Total'**
  String get pdfTotal;

  /// No description provided for @pdfNotes.
  ///
  /// In es, this message translates to:
  /// **'Notas'**
  String get pdfNotes;

  /// No description provided for @pdfTerms.
  ///
  /// In es, this message translates to:
  /// **'Condiciones'**
  String get pdfTerms;

  /// No description provided for @pdfMadeWith.
  ///
  /// In es, this message translates to:
  /// **'Creado con CotizaPro'**
  String get pdfMadeWith;

  /// No description provided for @pdfDraft.
  ///
  /// In es, this message translates to:
  /// **'BORRADOR'**
  String get pdfDraft;

  /// No description provided for @pdfAcceptedBy.
  ///
  /// In es, this message translates to:
  /// **'Aceptado por'**
  String get pdfAcceptedBy;

  /// No description provided for @pdfDate.
  ///
  /// In es, this message translates to:
  /// **'Fecha'**
  String get pdfDate;

  /// No description provided for @pdfSignature.
  ///
  /// In es, this message translates to:
  /// **'Firma'**
  String get pdfSignature;

  /// No description provided for @changeStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado'**
  String get changeStatus;

  /// No description provided for @openQuote.
  ///
  /// In es, this message translates to:
  /// **'Abrir'**
  String get openQuote;

  /// No description provided for @numberPreview.
  ///
  /// In es, this message translates to:
  /// **'Se asignará al guardar si lo dejas igual.'**
  String get numberPreview;

  /// No description provided for @manualConcept.
  ///
  /// In es, this message translates to:
  /// **'Concepto manual'**
  String get manualConcept;

  /// No description provided for @apply.
  ///
  /// In es, this message translates to:
  /// **'Aplicar'**
  String get apply;

  /// No description provided for @freeQuotesUsage.
  ///
  /// In es, this message translates to:
  /// **'Plan gratuito'**
  String get freeQuotesUsage;

  /// No description provided for @greetingNamed.
  ///
  /// In es, this message translates to:
  /// **'{greeting}, {name}'**
  String greetingNamed(String greeting, String name);

  /// No description provided for @stepOf.
  ///
  /// In es, this message translates to:
  /// **'{current} de {total}'**
  String stepOf(int current, int total);

  /// No description provided for @statAcceptedAmount.
  ///
  /// In es, this message translates to:
  /// **'Aceptado en {currency}'**
  String statAcceptedAmount(String currency);

  /// No description provided for @pdfPage.
  ///
  /// In es, this message translates to:
  /// **'Página {current} de {total}'**
  String pdfPage(int current, int total);

  /// No description provided for @freeUsage.
  ///
  /// In es, this message translates to:
  /// **'{count} de {limit} en el plan gratuito'**
  String freeUsage(int count, int limit);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
