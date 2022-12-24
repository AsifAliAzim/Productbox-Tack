import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class UsersRepository {
  //[Note: this method will make the api call and return a status code
  //that we will use in the cubit for emitting our states depending on the
  //returned status code

  ///Users List  API
  static Future<int?>? usersData({
    required String userName,
    required String password,
  }) async {
    final String apiUrl = 'https://jsonplaceholder.typicode.com/users';
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        try {
          final item = json.decode(response.body).firstWhere(
              (e) => e['username'] == '$userName' && e['email'] == '$password');
          // print(item['name']);
          return 200;
        } catch (e) {
          return 401;
        }
      } else {
        return response.statusCode;
      }
    } on SocketException catch (e) {
      return 20;
    } on Exception catch (e) {
      return 0;
    }
  }
}
