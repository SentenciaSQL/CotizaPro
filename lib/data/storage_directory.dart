import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Directory for the database, logos and quote snapshots.
///
/// Mobile uses the app documents directory. If that directory is unavailable
/// (some Linux desktops without `xdg-user-dir`), the app support directory is
/// used so the first launch still persists data.
Future<Directory> appStorageDirectory() async {
  try {
    final documents = await getApplicationDocumentsDirectory();
    if (!await documents.exists()) {
      await documents.create(recursive: true);
    }
    return documents;
  } on MissingPlatformDirectoryException {
    return getApplicationSupportDirectory();
  }
}
