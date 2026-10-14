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
- Clientes, catálogo con categorías fijas traducibles, historial con búsqueda y filtros, duplicar, editar y eliminar con confirmación.
- Perfil comercial, logotipo, numeración, tema claro, oscuro o del sistema, y copias de seguridad JSON.
- Plan gratuito: 5 cotizaciones, 20 clientes y 30 conceptos. Consultar y exportar lo ya creado sigue disponible al llegar al límite.
- Compra única no consumible `cotizapro_pro` para cotizaciones ilimitadas, sin anuncios, sin marca en el PDF, logotipo y opciones avanzadas de documento e historial. Pro solo se activa cuando Google Play o App Store confirman la compra o la restauración. El precio que ve el usuario es el que devuelve la tienda.
- Banners de prueba solo al final de las listas de clientes, catálogo e historial. No aparecen en el inicio, el editor, el PDF ni los estados vacíos. Tampoco aparecen mientras la app consulta si la compra Pro sigue vigente, ni cuando Pro está activo.

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
assets/branding/ símbolo, icono y logotipos de CotizaPro
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
python3 tool/build_brand.py
```

`flutter build ios` requiere macOS y Xcode. En esta máquina Linux se comprobó `flutter analyze lib` y `flutter build linux --release`. `python3 tool/build_brand.py` regenera `assets/branding/`, los mipmaps de Android, el splash y las imágenes de lanzamiento de iOS. Requiere Pillow y la fuente Manrope ya incluida.

Los archivos generados de Drift (`lib/data/database/app_database.g.dart`) y de localización (`lib/l10n/generated/`) están en el repositorio para poder compilar sin volver a generarlos.

## AdMob y compras antes de publicar

Los identificadores actuales son los de prueba de Google.

1. Crear la app en AdMob y sustituir el id de aplicación:
   - Android: `android/app/src/main/AndroidManifest.xml`, meta-data `com.google.android.gms.ads.APPLICATION_ID` (ahora `ca-app-pub-3940256099942544~3347511713`).
   - iOS: `ios/Runner/Info.plist`, clave `GADApplicationIdentifier` (ahora `ca-app-pub-3940256099942544~1458002511`).
2. En `lib/core/constants/monetization.dart`, poner `useGoogleTestAds` en `false` y reemplazar `productionAndroidBannerId` y `productionIosBannerId`. Si el id contiene `X`, el banner no se carga.
3. Completar la lista SKAdNetwork de Google en `ios/Runner/Info.plist`. Ahora hay un solo identificador de ejemplo.
4. Configurar el formulario UMP de consentimiento para el EEE. La app pide consentimiento y, si no hay personalización, solicita anuncios no personalizados.
5. Crear el producto no consumible `cotizapro_pro` en Play Console y App Store Connect. El precio se configura solo en esas consolas. La app muestra `ProductDetails.price` y no tiene un importe fijo.
6. Activar la capacidad In-App Purchase en Xcode y la facturación en Play Console. Probar con cuentas de licencia y StoreKit. El código no simula compras ni tiene un interruptor local de pago.
7. Firmar los binarios de release con el almacén de la cuenta publicadora. El `applicationId` de Android es `com.sentenciasql.cotizapro`. La app de AdMob de producción debe registrarse con ese identificador; el id de prueba actual no está ligado a un paquete publicado.

Los anuncios solo aparecen al final de las listas con contenido de clientes, catálogo e historial. Desaparecen si Pro está confirmado y mientras dura la consulta de la compra. No se muestran en el inicio, el editor, el PDF, los estados vacíos ni los ajustes.

### Producto `cotizapro_pro` en Google Play Console

Esta integración no está verificada con un producto real. Hasta completar estos pasos y probar una compra de licencia, Pro no está listo para producción.

1. En Play Console, crea o elige la aplicación cuyo identificador es `com.sentenciasql.cotizapro`. Una instalación hecha con otro identificador no comparte esta ficha.
2. Sube un Android App Bundle firmado a una pista de pruebas internas. La facturación de Play no responde en un APK instalado al margen de la tienda.
3. Abre Monetización > Productos > Productos en la aplicación. Crea un producto de un solo uso, no una suscripción y no un consumible.
4. Usa exactamente el id `cotizapro_pro`. Ese valor está en `lib/core/constants/monetization.dart`.
5. Escribe el nombre y la descripción. Fija el precio en la consola, en cada país que quieras vender. No hace falta volver a compilar para cambiar el precio.
6. Activa el producto. Un producto en borrador llega a la app como no disponible y no desbloquea Pro.
7. En Configuración > Pruebas de licencias, añade las cuentas Gmail que probarán la compra.
8. Esas cuentas deben unirse a la pista de pruebas e instalar CotizaPro desde Play Store.
9. Compra, cancela, deja una compra pendiente si el medio de pago lo permite, y usa Ajustes > Restaurar compras. Pro solo debe activarse con una compra o restauración ya cobrada. Cancelar, fallar o quedar pendiente no activa Pro.
10. El permiso `com.android.vending.BILLING` está declarado en el manifiesto. No añadas credenciales de servicio ni un archivo `google-services.json`: la app no usa Firebase.

### Producto `cotizapro_pro` en App Store Connect

1. El identificador de iOS del proyecto sigue siendo `com.cotizapro.cotizapro`. Crea el producto en la app de App Store Connect que use ese bundle id. No lo cambies solo para la compra.
2. Acepta el contrato de aplicaciones de pago y completa impuestos y datos bancarios. Sin eso, StoreKit no devuelve el producto.
3. En la ficha de la app, crea una compra dentro de la app de tipo no consumible con el id `cotizapro_pro`.
4. Define el precio en App Store Connect. La app mostrará el texto localizado que devuelva StoreKit.
5. Añade la compra a la versión que vas a probar y rellena la revisión de la compra (captura y texto).
6. En Xcode, activa la capability In-App Purchase para el target Runner. El proyecto no incluye un archivo StoreKit de simulación.
7. Crea un usuario de Sandbox en App Store Connect e inicia sesión con él en el dispositivo, en Ajustes > App Store > Cuenta de Sandbox.
8. Instala la build de desarrollo o TestFlight. Compra y, después, elimina la app e instálala de nuevo: Ajustes > Restaurar compras debe recuperar Pro con la misma cuenta.
9. Una compra cancelada, un error o un pago pendiente no deben dejar Pro activo.

Al abrir la app, Android consulta las compras que Play todavía reconoce y iOS lee los derechos actuales de StoreKit. Si esa consulta termina bien y no incluye `cotizapro_pro`, Pro se retira. Si la tienda no responde, se conserva el último desbloqueo confirmado y no se concede uno nuevo. No hay servidor que valide el recibo: la confirmación es la que entrega la tienda en el dispositivo. Conviene añadir esa validación antes de una publicación amplia. Hasta probar los pasos anteriores en un dispositivo, no des por hecha la compra en producción.

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
10. Abrir Pro sin el producto configurado en la tienda: debe indicar que la tienda o el producto no están disponibles, no debe mostrar un precio escrito en la app y no debe desbloquear Pro.
11. Con el producto activo, comprobar que el botón de compra muestra el precio devuelto por la tienda. Cancelar el pago no activa Pro. Tras una compra confirmada, los anuncios desaparecen y las opciones Pro quedan disponibles en todas las pantallas. Restaurar compras, en Ajustes, recupera ese acceso.

## Limitaciones antes de publicar

- La confirmación de la compra es la que entrega la tienda en el dispositivo. No hay servidor para validar el recibo. Conviene añadirlo antes de una publicación amplia.
- La compra no se ha verificado en Google Play ni en App Store: en este entorno no hay productos de consola ni un dispositivo con tienda. Pro no está listo para producción hasta completar la configuración de arriba y probarla a mano.
- Si la consulta a la tienda falla, un Pro ya confirmado se conserva. Si la consulta termina y la cuenta ya no tiene `cotizapro_pro`, Pro se desactiva.
- El logotipo se limita a 2 MB (png, jpg o webp). Si el disco falla después de guardar la fila, la ruta del logotipo puede quedar huérfana.
- No hay historial de versiones de una cotización: se conserva el último guardado y su instantánea.
- El icono y el splash usan la marca de CotizaPro. En este entorno no se ejecutó la app en un dispositivo Android o iOS, así que el splash nativo no se comprobó en un teléfono.
- iOS no se puede compilar en Linux.
- Los anuncios y la compra requieren los ids y el producto de producción descritos arriba.
