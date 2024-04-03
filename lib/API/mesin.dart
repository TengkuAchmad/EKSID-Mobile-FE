import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:melinda/model/MesinModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mesin {
  Future<List<Results>?> getMesin() async {
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
    var response = await dio.get("https://fourtour.site/melinda/mesin/0");
    var jsonDecoded = jsonDecode(response.data);
    var mesin = MesinModel.fromJson(jsonDecoded);
    return mesin.results;
  }

  void updateMesin(String id_mesin) async {
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
    var id_minyak = prefs.getString('id_minyak');
    Response response = await dio
        .get("https://fourtour.site/melinda/mesin/0" + id_mesin + id_minyak!);
  }
}
