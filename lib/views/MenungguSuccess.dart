import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:melinda/API/auth.dart';
import 'package:melinda/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class MenungguSuccess extends StatefulWidget {
  String name;
  int poin;
  MenungguSuccess({required this.name, required this.poin});

  @override
  State<MenungguSuccess> createState() => _MenungguSuccessState();
}

class _MenungguSuccessState extends State<MenungguSuccess> {
  @override
  void initState() {
    super.initState();
    reFetch();
  }

  void reFetch() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('id_minyak');
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
    var poinResponse = await dio.get("https://fourtour.site/melinda/poin/");
    var jsonPoin = jsonDecode(poinResponse.data);
    if (jsonPoin['poin'] == null && jsonPoin['volume'] == null) {
      jsonPoin['poin'] = 0;
      jsonPoin['volume'] = 0;
    }
    await prefs.setInt("poin", jsonPoin['poin']);
    await prefs.setInt("volume", jsonPoin['volume']);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/img_success.png",
                      width: 200,
                    ),
                    Text(
                      "Halo ${widget.name}\nSelamat transaksi anda berhasil",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: PRIMARY_COLOR),
                    ),
                    Text(
                      "${widget.poin} ml",
                      style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                    Text(
                      "Minyak Jelantah",
                      style: TextStyle(color: PRIMARY_COLOR),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: PRIMARY_COLOR,
                              padding: const EdgeInsets.all(15),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return MainPage();
                              }));
                            },
                            child: const Text("Kembali ke Beranda"),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
