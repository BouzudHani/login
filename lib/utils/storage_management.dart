import 'package:get_storage/get_storage.dart';
class LocalStorage{
  static final shared = GetStorage();

  static void writeOnStorage(String key , String value){
    shared.write(key, value);
  }

  static String? readFromStorage(String key) {
    return  shared.read(key);
  }
  static void removeToken(String key){
     shared.remove(key);
  }

}