// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:melinda/API/auth.dart';
import 'package:melinda/API/user.dart';
import 'package:melinda/model/ProdukModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:melinda/views/PenukaranSuccess.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class Produk {
  Future<List<Results>?> getProduk(String url) async {
    var dio = Dio();
    Response response = await dio.get(url);
    var produk = ProdukModel.fromJson(response.data);
    var results = produk.results;
    return results;
  }

  void penukaran(
      BuildContext context, String id_produk, int jumlah, int poin) async {
    // Get cookie
    final prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    var password = prefs.getString('password');
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

    //Tukar Produk
    var id_pengguna = prefs.getString('id');
    var name = prefs.getString('name');
    try {
      Response response = await dio
          .post("https://fourtour.site/melinda/produk/penukaran/user", data: {
        "id_produk": id_produk,
        "id_pengguna": id_pengguna,
        "jumlah": jumlah
      });
      print(id_pengguna);
      print(id_produk);
      print(response.statusCode);
      print(response.statusMessage);
      if (response.statusCode == 200) {
        Navigator.pop(context);
        // Auth().LogIn(context, email!, password!);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return PenukaranSuccess(
            name: name!,
            poin: poin,
          );
        }));
        var email = prefs.getString('email');
        var password = prefs.getString('password');
        // Auth().LogIn(context, email!, password!);
        print("Success");
      } else {
        Navigator.pop(context);
        DialogKurang(context);
      }
    } catch (e) {
      try {
        Navigator.pop(context);
      } catch (e) {
        print(e);
      }
      print(e);
    }
  }

  Future<dynamic> DialogKurang(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Poin anda kurang",
              style:
                  TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
