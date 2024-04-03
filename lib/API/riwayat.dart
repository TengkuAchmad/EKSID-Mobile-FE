import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:melinda/model/RiwayatModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Riwayat {
  Future<List<Results>?> getRiwayat() async {
    final prefs = await SharedPreferences.getInstance();
    var email = prefs.getString("email");
    var password = prefs.getString("password");
    var dio = Dio(BaseOptions(
        responseType: ResponseType.plain,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        }));
    dio.interceptors.add(CookieManager(CookieJar()));
    var loginResponse = await dio.post("https://fourtour.site/melinda/login/",
        data: FormData.fromMap({
          'email': email,
          'password': password,
        }));
    Response response =
        await dio.get("https://fourtour.site/melinda/produk/penukaran/user");
    var jsonDecoded = jsonDecode(response.data);
    var riwayat = RiwayatModel.fromJson(jsonDecoded);
    return riwayat.results;
  }
}
