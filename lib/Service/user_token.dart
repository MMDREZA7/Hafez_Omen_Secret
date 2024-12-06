// import 'package:shared_preferences/shared_preferences.dart';

// class UserToken {
//   final String token;

//   Future<void> saveToken(String token) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('user_token', token);
//     return;
//   }

//   Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('user_token');
//   }

//   const UserToken({required this.token});
// }
