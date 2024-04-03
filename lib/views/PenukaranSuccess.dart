import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class PenukaranSuccess extends StatefulWidget {
  String name;
  int poin;
  PenukaranSuccess({required this.name, required this.poin});

  @override
  State<PenukaranSuccess> createState() => _PenukaranSuccessState();
}

class _PenukaranSuccessState extends State<PenukaranSuccess> {
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
                    "Halo ${widget.name}\nPenukaran senilai",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: PRIMARY_COLOR),
                  ),
                  Text(
                    "${widget.poin} Poin",
                    style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                  Text(
                    "Berhasil!",
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
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Silahkan datang ke kantor desa terdekat untuk pengambilan barang",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: PRIMARY_COLOR),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PRIMARY_COLOR,
                            padding: const EdgeInsets.all(15),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
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
