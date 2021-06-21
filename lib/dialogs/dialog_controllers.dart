import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:piggy_get/repositories/users_db.dart';

/// Put dialogs controllers in 1 file... as logic is pretty narrow.
abstract class BaseDialogForm extends GetxController {
  final formKey = GlobalKey<FormState>();

  /// cool getter approach for callback to disable the button in a reactive fashion.
  VoidCallback? get onSavePress => hasEmptyValues() ? null : _onSavePress;

  void _onSavePress() {
    if (!formKey.currentState!.validate()) return;
    executeSave();
  }

  void executeSave();
  bool hasEmptyValues();
}

///
/// --- ADD USER CONTROLLER
///
class AddUserController extends BaseDialogForm {
  final name = ''.obs;
  final money = ''.obs;

  @override
  void executeSave() {
    final _money = double.parse(money());
    final user = User(name: name(), money: _money);
    Get.back(result: user);
  }

  /// Utility to enable/disable the button.
  /// `isBlank = trim().isEmpty()`
  @override
  bool hasEmptyValues() => name().isBlank! && money().isBlank!;
}

///
/// --- ADD MONEY CONTROLLER
///
class AddMoneyController extends BaseDialogForm {
  final money = ''.obs;

  @override
  void executeSave() {
    final _money = double.parse(money());
    Get.back(result: _money);
  }

  @override
  bool hasEmptyValues() => money().isBlank!;
}
