// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:melinda/views/menu/pascabayar/pascabayarTagihan.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class Pascabayar extends StatefulWidget {
  const Pascabayar({super.key});

  @override
  State<Pascabayar> createState() => _PascabayarState();
}

class _PascabayarState extends State<Pascabayar> {
  var noTelp = TextEditingController();
  var maskFormatter = MaskedInputFormatter("####-####-####-#");
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.grey),
        centerTitle: true,
        title: Text(
          "Pascabayar",
          style: TextStyle(color: PRIMARY_COLOR),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Nomor telepon",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  height: 30,
                  child: TextField(
                    inputFormatters: [maskFormatter],
                    controller: noTelp,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: PRIMARY_COLOR, fontSize: 12),
                    cursorColor: PRIMARY_COLOR,
                    decoration: InputDecoration(
                        hintText: "Masukkan Nomor Telepon",
                        hintStyle:
                            TextStyle(color: PRIMARY_COLOR, fontSize: 12),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: PRIMARY_COLOR)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: PRIMARY_COLOR))),
                    onChanged: (value) {
                      setState(() {
                        if (value != "" || value.isNotEmpty) {
                          isVisible = true;
                        } else {
                          isVisible = false;
                        }
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Visibility(
                visible: isVisible,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PascabayarTagihan(
                          no: noTelp.text,
                        );
                      }));
                    },
                    child: const Text("Lihat Tagihan"),
                  ),
                ),
              )),
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            top: 100,
            child: Container(
              child: Visibility(
                  visible: !isVisible,
                  child: Image.asset("assets/images/empty.png")),
            ),
          ),
        ],
      ),
    );
  }
}
