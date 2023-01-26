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
  // validation for email

  static bool isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return regex.hasMatch(email);
  }

  // validation for password
  static bool isValidPassword(String password) {
    final RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regex.hasMatch(password);
  }

  //password length validation
  static bool isValidPasswordLength(String password, {int length = 8}) {
    if (password.length < length) {
      return false;
    } else {
      return true;
    }
  }

  // validation for phone number
  static bool isValidPhoneNumber(String phoneNumber) {
    final RegExp regex = RegExp(r'^[0-9]{10}$');
    return regex.hasMatch(phoneNumber) && phoneNumber.length == 10;
  }

  //validation for url
  static bool isValidUrl(String url) {
    final RegExp regex =
        RegExp(r'^(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+$');
    return regex.hasMatch(url);
  }

  //validation for name
  static bool isValidName(String name) {
    final RegExp regex = RegExp(r'^[a-zA-Z ]+$');
    return regex.hasMatch(name);
  }
}
