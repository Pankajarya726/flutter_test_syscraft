import 'package:connectivity/connectivity.dart';

class NetworkCheck {
  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print(ConnectivityResult.mobile);
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print(ConnectivityResult.wifi);
      return true;
    }
    print(connectivityResult.toString());
    return false;
  }
}
