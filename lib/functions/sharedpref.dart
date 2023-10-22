import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper{
  static String userIDKey = 'UserIdKey';

  Future<bool> saveUserID(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIDKey, getUserId);
  }

  //get

  Future<String?> getUserID() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userIDKey);
  }
}