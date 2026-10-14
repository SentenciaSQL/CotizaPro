# CotizaPro

Aplicación móvil para crear cotizaciones y presupuestos profesionales desde el teléfono. Está pensada para trabajadores independientes, técnicos y pequeños negocios. Funciona sin cuenta, sin servidor propio y sin conexión.

Android e iOS son las plataformas de publicación. El proyecto también incluye el destino Linux para comprobar la interfaz en escritorio.

## Funciones

- Inicio con saludo, nombre comercial, resumen real de cotizaciones, recientes y accesos a clientes, catálogo, historial y perfil.
- Alta de cotización en cuatro pasos: cliente y fechas, conceptos, importes, revisión.
- Cliente rápido, conceptos del catálogo o manuales, cantidades, precios, mano de obra y materiales, descuento, impuesto y cargo adicional.
- Totales en unidades menores enteras (céntimos), con redondeo half-up. El idioma y la moneda se configuran por separado.
- Borrador, enviada, aceptada y rechazada. «Vencida» se calcula cuando una cotización enviada supera su fecha.
- Vista previa y uso compartido del PDF en español o inglés, con varias páginas, marca de agua de borrador y pie de página.
- Clientes, catálogo, historial con búsqueda y filtros, duplicar, editar y eliminar con confirmación.
- Perfil comercial, logotipo, numeración, tema claro, oscuro o del sistema, y copias de seguridad JSON.
- Plan gratuito: 5 cotizaciones, 20 clientes y 30 conceptos. Consultar y exportar lo ya creado sigue disponible al llegar al límite.
- Compra única no consumible `cotizapro_pro` para cotizaciones ilimitadas, sin anuncios, sin marca en el PDF, logotipo y opciones avanzadas de documento e historial. Pro solo se activa con una compra o restauración confirmada por la tienda.

No hay datos de demostración. La primera apertura está vacía.

## Estructura

```
lib/
  main.dart, app.dart
  core/          tema, navegación, dinero, límites, componentes
  data/          Drift, repositorios, copias de seguridad
  features/
    dashboard/
    clients/
    services_catalog/
    quotations/
    pdf/
    business_profile/
    settings/
    backup/
    pro/
    ads/
  l10n/          app_es.arb, app_en.arb y código generado
assets/fonts/    Manrope
```

La base SQLite guarda perfil, ajustes, clientes, catálogo, cotizaciones y líneas. Cada cotización conserva una instantánea del cliente, del texto comercial y del logotipo.

## Dependencias

- Flutter 3.47 / Dart 3.13
- drift, drift_dev, build_runner
- path_provider, path
- flutter_riverpod, go_router
- intl y flutter_localizations
- pdf, printing, share_plus, file_picker
- google_mobile_ads, in_app_purchase

## Comandos

```bash
flutter pub get
dart run build_runner build
flutter gen-l10n
flutter analyze lib
flutter build apk --release
flutter build appbundle --release
flutter build ios --release
```

`flutter build ios` requiere macOS y Xcode. En esta máquina Linux se comprobó `flutter analyze lib` y `flutter build linux --release`.

Los archivos generados de Drift (`lib/data/database/app_database.g.dart`) y de localización (`lib/l10n/generated/`) están en el repositorio para poder compilar sin volver a generarlos.

## AdMob y compras antes de publicar

Los identificadores actuales son los de prueba de Google.

1. Crear la app en AdMob y sustituir el id de aplicación:
   - Android: `android/app/src/main/AndroidManifest.xml`, meta-data `com.google.android.gms.ads.APPLICATION_ID` (ahora `ca-app-pub-3940256099942544~3347511713`).
   - iOS: `ios/Runner/Info.plist`, clave `GADApplicationIdentifier` (ahora `ca-app-pub-3940256099942544~1458002511`).
2. En `lib/core/constants/monetization.dart`, poner `useGoogleTestAds` en `false` y reemplazar `productionAndroidBannerId` y `productionIosBannerId`. Si el id contiene `X`, el banner no se carga.
3. Completar la lista SKAdNetwork de Google en `ios/Runner/Info.plist`. Ahora hay un solo identificador de ejemplo.
4. Configurar el formulario UMP de consentimiento para el EEE. La app pide consentimiento y, si no hay personalización, solicita anuncios no personalizados.
5. Crear el producto no consumible `cotizapro_pro` en Play Console y App Store Connect. Precio orientativo: 5,99 USD. El precio cobrado lo define la tienda.
6. Activar la capacidad In-App Purchase en Xcode y la facturación en Play Console. Probar con cuentas de licencia y StoreKit, no con compras simuladas en el código.
7. Firmar los binarios de release con el almacén de la cuenta publicadora. El `applicationId` actual es `com.cotizapro.cotizapro`.

Los anuncios solo aparecen en historial, clientes, catálogo y ajustes, y desaparecen si Pro está activo. No se muestran en el inicio ni en el editor.

## Verificación manual

1. Abrir la app vacía y completar el perfil comercial.
2. Crear un cliente y un concepto del catálogo.
3. Crear la primera cotización: cliente, concepto, impuesto o descuento, guardar borrador.
4. Comprobar que el total del pie coincide con subtotal, descuento, impuesto y cargo.
5. Abrir la vista previa del PDF y compartirla con el menú del sistema.
6. Filtrar el historial, duplicar, editar y eliminar con confirmación.
7. Cambiar tema, idioma y moneda, y comprobar que una cotización ya guardada conserva su moneda.
8. Exportar una copia JSON e importarla en una instalación limpia.
9. Crear cinco cotizaciones en el plan gratuito y comprobar que la sexta se bloquea, pero las existentes se abren y se exportan.
10. Abrir Pro sin productos de tienda configurados: debe indicar que la tienda o el producto no están disponibles y no debe desbloquear Pro.

## Limitaciones antes de publicar

- La confirmación de la compra es la que entrega la tienda en el dispositivo. No hay servidor para validar el recibo. Conviene añadirlo antes de una publicación amplia.
- La restauración espera un breve intervalo del flujo de la tienda. Una restauración vacía no revoca un Pro ya confirmado.
- El logotipo se limita a 2 MB (png, jpg o webp). Si el disco falla después de guardar la fila, la ruta del logotipo puede quedar huérfana.
- No hay historial de versiones de una cotización: se conserva el último guardado y su instantánea.
- El icono de lanzamiento sigue siendo el de la plantilla de Flutter.
- iOS no se puede compilar en Linux.
- Los anuncios y la compra requieren los ids y el producto de producción descritos arriba.
