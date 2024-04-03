// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:melinda/views/menu/bpjs/bpjs_tagihan.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class BPJS extends StatefulWidget {
  const BPJS({super.key});

  @override
  State<BPJS> createState() => _BPJSState();
}

class _BPJSState extends State<BPJS> {
  TextEditingController input = TextEditingController();
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
          "BPJS",
          style: TextStyle(color: PRIMARY_COLOR),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "No.VA\nKeluarga",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )),
                Container(
                  height: 30,
                  child: TextField(
                    controller: input,
                    cursorColor: PRIMARY_COLOR,
                    style: TextStyle(color: PRIMARY_COLOR),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: PRIMARY_COLOR)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: PRIMARY_COLOR))),
                    onChanged: (value) {
                      setState(() {
                        if (input.text != "" || input.text.isNotEmpty) {
                          print(value.length);
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
                        return BPJSTagihan(no: input.text,);
                      }));
                    },
                    child: const Text("Lihat Tagihan"),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
