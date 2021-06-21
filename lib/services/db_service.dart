import 'package:get/get.dart';
import 'package:piggy_get/repositories/users_db.dart';

class DbService extends GetxService {
  /// shortcut to access the instance.
  static DbService get() => Get.find();

  late AppDatabase _db = AppDatabase(openConnection());
  DbService();

  /// Just proxy the calls for now.
  Future<List<User>> getAllUsers() => _db.getAllUsers();
  Future<User> getUser(User user) => _db.getUser(user);
  Future<int> updateUser(User user) => _db.updateUser(user);
  Stream<List<User>> watchAllUsers() => _db.watchAllUsers();
  Future<int> insertNewUser(User user) => _db.insertNewUser(user);
  Future<int> deleteUser(User user) => _db.deleteUser(user);
}
