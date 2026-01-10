class InputValidator {
  static final RegExp validatePhoneNumberWithoutCode = RegExp(
    r'^[1-9][0-9]{9}$',
  );
  static final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  // RegExp if need regex if not need not problem
  static String? phoneValidator(String? value) {
    if (value == null ) {
      return 'Field is empty';
    } 

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is empty';
    } else if (value.length < 2) {
      return 'Password must be at least 5 characters';
    }
    return null;
  }
}
