abstract class AppValidator {
  String? validator(String? value);
}

// TextValidator
class TextValidator extends AppValidator {
  final String message;
  TextValidator({required this.message});
  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter $message';
    }
    return null;
  }
}

// EmailValidator
class EmailValidator extends AppValidator {
  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }
}

// MobileValidator
class MobileValidator extends AppValidator {
  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number cannot be empty';
    }
    const pattern = r'^[0-9]{10}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Invalid mobile number format';
    }
    return null;
  }
}

// PasswordValidator
class PasswordValidator extends AppValidator {
  @override
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
