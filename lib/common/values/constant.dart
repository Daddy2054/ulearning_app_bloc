// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String SERVER_API_URL =
"https://9289-146-70-182-92.ngrok-free.app/";
//      "https://dd7a-95-174-64-246.ngrok-free.app/";
  //https://42d6-158-148-62-206.ngrok-free.app/
  //phome mobile internet hotspot
  //static const String SERVER_API_URL = "http://172.20.10.12:8000/";
  // local network

  //static const String SERVER_API_URL = "http://192.168.0.149:8000/";
//  static const String SERVER_API_URL = "http://127.0.0.1:8000/";
  static const String SERVER_UPLOADS = "${SERVER_API_URL}uploads/";
  static const String STORAGE_DEVICE_OPEN_FIRST_TIME = 'device_first_open';
  static const String STORAGE_USER_PROFILE_KEY = 'user_profile_key';
  static const String STORAGE_USER_TOKEN_KEY = 'user_token_key';
}
