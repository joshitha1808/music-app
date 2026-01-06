import 'dart:io';

class ServerConstant {
  static String serverURL = Platform.isAndroid
      ? 'http://172.18.144.57:8000'
      : 'http://127.0.0.1:8000';
}
