import 'package:get/get.dart';
import 'package:piggy_get/dialogs/add_user_dialog.dart';
import 'package:piggy_get/pages/account/account_controller.dart';
import 'package:piggy_get/pages/account/account_view.dart';
import 'package:piggy_get/repositories/users_db.dart';
import 'package:piggy_get/services/db_service.dart';

/// statemixin approach, Single VALUE state. (similar to Bloc events)
class MainController extends GetxController with StateMixin<List<User>> {
  final _db = DbService.get();
  final _empty = List<User>.empty();

  @override
  void onReady() {
    _loadUsers();
    super.onReady();
  }

  Future<void> _addUser(User user) async {
    change(_empty, status: RxStatus.loading());
    final len = await _db.insertNewUser(user);
    if (len == -1) {
      change(_empty, status: RxStatus.empty());
    } else {
      _loadUsers();
    }
  }

  Future<void> onAddUserTap() async {
    final user = await Get.dialog<User?>(AddUserDialog());
    if (user != null) {
      _addUser(user);
    }
  }

  Future<void> _loadUsers() async {
    change(_empty, status: RxStatus.loading());
    try {
      final result = await _db.getAllUsers();
      if (result.isEmpty) {
        change(result, status: RxStatus.empty());
      } else {
        change(result, status: RxStatus.success());
      }
    } catch (error) {
      change(_empty, status: RxStatus.error('$error'));
    }
  }

  Future<void> openUser(User model) async {
    final hasMoneyChanged = await Get.to<bool>(
          () => AccountView(),
          binding: BindingsBuilder.put(() => AccountController(model)),
        ) ??
        false; // press back on Android?
    if (hasMoneyChanged) {
      _loadUsers();
    }
  }
}
