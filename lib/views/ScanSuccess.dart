import 'package:flutter/material.dart';
import 'package:melinda/views/InputBersamaPetugas.dart';
import 'package:melinda/views/MenungguInputMinyak.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class ScanSuccess extends StatefulWidget {
  String lokasi;
  ScanSuccess({required this.lokasi});

  @override
  State<ScanSuccess> createState() => _ScanSuccessState();
}

class _ScanSuccessState extends State<ScanSuccess> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: BackButton(color: Colors.grey),
          backgroundColor: Colors.white,
          title: Text(
            "Scan QR",
            style: TextStyle(color: PRIMARY_COLOR),
          )),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: -50,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/img_success.png",
                    width: 200,
                  ),
                  Text(
                    "Selamat. Anda berhasil terhubung",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: PRIMARY_COLOR),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Lokasi: ${widget.lokasi}",
                        style: TextStyle(color: PRIMARY_COLOR),
                      )),
                ],
              ),
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: PRIMARY_COLOR,
                              padding: const EdgeInsets.all(15),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return InputPetugas(
                                  name: "Hasnat",
                                  poin: 15,
                                );
                              }));
                            },
                            child:
                                const Text("Saya menghitung bersama petugas"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: PRIMARY_COLOR,
                              padding: const EdgeInsets.all(15),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MenungguInputan(
                                  name: "Hasnat",
                                  poin: 15,
                                );
                              }));
                            },
                            child: const Text("Saya menggunakan mesin"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
