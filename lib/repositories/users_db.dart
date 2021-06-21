import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'users_db.g.dart';

class Users extends Table {
  TextColumn get name => text()();
  RealColumn get money => real()();
}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  int get schemaVersion => 1;
  Future<List<User>> getAllUsers() => select(users).get();
  Future<User> getUser(User user) {
    return (select(users)..where((u) => u.name.equals(user.name))).getSingle();
  }

  Future<int> updateUser(User user) {
    return (update(users)..where((u) => u.name.equals(user.name))).write(user);
  }

  Stream<List<User>> watchAllUsers() => select(users).watch();
  Future<int> insertNewUser(User user) => into(users).insert(user);
  Future<int> deleteUser(User user) => delete(users).delete(user);
}

// List<User> _allUsers = List.empty(growable: true);
//
// Future<List<User>> loadAllUsers() {
//   return Future.delayed(Duration(seconds: 2)).then((value) => _allUsers);
// }
//
// Future<List<User>> addUser(User user) {
//   _allUsers.add(user);
//   return loadAllUsers();
// }
//
// Future<List<User>> addMoney(User user) {
//   _allUsers.where((u) => u.name == user.name).first.money += user.money;
//   return loadAllUsers();
// }
