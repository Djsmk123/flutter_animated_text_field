class TextErrorservice {
  static Map<String, String?> errors = {};
  static addError({required String errorKey, required String errorMessage}) {
    errors[errorKey] = errorMessage;
  }

  static resetError({required String errorKey}) {
    errors[errorKey] = null;
  }

  static String? getError({required String errorKey}) {
    return errors[errorKey];
  }
}
