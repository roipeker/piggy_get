import 'package:get/get.dart';
import 'package:piggy_get/dialogs/dialog_controllers.dart';

import 'db_service.dart';

void initServices() {
  Get.put(DbService());

  /// Dialog Controllers:
  /// Lazy initialized and non-persistent.
  /// When you close the dialog Route they will be disposed automatically.
  /// `fenix` will auto-recreate the controllers
  /// when "consumed" (controller) on each dialog,
  /// (AddMoneyDialog/AddUserDialog) .
  Get.lazyPut(() => AddUserController(), fenix: true);
  Get.lazyPut(() => AddMoneyController(), fenix: true);
}
