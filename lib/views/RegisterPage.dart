// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:melinda/API/auth.dart';
import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var dio = Dio();
  Color PRIMARY_COLOR = Color(0xFF0096D5);
  Color SECONDARY_COLOR = Color(0xFFF8FFE9);
  Color TEXT_50 = Colors.black.withOpacity(0.4);
  Color TEXT_30 = Colors.black.withOpacity(0.3);
  Color TEXT_FOOTER = Color(0xFFAAAAAA);

  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passwordTEC = TextEditingController();
  TextEditingController _namaTEC = TextEditingController();
  TextEditingController _phoneTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Center(
          child: Hero(
            tag: 'container',
            child: Card(
                elevation: 5,
                shadowColor: Colors.black12,
                color: Colors.white,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300),
                  padding: const EdgeInsets.all(18),
                  height: height * 0.6,
                  width: width * 0.7,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Center(
                              child: Text(
                            'Daftar',
                            style: TextStyle(
                                fontSize: 24,
                                color: PRIMARY_COLOR,
                                fontWeight: FontWeight.w500),
                          )),
                          Container(
                            margin: EdgeInsets.only(top: 24),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Lengkapi data berikut',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: TEXT_50,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            height: 30,
                            child: TextField(
                              style: const TextStyle(fontSize: 12),
                              controller: _namaTEC,
                              cursorColor: PRIMARY_COLOR,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: PRIMARY_COLOR)),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  hintText: 'Nama',
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: TEXT_30,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            height: 30,
                            child: TextField(
                              style: TextStyle(fontSize: 12),
                              controller: _phoneTEC,
                              cursorColor: PRIMARY_COLOR,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: PRIMARY_COLOR)),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  hintText: '0812-3456-7891',
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: TEXT_30,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            height: 30,
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                  colorScheme: ThemeData()
                                      .colorScheme
                                      .copyWith(primary: PRIMARY_COLOR)),
                              child: TextField(
                                style: TextStyle(fontSize: 12),
                                controller: _emailTEC,
                                cursorColor: PRIMARY_COLOR,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.alternate_email,
                                    size: 12,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: PRIMARY_COLOR)),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  hintText: 'User@gmail.com',
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: TEXT_30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            height: 30,
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                  colorScheme: ThemeData()
                                      .colorScheme
                                      .copyWith(primary: PRIMARY_COLOR)),
                              child: TextField(
                                cursorColor: PRIMARY_COLOR,
                                style: TextStyle(fontSize: 12),
                                obscureText: true,
                                controller: _passwordTEC,
                                decoration: InputDecoration(
                                    focusColor: PRIMARY_COLOR,
                                    suffixIcon: Icon(
                                      Icons.remove_red_eye_sharp,
                                      size: 12,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide:
                                            BorderSide(color: PRIMARY_COLOR)),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        color: TEXT_30,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              children: [
                                Text(
                                  'Sudah punya',
                                  style:
                                      TextStyle(color: TEXT_50, fontSize: 10),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: ((context) {
                                      return LoginPage();
                                    })));
                                  },
                                  child: Text(
                                    ' akun?',
                                    style: TextStyle(
                                        color: PRIMARY_COLOR,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              width: width * 0.8,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: PRIMARY_COLOR),
                                child: Text(
                                  'Daftar',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  var email = _emailTEC.text;
                                  var password = _passwordTEC.text;
                                  var nama = _namaTEC.text;
                                  var phone = _phoneTEC.text;

                                  Auth().register(
                                      context, email, password, nama, phone);
                                },
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            child: Text(
                              'Dengan Mendaftar, saya menyetujui',
                              style:
                                  TextStyle(color: TEXT_FOOTER, fontSize: 10),
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Syarat dan Ketentuan',
                                  style: TextStyle(
                                      color: PRIMARY_COLOR,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                Text(
                                  ' serta',
                                  style: TextStyle(
                                      color: TEXT_FOOTER, fontSize: 12),
                                ),
                                Text(
                                  ' Kebijakan Privasi.',
                                  style: TextStyle(
                                      color: PRIMARY_COLOR,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
        ));
  }
}
