// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:melinda/views/menu/pdam/pdamWilayah.dart';
import 'package:melinda/views/menu/pdam/pdamTagihan.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class PDAMInput extends StatefulWidget {
  const PDAMInput({super.key});

  @override
  State<PDAMInput> createState() => _PDAMInputState();
}

class _PDAMInputState extends State<PDAMInput> {
  TextEditingController no = TextEditingController();
  bool isVisible = false;
  String pdam = const PDAMWilayah().getPDAM();
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
          "PDAM",
          style: TextStyle(color: PRIMARY_COLOR),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromRGBO(245, 245, 245, 1.0),
        child: Stack(
          children: [
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const PDAMWilayah();
                    })));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          pdam,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          "No. Pelanggan",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: no,
                          maxLength: 16,
                          onChanged: (value) {
                            setState(() {
                              if (no.text.length >= 10 &&
                                  pdam != "Pilih wilayah PDAM") {
                                isVisible = true;
                              } else {
                                isVisible = false;
                              }
                            });
                          },
                          cursorColor: PRIMARY_COLOR,
                          style: TextStyle(color: PRIMARY_COLOR, fontSize: 12),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              hintText: "Masukkan No. Pelanggan",
                              hintStyle: TextStyle(color: PRIMARY_COLOR),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: PRIMARY_COLOR),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: PRIMARY_COLOR))),
                        ),
                      ),
                    ],
                  ),
                ),
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
                          return const PDAMTagihan();
                        }));
                      },
                      child: const Text("Lihat Tagihan"),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
