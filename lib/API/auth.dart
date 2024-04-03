// ignore_for_file: use_build_context_synchronously, avoid_print, unused_local_variable, prefer_const_constructors
import 'dart:convert';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:melinda/API/user.dart';
import 'package:melinda/views/LoginPage.dart';
import 'package:melinda/views/RegisterSuccess.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:melinda/main.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

class Auth {
  void LogIn(BuildContext context, String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
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
      var loginData = jsonDecode(loginResponse.data);
      var jwt = loginData['jwt'];
      await prefs.setString('jwt', jwt);
      var response = await dio.get("https://fourtour.site/melinda/user/");
      var jsonDecoded = jsonDecode(response.data);
      await prefs.setString('id', jsonDecoded['_id']);
      await prefs.setString('name', jsonDecoded['name']);
      await prefs.setString('phone', jsonDecoded['phone']);
      await prefs.setString('email', jsonDecoded['email']);
      await prefs.setString('password', password);
      var poinResponse = await dio.get("https://fourtour.site/melinda/poin/");
      var jsonPoin = jsonDecode(poinResponse.data);
      if (jsonPoin['poin'] == null && jsonPoin['volume'] == null) {
        jsonPoin['poin'] = 0;
        jsonPoin['volume'] = 0;
      }
      await prefs.setInt("poin", jsonPoin['poin']);
      await prefs.setInt("volume", jsonPoin['volume']);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const MainPage();
          },
        ),
      );
      print(prefs.getString('name'));
      print(prefs.getString('email'));
    } catch (e) {
      if (email == "" || email.isEmpty || password == "" || password.isEmpty) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.red,
                content: Text(
                  "Masukkan email atau password",
                  style: TextStyle(color: Colors.white),
                ),
              );
            });
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.red,
              title: Text(
                "Email atau password salah",
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        );
      }
      print(e);
    }
  }

  void logout(BuildContext context) async {
    var dio = Dio();
    var prefs = await SharedPreferences.getInstance();
    // Response response = await dio.post("https://fourtour.site/melinda/logout/");
    // print(prefs.getString('jwt'));
    prefs.clear();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }

  void register(BuildContext context, String email, String password,
      String name, String phone) async {
    try {
      var dio = Dio();
      Response response = await dio
          .post('https://fourtour.site/melinda/register/', data: {
        "email": email,
        "password": password,
        'name': name,
        'phone': phone
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return RegisterSuccess(
            user: name,
          );
        }),
      );
      print('done');
    } catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Text(
              "Username atau email sudah ada",
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      );
    }
  }
}
