// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:melinda/views/LoginPage.dart';
import 'RegisterPage.dart';

class RegisterSuccess extends StatefulWidget {
  String user;
  RegisterSuccess({required this.user});

  @override
  State<RegisterSuccess> createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
  Color PRIMARY_COLOR = Color(0xFF0096D5);
  Color SECONDARY_COLOR = Color(0xFFF8FFE9);
  Color TEXT_50 = Colors.black.withOpacity(0.4);
  Color TEXT_40 = Colors.black.withOpacity(0.4);
  Color TEXT_30 = Colors.black.withOpacity(0.3);
  Color TEXT_FOOTER = Color(0xFFAAAAAA);

  String user = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: PRIMARY_COLOR,
        child: Center(
            child: Hero(
          tag: 'container',
          child: Card(
              color: Color(0xffF8FFE9),
              child: Container(
                constraints: BoxConstraints(maxWidth: 300),
                padding: const EdgeInsets.all(18),
                height: 400,
                width: width * 0.7,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        'Selamat',
                        style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30, bottom: 1),
                      child: FittedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  'Hi $user',
                                  style: TextStyle(
                                      color: PRIMARY_COLOR,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: Text(
                                  ', akun kamu berhasil terdaftar',
                                  style:
                                      TextStyle(color: TEXT_50, fontSize: 14),
                                ),
                              )
                            ]),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Terima kasih sudah mendaftar, Silahkan pilih',
                            style: TextStyle(color: TEXT_40, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        'opsi berikut untuk langkah selanjutnya',
                        style: TextStyle(color: TEXT_40, fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  PRIMARY_COLOR)),
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: ((context) {
                              return LoginPage();
                            })));
                          },
                          child: SizedBox(
                            width: width * 0.7,
                            child: Center(
                              child: Text(
                                'Login Sekarang',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                            width: 1,
                            color: PRIMARY_COLOR,
                            style: BorderStyle.solid,
                          )),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return const RegisterPage();
                              }),
                            );
                          },
                          child: Container(
                            width: width * 0.65,
                            child: Center(
                              child: Text(
                                'Nanti Saja',
                                style: TextStyle(
                                    color: PRIMARY_COLOR, fontSize: 14),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              )),
        )),
      ),
    );
  }
}
