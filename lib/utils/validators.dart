class Validators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty || value.length < 3) {
      return 'Name must contain at least 3 characters';
    } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
      return 'Name cannot contain special characters';
    }
    return null;
  }

  static String? validateTemperature(String? value) {
    if (value == null || value.isEmpty || value.contains(RegExp(r'^[a-zA-Z\-]'))) {
      return 'Use only numbers!';
    }
    return null;
  }
}