// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:melinda/main.dart';
import 'package:melinda/views/LoginPage.dart';
import 'package:melinda/views/Colors.dart';

Color PRIMARY_COLOR = Warna().PRIMARY_COLOR;

class User {
  void changePassword(
      BuildContext context, String oPassword, String newPassword) async {
    final prefs = await SharedPreferences.getInstance();
    var emailUser = prefs.getString('email');
    var passwordUser = prefs.getString('password');
    var dio = Dio(BaseOptions(
        responseType: ResponseType.plain,
        followRedirects: false,
        validateStatus: (status) {
          return true;
        }));
    dio.interceptors.add(CookieManager(CookieJar()));
    var loginResponse = await dio.post("https://fourtour.site/melinda/login/",
        data: FormData.fromMap({
          'email': emailUser,
          'password': passwordUser,
        }));
    var loginData = jsonDecode(loginResponse.data);
    var response = await dio.put("https://fourtour.site/melinda/users/uppass",
        data: FormData.fromMap(
            {"old_password": oPassword, "new_password": newPassword}));
    print(response.statusCode);
    print(response.statusMessage);
    print(response.data);
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: PRIMARY_COLOR,
              title: Center(
                child: Text(
                  "Silahkan login kembali",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          });
      Timer(Duration(seconds: 2), () {
        prefs.clear();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      });
    }
  }

  void changeUser(
      BuildContext context, String phone, String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    var emailUser = prefs.getString('email');
    print(emailUser);
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
          'email': emailUser,
          'password': password,
        }));
    var loginData = jsonDecode(loginResponse.data);
    await prefs.setString('email', email);
    prefs.setString('phone', phone);
    try {
      var user = await dio.put("https://fourtour.site/melinda/users/my",
          data:
              FormData.fromMap({"phone": phone, "name": name, "email": email}));
      print(user.statusCode);
      print(user.data);
      if (user.statusCode == 200) {
        Navigator.pop(context);
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: PRIMARY_COLOR,
                title: Center(
                    child: Text(
                  "Data berhasil diubah",
                  style: TextStyle(color: Colors.white),
                )),
              );
            });
      }
    } catch (e) {
      print(e);
    }
  }

  void checkUser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('name');
    if (name == null || name.isEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Login();
      }));
    } else {
      print(name);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MainPage();
      }));
    }
  }
}
