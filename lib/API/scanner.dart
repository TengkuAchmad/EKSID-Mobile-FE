import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ScanQR {
  void MyScanner(var id_mesin) async {
    var dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    var id_user = prefs.getString('id');
    Response response = await dio.put(
        "https://fourtour.site/melinda/mesin/scan",
        data: {"id_mesin": id_mesin, "id_pengguna": id_user});
  }
}
