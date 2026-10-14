// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'CotizaPro';

  @override
  String get save => 'Guardar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get edit => 'Editar';

  @override
  String get duplicate => 'Duplicar';

  @override
  String get close => 'Cerrar';

  @override
  String get continueAction => 'Continuar';

  @override
  String get retry => 'Reintentar';

  @override
  String get done => 'Listo';

  @override
  String get loading => 'Cargando';

  @override
  String get required => 'Obligatorio';

  @override
  String get errorGeneric =>
      'No se pudo completar la acción. Inténtalo de nuevo.';

  @override
  String get saved => 'Cambios guardados';

  @override
  String get deleted => 'Eliminado';

  @override
  String get upgrade => 'Ver Pro';

  @override
  String get notNow => 'Ahora no';

  @override
  String get proRequiredTitle => 'Función Pro';

  @override
  String get proRequiredBody => 'Esta opción forma parte de CotizaPro Pro.';

  @override
  String get navHome => 'Inicio';

  @override
  String get navQuotes => 'Cotizaciones';

  @override
  String get navClients => 'Clientes';

  @override
  String get navCatalog => 'Catálogo';

  @override
  String get greetingMorning => 'Buenos días';

  @override
  String get greetingAfternoon => 'Buenas tardes';

  @override
  String get greetingEvening => 'Buenas noches';

  @override
  String get yourBusiness => 'Tu negocio';

  @override
  String get completeProfileTitle => 'Completa tu perfil comercial';

  @override
  String get completeProfileBody =>
      'El nombre, el contacto y la moneda aparecen en cada cotización.';

  @override
  String get completeProfileAction => 'Completar perfil';

  @override
  String get newQuote => 'Nueva cotización';

  @override
  String get newQuoteHint => 'Cliente, conceptos y PDF en un solo flujo.';

  @override
  String get summary => 'Resumen';

  @override
  String get statQuotes => 'Cotizaciones';

  @override
  String get statOpen => 'Abiertas';

  @override
  String get statAccepted => 'Aceptadas';

  @override
  String get recentQuotes => 'Recientes';

  @override
  String get seeAll => 'Ver todas';

  @override
  String get emptyQuotesTitle => 'Todavía no hay cotizaciones';

  @override
  String get emptyQuotesBody =>
      'Crea la primera con un cliente, los conceptos y el total calculado.';

  @override
  String get createFirstQuote => 'Crear la primera cotización';

  @override
  String get shortcutClients => 'Clientes';

  @override
  String get shortcutCatalog => 'Catálogo';

  @override
  String get shortcutHistory => 'Historial';

  @override
  String get shortcutProfile => 'Perfil';

  @override
  String get shortcutClientsHint => 'Contactos guardados';

  @override
  String get shortcutCatalogHint => 'Servicios y precios';

  @override
  String get shortcutHistoryHint => 'Estados y PDF';

  @override
  String get shortcutProfileHint => 'Datos del negocio';

  @override
  String get quotesTitle => 'Cotizaciones';

  @override
  String get searchQuotes => 'Buscar por número o cliente';

  @override
  String get filterAll => 'Todas';

  @override
  String get filterDraft => 'Borradores';

  @override
  String get filterSent => 'Enviadas';

  @override
  String get filterAccepted => 'Aceptadas';

  @override
  String get filterRejected => 'Rechazadas';

  @override
  String get filterExpired => 'Vencidas';

  @override
  String get statusDraft => 'Borrador';

  @override
  String get statusSent => 'Enviada';

  @override
  String get statusAccepted => 'Aceptada';

  @override
  String get statusRejected => 'Rechazada';

  @override
  String get statusExpired => 'Vencida';

  @override
  String get emptyHistoryTitle => 'El historial está vacío';

  @override
  String get emptyHistoryBody =>
      'Las cotizaciones que guardes aparecerán aquí.';

  @override
  String get noFilterResults => 'Ninguna cotización coincide con la búsqueda.';

  @override
  String get deleteQuoteTitle => '¿Eliminar cotización?';

  @override
  String get deleteQuoteBody =>
      'Se borrará el documento y sus conceptos. Esta acción no se puede deshacer.';

  @override
  String get quoteLimitTitle => 'Límite del plan gratuito';

  @override
  String get quoteLimitBody =>
      'Puedes guardar hasta 5 cotizaciones. Las que ya existen se pueden consultar y exportar. Pro elimina el límite.';

  @override
  String get dateFrom => 'Desde';

  @override
  String get dateTo => 'Hasta';

  @override
  String get clearDates => 'Quitar fechas';

  @override
  String get exportCsv => 'Exportar CSV';

  @override
  String get exportCsvProBody =>
      'La exportación del historial está incluida en Pro.';

  @override
  String get stepClient => 'Cliente y fechas';

  @override
  String get stepItems => 'Conceptos';

  @override
  String get stepAmounts => 'Importes';

  @override
  String get stepReview => 'Revisión';

  @override
  String get quoteNumber => 'Número';

  @override
  String get issueDate => 'Fecha';

  @override
  String get validUntil => 'Vencimiento';

  @override
  String get selectClient => 'Elegir cliente';

  @override
  String get changeClient => 'Cambiar cliente';

  @override
  String get noClientYet => 'Aún no hay clientes';

  @override
  String get quickClient => 'Nuevo cliente';

  @override
  String get clientName => 'Nombre';

  @override
  String get company => 'Empresa';

  @override
  String get email => 'Correo';

  @override
  String get phone => 'Teléfono';

  @override
  String get address => 'Dirección';

  @override
  String get taxId => 'Identificación fiscal';

  @override
  String get notes => 'Notas';

  @override
  String get terms => 'Condiciones';

  @override
  String get invalidEmail => 'El correo no es válido.';

  @override
  String get validityError =>
      'El vencimiento no puede ser anterior a la fecha de emisión.';

  @override
  String get duplicateNumber => 'Ya existe una cotización con ese número.';

  @override
  String get needClient => 'Elige o crea un cliente para continuar.';

  @override
  String get needLineToSend =>
      'Añade al menos un concepto para marcarla como enviada.';

  @override
  String get unsavedTitle => '¿Salir sin guardar?';

  @override
  String get unsavedBody => 'Los cambios de esta cotización se perderán.';

  @override
  String get discard => 'Salir';

  @override
  String get keepEditing => 'Seguir editando';

  @override
  String get concepts => 'Conceptos';

  @override
  String get addFromCatalog => 'Desde el catálogo';

  @override
  String get addManual => 'Añadir manual';

  @override
  String get emptyLinesTitle => 'Sin conceptos';

  @override
  String get emptyLinesBody =>
      'Añade mano de obra, materiales o un servicio del catálogo.';

  @override
  String get quantity => 'Cantidad';

  @override
  String get unitPrice => 'Precio unitario';

  @override
  String get lineTotal => 'Importe';

  @override
  String get kindLabor => 'Mano de obra';

  @override
  String get kindMaterial => 'Material';

  @override
  String get kindService => 'Servicio';

  @override
  String get kindProduct => 'Producto';

  @override
  String get unitUnit => 'ud';

  @override
  String get unitHour => 'h';

  @override
  String get unitDay => 'día';

  @override
  String get unitMeter => 'm';

  @override
  String get unitSquare => 'm²';

  @override
  String get unitKg => 'kg';

  @override
  String get lineName => 'Concepto';

  @override
  String get lineDescription => 'Descripción';

  @override
  String get editConcept => 'Editar concepto';

  @override
  String get removeConcept => 'Quitar';

  @override
  String get discount => 'Descuento';

  @override
  String get discountNone => 'Sin descuento';

  @override
  String get discountPercent => 'Porcentaje';

  @override
  String get discountFixed => 'Importe fijo';

  @override
  String get tax => 'Impuesto';

  @override
  String get taxPercent => 'Porcentaje de impuesto';

  @override
  String get taxHint =>
      'Se calcula sobre el subtotal menos el descuento. Los gastos adicionales no se gravan.';

  @override
  String get fee => 'Gasto adicional';

  @override
  String get feeLabel => 'Concepto del gasto';

  @override
  String get feeAmount => 'Importe del gasto';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get total => 'Total';

  @override
  String get saveDraft => 'Guardar borrador';

  @override
  String get markSent => 'Marcar como enviada';

  @override
  String get previewPdf => 'Vista previa PDF';

  @override
  String get sharePdf => 'Compartir PDF';

  @override
  String get quoteSaved => 'Cotización guardada';

  @override
  String get discountTooHigh => 'El descuento no puede superar el subtotal.';

  @override
  String get invalidAmount => 'Introduce un importe válido.';

  @override
  String get invalidQuantity => 'Introduce una cantidad mayor que cero.';

  @override
  String get noMatches => 'Sin resultados';

  @override
  String get addedConcept => 'Concepto añadido';

  @override
  String get fieldRequired => 'Completa este campo.';

  @override
  String get logoTooLarge => 'El logotipo debe pesar menos de 2 MB.';

  @override
  String get clientsTitle => 'Clientes';

  @override
  String get searchClients => 'Buscar clientes';

  @override
  String get emptyClientsTitle => 'Sin clientes';

  @override
  String get emptyClientsBody => 'Guarda los contactos que usas al cotizar.';

  @override
  String get newClient => 'Nuevo cliente';

  @override
  String get editClient => 'Editar cliente';

  @override
  String get deleteClientTitle => '¿Eliminar cliente?';

  @override
  String get deleteClientBody =>
      'Las cotizaciones ya creadas conservan los datos que tenían en ese momento.';

  @override
  String get clientSaved => 'Cliente guardado';

  @override
  String get clientQuotes => 'Cotizaciones';

  @override
  String get noClientQuotes => 'Este cliente todavía no tiene cotizaciones.';

  @override
  String get clientLimitTitle => 'Límite de clientes';

  @override
  String get clientLimitBody =>
      'El plan gratuito permite 20 clientes. Pro los deja ilimitados.';

  @override
  String get catalogTitle => 'Catálogo';

  @override
  String get searchCatalog => 'Buscar en el catálogo';

  @override
  String get emptyCatalogTitle => 'Catálogo vacío';

  @override
  String get emptyCatalogBody =>
      'Crea servicios y materiales para reutilizarlos en las cotizaciones.';

  @override
  String get newItem => 'Nuevo concepto';

  @override
  String get editItem => 'Editar concepto';

  @override
  String get itemName => 'Nombre';

  @override
  String get itemDescription => 'Descripción';

  @override
  String get category => 'Categoría';

  @override
  String get catGeneral => 'General';

  @override
  String get catLabor => 'Mano de obra';

  @override
  String get catMaterials => 'Materiales';

  @override
  String get catInstallation => 'Instalación';

  @override
  String get catRepair => 'Reparación';

  @override
  String get catMaintenance => 'Mantenimiento';

  @override
  String get catTransport => 'Transporte';

  @override
  String get catTools => 'Equipos y herramientas';

  @override
  String get catProfessional => 'Servicios profesionales';

  @override
  String get catOther => 'Otros';

  @override
  String get allCategories => 'Todas';

  @override
  String get uncategorized => 'Sin categoría';

  @override
  String get price => 'Precio';

  @override
  String get deleteItemTitle => '¿Eliminar concepto?';

  @override
  String get deleteItemBody =>
      'Las cotizaciones que ya lo usan conservan su propia copia.';

  @override
  String get itemSaved => 'Concepto guardado';

  @override
  String get catalogLimitTitle => 'Límite del catálogo';

  @override
  String get catalogLimitBody =>
      'El plan gratuito permite 30 conceptos. Pro los deja ilimitados.';

  @override
  String get kind => 'Tipo';

  @override
  String get businessProfile => 'Perfil comercial';

  @override
  String get businessName => 'Nombre comercial';

  @override
  String get ownerName => 'Responsable';

  @override
  String get website => 'Sitio web';

  @override
  String get city => 'Ciudad';

  @override
  String get region => 'Región';

  @override
  String get postalCode => 'Código postal';

  @override
  String get country => 'País';

  @override
  String get logo => 'Logotipo';

  @override
  String get chooseLogo => 'Elegir logotipo';

  @override
  String get removeLogo => 'Quitar logotipo';

  @override
  String get logoHint => 'Se muestra en el PDF con CotizaPro Pro.';

  @override
  String get currency => 'Moneda';

  @override
  String get customCurrency => 'Otra moneda (código ISO)';

  @override
  String get invalidCurrency =>
      'Usa un código de tres letras, por ejemplo USD.';

  @override
  String get quotePrefix => 'Prefijo';

  @override
  String get nextNumber => 'Siguiente número';

  @override
  String get defaultTax => 'Impuesto predeterminado';

  @override
  String get validityDays => 'Días de validez';

  @override
  String get defaultNotes => 'Notas predeterminadas';

  @override
  String get defaultTerms => 'Condiciones predeterminadas';

  @override
  String get tagline => 'Lema';

  @override
  String get pdfFooter => 'Pie del documento';

  @override
  String get profileSaved => 'Perfil guardado';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get appearance => 'Apariencia';

  @override
  String get themeSystem => 'Automático';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Del sistema';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get numbering => 'Numeración';

  @override
  String get pdfSection => 'Documento PDF';

  @override
  String get showNotes => 'Incluir notas';

  @override
  String get showTerms => 'Incluir condiciones';

  @override
  String get showLogo => 'Incluir logotipo';

  @override
  String get hideBranding => 'Quitar la marca CotizaPro';

  @override
  String get signatureLine => 'Línea de aceptación';

  @override
  String get showTagline => 'Incluir lema';

  @override
  String get backup => 'Copias de seguridad';

  @override
  String get about => 'Acerca de';

  @override
  String get versionLabel => 'Versión';

  @override
  String get offlineNote =>
      'Tus datos permanecen en este dispositivo. CotizaPro funciona sin conexión.';

  @override
  String get openPro => 'CotizaPro Pro';

  @override
  String get backupTitle => 'Copias de seguridad';

  @override
  String get backupBody =>
      'Exporta o restaura clientes, catálogo, cotizaciones y el perfil. La compra Pro no se incluye: se restaura desde la tienda.';

  @override
  String get exportBackup => 'Exportar copia';

  @override
  String get importBackup => 'Importar copia';

  @override
  String get importTitle => '¿Reemplazar los datos de este dispositivo?';

  @override
  String get importBody =>
      'La copia sustituirá clientes, catálogo, cotizaciones, perfil y preferencias. No se puede deshacer.';

  @override
  String get exportDone => 'Copia lista para compartir';

  @override
  String get importDone => 'Copia importada';

  @override
  String get importInvalid => 'El archivo no es una copia válida de CotizaPro.';

  @override
  String get backupWorking => 'Preparando copia';

  @override
  String get proTitle => 'CotizaPro Pro';

  @override
  String get proSubtitle => 'Una compra única para trabajar sin límites.';

  @override
  String get proPriceNote =>
      'El precio de la compra única lo publica la tienda. Aparece aquí cuando el producto está disponible.';

  @override
  String get featureUnlimited => 'Cotizaciones, clientes y catálogo sin límite';

  @override
  String get featureNoAds => 'Sin anuncios';

  @override
  String get featureNoBrand => 'PDF sin la marca CotizaPro';

  @override
  String get featureCustomize => 'Lema, logotipo y línea de aceptación';

  @override
  String get featureLogo => 'Logotipo comercial en el documento';

  @override
  String get featureHistory => 'Filtro por fechas y exportación CSV';

  @override
  String get buyPro => 'Comprar Pro';

  @override
  String buyProPrice(String price) {
    return 'Comprar Pro · $price';
  }

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get restorePurchasesHint =>
      'Usa la misma cuenta de Google Play o App Store con la que compraste Pro.';

  @override
  String get proActiveTitle => 'Pro está activo';

  @override
  String get proActiveBody =>
      'Los límites y la marca de los PDF ya están desbloqueados en este dispositivo.';

  @override
  String get productUnavailable =>
      'El producto todavía no está disponible en la tienda.';

  @override
  String get purchasePending => 'La compra está pendiente de confirmación.';

  @override
  String get purchaseCancelled => 'Compra cancelada.';

  @override
  String get purchaseFailed => 'No se pudo confirmar la compra.';

  @override
  String get storeUnavailable =>
      'La tienda no está disponible en este momento.';

  @override
  String get restoreEmpty => 'No hay una compra de Pro para restaurar.';

  @override
  String get restoreDone => 'Compra restaurada';

  @override
  String get priceFromStore => 'Precio de la tienda';

  @override
  String get pdfQuote => 'Cotización';

  @override
  String get pdfBillTo => 'Cliente';

  @override
  String get pdfFrom => 'Emisor';

  @override
  String get pdfNumber => 'Número';

  @override
  String get pdfIssueDate => 'Emisión';

  @override
  String get pdfValidUntil => 'Válida hasta';

  @override
  String get pdfConcept => 'Concepto';

  @override
  String get pdfQty => 'Cant.';

  @override
  String get pdfUnit => 'Unidad';

  @override
  String get pdfPrice => 'Precio';

  @override
  String get pdfAmount => 'Importe';

  @override
  String get pdfSubtotal => 'Subtotal';

  @override
  String get pdfDiscount => 'Descuento';

  @override
  String get pdfTax => 'Impuesto';

  @override
  String get pdfFee => 'Gastos';

  @override
  String get pdfTotal => 'Total';

  @override
  String get pdfNotes => 'Notas';

  @override
  String get pdfTerms => 'Condiciones';

  @override
  String get pdfMadeWith => 'Creado con CotizaPro';

  @override
  String get pdfDraft => 'BORRADOR';

  @override
  String get pdfAcceptedBy => 'Aceptado por';

  @override
  String get pdfDate => 'Fecha';

  @override
  String get pdfSignature => 'Firma';

  @override
  String get changeStatus => 'Estado';

  @override
  String get openQuote => 'Abrir';

  @override
  String get numberPreview => 'Se asignará al guardar si lo dejas igual.';

  @override
  String get manualConcept => 'Concepto manual';

  @override
  String get apply => 'Aplicar';

  @override
  String get freeQuotesUsage => 'Plan gratuito';

  @override
  String greetingNamed(String greeting, String name) {
    return '$greeting, $name';
  }

  @override
  String stepOf(int current, int total) {
    return '$current de $total';
  }

  @override
  String statAcceptedAmount(String currency) {
    return 'Aceptado en $currency';
  }

  @override
  String pdfPage(int current, int total) {
    return 'Página $current de $total';
  }

  @override
  String freeUsage(int count, int limit) {
    return '$count de $limit en el plan gratuito';
  }
}
