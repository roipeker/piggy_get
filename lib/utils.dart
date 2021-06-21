import 'package:get/get.dart';

abstract class FormValidators {
  static String? money(String? value) {
    value ??= '';
    value = value.trim();
    if (value.isEmpty) {
      return 'Please enter some numbers';
    }
    if (!value.isNum) {
      return 'Please enter only numbers';
    }
    return null;
  }

  static String? name(String? value) {
    value ??= '';
    value = value.trim();
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    if (value.isNumericOnly) {
      return 'Please, write a valid name';
    }
    return null;
  }
}
