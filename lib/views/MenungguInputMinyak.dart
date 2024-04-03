// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks, prefer_const_constructors, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:melinda/main.dart';
import 'package:melinda/views/InputBersamaPetugas.dart';
import 'package:melinda/views/MenungguSuccess.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:melinda/model/WaitingInput.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class MenungguInputan extends StatefulWidget {
  String name;
  int poin;
  MenungguInputan({required this.name, required this.poin});

  @override
  State<MenungguInputan> createState() => _MenungguInputanState();
}

class _MenungguInputanState extends State<MenungguInputan> {
  bool isSuccess = false;
  Timer? refreshTimer;
  @override
  void initState() {
    super.initState();
    if (isSuccess == false) {
      refreshTimer = Timer.periodic(Duration(seconds: 5), (timer) {
        refreshVerification();
        print("Menunggu");
        if (isSuccess == true) {
          refreshTimer?.cancel();
        }
      });
    }
  }

  void refreshVerification() async {
    final prefs = await SharedPreferences.getInstance();
    var dio = Dio(BaseOptions(
        responseType: ResponseType.plain,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        }));
    dio.interceptors.add(CookieManager(CookieJar()));
    var email = prefs.getString("email");
    var password = prefs.getString("password");
    var loginResponse = await dio.post("https://fourtour.site/melinda/login/",
        data: FormData.fromMap({
          'email': email,
          'password': password,
        }));
    var id_minyak = prefs.getInt('id_minyak');
    var name = prefs.getString('name');
    var verifikasi = await dio.get(
        "https://fourtour.site/melinda/minyak/?status=Terverifikasi&id=$id_minyak");
    var verifikasiJson = jsonDecode(verifikasi.data);
    var waiting = WaitingInput.fromJson(verifikasiJson);

    try {
      if (waiting.results!.length == 1) {
        isSuccess = true;
        var volume = waiting.results!.first.volume;
        print("Berhasil");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MenungguSuccess(name: name!, poin: volume!);
        }));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: BackButton(color: Colors.grey),
          backgroundColor: Colors.white,
          title: Text(
            "Scan QR",
            style: TextStyle(color: PRIMARY_COLOR),
          )),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: -50,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            ),
            Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Wait ya... kami sedang menghitung minyak anda...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: PRIMARY_COLOR, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
