// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:melinda/views/menu/tvkabel/tvKabelInput.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class TvKabelMenu extends StatelessWidget {
  const TvKabelMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.grey,
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text(
          "Pilih Operator",
          style: TextStyle(color: PRIMARY_COLOR),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
              return TvKabel();
            }))),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Image.asset("assets/icons/indovision.png"),
                  Text(
                    "INDOVISION, TOPTY, OKEVISION",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          Divider(color: Colors.black),
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Image.asset("assets/icons/transvision.png"),
                  Text(
                    "TRANSVISION, TELKOMVISION, YESTV",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
