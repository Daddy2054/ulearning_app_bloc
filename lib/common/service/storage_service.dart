import 'package:shared_preferences/shared_preferences.dart';

import '../values/constant.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

    Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }


  bool getDeviceFirstOpen(){
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME)??false;
  }
}
