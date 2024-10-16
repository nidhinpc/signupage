import 'package:shared_preferences/shared_preferences.dart';

class HomeScreencontroller {
  static late final SharedPreferences prefs;
  static String? storedEmail;
  static String? storedPassword;

  static initsharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future addData(String username, String password) async {
    await prefs.setString("name", username);
    await prefs.setString("pass", password);
  }

  static getdata() async {
    storedEmail = prefs.getString('name');
    storedPassword = prefs.getString('pass');
    print(storedEmail);
    print(storedPassword);
  }
}
