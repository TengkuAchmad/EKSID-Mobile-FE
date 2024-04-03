import 'package:flutter/material.dart';
import 'package:melinda/views/InputBersamaPetugas.dart';
import 'package:melinda/views/MenungguInputMinyak.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:melinda/main.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class ScanFailed extends StatefulWidget {
  @override
  State<ScanFailed> createState() => _ScanFailedState();
}

class _ScanFailedState extends State<ScanFailed> {
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
                    "assets/images/img_gagal.png",
                    width: 200,
                  ),
                  Text(
                    "Oops... id tersebut tidak terdaftar",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: PRIMARY_COLOR),
                  ),
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
                              Navigator.pop(context);
                            },
                            child: const Text("Coba kembali"),
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
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return MainPage();
                              }));
                            },
                            child: const Text("Batal"),
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
