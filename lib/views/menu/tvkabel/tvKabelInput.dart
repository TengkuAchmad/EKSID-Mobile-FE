// ignore_for_file: , file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:melinda/views/menu/tvkabel/tvKabelTagihan.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class TvKabel extends StatefulWidget {
  const TvKabel({super.key});

  @override
  State<TvKabel> createState() => TvKabelState();
}

class TvKabelState extends State<TvKabel> {
  double width(BuildContext context) => MediaQuery.of(context).size.width;
  var no = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
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
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                color: Colors.white,
                width: width(context),
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Image.asset("assets/icons/indovision.png"),
                    const Text(
                      "INDOVISION, TOPTY, OKEVISION",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Text(
                        "No. Pelanggan",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: 30,
                      child: TextField(
                        controller: no,
                        cursorColor: PRIMARY_COLOR,
                        style: TextStyle(color: PRIMARY_COLOR, fontSize: 12),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            hintText: "Masukkan No. Pelanggan",
                            hintStyle: TextStyle(color: PRIMARY_COLOR),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(color: PRIMARY_COLOR)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: PRIMARY_COLOR),
                              borderRadius: BorderRadius.circular(4),
                            )),
                        onChanged: (value) {
                          setState(() {
                            if (value != "") {
                              isVisible = true;
                            } else {
                              isVisible = false;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
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
                      padding: const EdgeInsets.all(20),
                    ),
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const TvKabelTagihan();
                    }))),
                    child: const Text("Lihat Tagihan"),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
