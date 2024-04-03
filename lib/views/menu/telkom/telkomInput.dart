// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'telkomTagihan.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class TelkomInput extends StatefulWidget {
  const TelkomInput({super.key});

  @override
  State<TelkomInput> createState() => _TelkomInputState();
}

class _TelkomInputState extends State<TelkomInput> {
  TextEditingController telp = TextEditingController();
  String selectedValue = "Pilih Tipe";
  bool isVisible = false;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        child: Text(
          "Pilih tipe",
        ),
        value: "Pilih Tipe",
      ),
      const DropdownMenuItem(
        child: Text(
          "CEK TAGIHAN INDIHOME",
        ),
        value: "CEK TAGIHAN INDIHOME",
      ),
    ];
    return menuItems;
  }

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
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text("Tipe Telkom")),
                  Container(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                      border: Border.all(width: 1, color: PRIMARY_COLOR),
                    ),
                    child: Container(
                      height: 28,
                      child: DropdownButton(
                        hint: const Text("Pilih Tipe"),
                        style: TextStyle(color: PRIMARY_COLOR, fontSize: 12),
                        focusColor: Colors.white,
                        dropdownColor: Colors.white,
                        underline: Container(color: Colors.transparent),
                        isExpanded: true,
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                            (telp.text != "" && selectedValue != "Pilih Tipe")
                              ? isVisible = true
                              : isVisible = false;
                          });
                        },
                        items: dropdownItems,
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text("No.\nPelanggan/\nTelp")),
                  Container(
                    height: 28,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: telp,
                      onChanged: (value) {
                        setState(() {
                          (value != "" && selectedValue != "Pilih Tipe")
                              ? isVisible = true
                              : isVisible = false;
                        });
                      },
                      cursorColor: PRIMARY_COLOR,
                      style: TextStyle(color: PRIMARY_COLOR, fontSize: 12),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          hintText: "Contoh: 022 xxxxxx",
                          hintStyle: TextStyle(color: PRIMARY_COLOR),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: PRIMARY_COLOR),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: PRIMARY_COLOR))),
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
                          return const TelkomTagihan();
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
