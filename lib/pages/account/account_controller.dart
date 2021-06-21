import 'package:get/get.dart';
import 'package:piggy_get/dialogs/add_money_dialog.dart';
import 'package:piggy_get/repositories/users_db.dart';
import 'package:piggy_get/services/db_service.dart';

class AccountController extends GetxController with StateMixin<User> {
  final _db = DbService.get();

  late Rx<User> user;
  late double _initialMoney;
  AccountController(User user)
      : this.user = user.obs,
        _initialMoney = user.money;

  String get title => user().name;

  String get money => user().money.toString();

  @override
  void onClose() {
    user.close();
    super.onClose();
  }

  Future<void> openAddMoney() async {
    final money = await Get.dialog<double?>(AddMoneyDialog());
    if (money != null) {
      _addMoney(money);
    }
  }

  Future<void> _addMoney(double money) async {
    /// same as `user()`.
    final _user = user.value;
    final result = await _db.updateUser(_user.copyWith(
      money: _user.money + money,
    ));
    if(result>-1){
      user.value = await _db.getUser(_user);
    } else {
      print("Error updating user's money?");
    }
  }

  void onBackPress() {
    // => Navigator.pop(context, controller.hasMoneyValueChanged()),
    Get.back<bool>(result: hasMoneyValueChanged);
  }

  bool get hasMoneyValueChanged => _initialMoney != user.value.money;
}
