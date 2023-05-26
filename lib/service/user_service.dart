import 'package:database/models/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  Future<dynamic> getUsers() async {
    try {
      Response response = await Dio().get("http://192.168.42.200:3000/user");
      print(response.data);
      return response.data as Map<String, dynamic>;
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
