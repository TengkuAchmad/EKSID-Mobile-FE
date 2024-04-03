import 'package:flutter/material.dart';
import 'package:melinda/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class PPOBSuccess extends StatefulWidget {
  String name;
  int poin;
  String PPOB;
  PPOBSuccess({required this.name, required this.poin, required this.PPOB});

  @override
  State<PPOBSuccess> createState() => _PPOBSuccessState();
}

class _PPOBSuccessState extends State<PPOBSuccess> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
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
                    "Halo ${widget.name}\nSelamat transaksi anda berhasil",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: PRIMARY_COLOR),
                  ),
                  Text(
                    "Rp ${widget.poin}.000",
                    style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                  Text(
                    "Tagihan ${widget.PPOB}",
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
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
                          child: const Text("Kembali ke Beranda"),
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
