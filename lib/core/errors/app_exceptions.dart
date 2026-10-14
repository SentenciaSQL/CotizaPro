class QuoteLimitException implements Exception {
  const QuoteLimitException();
}

class ClientLimitException implements Exception {
  const ClientLimitException();
}

class CatalogLimitException implements Exception {
  const CatalogLimitException();
}

class DuplicateQuoteNumberException implements Exception {
  const DuplicateQuoteNumberException();
}

class BackupFormatException implements Exception {
  const BackupFormatException();
}

class ValidationException implements Exception {
  const ValidationException(this.code);
  final String code;
}
