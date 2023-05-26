import 'dart:io';
import 'package:database/service/user_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class DBService {
  UserService userService = UserService();
  Box? userBox;

  Future<dynamic> checkBox() async {
    await openBox();
    if (userBox != null && userBox!.isNotEmpty) {
      return userBox!.get('users')['users'];
    } else {
      return getUsers();
    }
  }

  Future<dynamic> getUsers() async {
    dynamic response = await userService.getUsers();
    if (response is Map<String, dynamic>) {
      await openBox();
      await writeToBox(response);
      return userBox!.get('users')['users'];
    } else {
      return response;
    }
  }

  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    userBox = await Hive.openBox("user");
  }

  Future<void> writeToBox(Map<String, dynamic> users) async {
    await userBox!.put("users", users);
  }
}
