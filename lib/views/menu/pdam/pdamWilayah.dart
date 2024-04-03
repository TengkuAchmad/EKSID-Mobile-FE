// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'pdamInput.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

String pdam = "Pilih wilayah PDAM";

class PDAMWilayah extends StatefulWidget {
  const PDAMWilayah({super.key});

  String getPDAM() {
    return pdam;
  }

  @override
  State<PDAMWilayah> createState() => _PDAMWilayahState();
}

class _PDAMWilayahState extends State<PDAMWilayah> {
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
          "Pilih Wilayah",
          style: TextStyle(color: PRIMARY_COLOR),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
              child: TextField(
                // controller: no,
                onChanged: (value) {
                  setState(() {
                    // (value != "") ? isVisible = true : isVisible = false;
                  });
                },
                cursorColor: PRIMARY_COLOR,
                style: TextStyle(color: PRIMARY_COLOR, fontSize: 12),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: PRIMARY_COLOR,
                    ),
                    contentPadding: const EdgeInsets.all(5),
                    hintText: "Cari wilayah",
                    hintStyle: TextStyle(color: PRIMARY_COLOR),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: PRIMARY_COLOR),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: PRIMARY_COLOR))),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              // final prefs =
                              //     await SharedPreferences.getInstance();
                              // prefs.setString('pdam', "PDAM $index");
                              pdam = "PDAM $index";
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const PDAMInput();
                              }));
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 7.5),
                              child: Row(
                                children: [
                                  const Icon(Icons.water_drop_outlined),
                                  Container(
                                      margin: const EdgeInsets.only(left: 14),
                                      child: const Text("PDAM KOTA BANDUNG"))
                                ],
                              ),
                            ),
                          ),
                          const Divider()
                        ],
                      );
                    })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
