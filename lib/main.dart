// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, body_might_complete_normally_nullable, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:melinda/API/mesin.dart';
import 'package:melinda/API/minyak.dart';
import 'package:melinda/API/permission.dart';
import 'package:melinda/model/MesinModel.dart';
import 'package:melinda/views/ScanFailed.dart';
import 'package:melinda/views/ScanSuccess.dart';
import 'views/HomePage.dart';
import 'views/katalog.dart';
import 'package:melinda/views/SplashScreen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// Color PRIMARY_COLOR = Color.fromARGB(255, 149, 214, 10);
Color PRIMARY_COLOR = Color(0xFF0096D5);

void main() {
  runApp(Splash());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  Widget? buildBody() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return Katalog();
    }
  }

  @override
  void initState() {
    super.initState();
    Permissions().checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return QRViewExample();
              },
            ));
          },
          child: Image(image: AssetImage("assets/icons/ic_scan.png"))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 16,
          currentIndex: currentIndex,
          onTap: (int index) {
            currentIndex = index;
            setState(() {});
          },
          selectedItemColor: PRIMARY_COLOR,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Katalog"),
          ]),
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  List<Results> mesin = [];
  String lokasi = "";
  var id_mesin = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Mesin().getMesin().then((value) {
      mesin.addAll(value!);
    });
  }

  void checkMesin() {
    for (int x = 0; x < mesin.length; x++) {
      if (mesin[x].sId == id_mesin.text) {
        lokasi = mesin[x].lokasi!;
        Minyak().setor();
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return ScanSuccess(lokasi: lokasi);
          },
        ));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ScanFailed();
        }));
      }
    }
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Scan QR",
            style: TextStyle(color: PRIMARY_COLOR),
          ),
          centerTitle: true,
          leading: BackButton(
            color: Colors.grey,
          )),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: PRIMARY_COLOR),
                    onPressed: () {
                      DialogIDMesin(context);
                    },
                    child: Text("Masukkan ID Mesin")),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> DialogIDMesin(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Text(
              "Masukkan ID Mesin",
              style: TextStyle(color: PRIMARY_COLOR),
            )),
            content: Container(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Masukkan id mesin yang berada di bawah barcode",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID mesin"),
                        Container(
                          height: 30,
                          child: TextField(
                            controller: id_mesin,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: PRIMARY_COLOR)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: PRIMARY_COLOR))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          onPressed: () {
                            checkMesin();
                          },
                          child: Text("Masukkan")),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    var isScanned = 0;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        isScanned++;
      });
      if (isScanned == 1) {
        Minyak().setor();
        Mesin().updateMesin(id_mesin.text);
        // ScanQR().MyScanner(result!.code);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return ScanSuccess(
            lokasi: lokasi,
          );
        }));
      } else {}
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
