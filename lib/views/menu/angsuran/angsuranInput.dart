// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:melinda/views/menu/angsuran/angsuran.dart';
import 'package:melinda/views/menu/angsuran/angsuranTagihan.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class AngsuranInput extends StatefulWidget {
  String image = "";
  String text = "";
  AngsuranInput({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  State<AngsuranInput> createState() => _AngsuranInputState();
}

class _AngsuranInputState extends State<AngsuranInput> {
  var noTelp = TextEditingController();
  bool isVisible = false;
  late String image = "";
  late String text = "";

  @override
  void initState() {
    super.initState();
    image = widget.image;
    text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.grey),
        centerTitle: true,
        title: Text(
          "Pilih Penyedia Pinjaman",
          style: TextStyle(color: PRIMARY_COLOR),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Angsuran();
                  }));
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Image.asset(image),
                          Text(
                            text,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text("No. Pelanggan")),
                    Container(
                      height: 30,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: noTelp,
                        cursorColor: PRIMARY_COLOR,
                        style: TextStyle(color: PRIMARY_COLOR, fontSize: 12),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          hintText: "Masukkan no pelanggan",
                          hintStyle: TextStyle(color: PRIMARY_COLOR),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: PRIMARY_COLOR),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: PRIMARY_COLOR),
                          ),
                        ),
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
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AngsuranTagihan(
                          text: text,
                          noTelp: noTelp.text,
                        );
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
