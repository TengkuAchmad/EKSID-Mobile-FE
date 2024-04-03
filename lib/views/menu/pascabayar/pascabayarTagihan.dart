import 'package:flutter/material.dart';
import 'package:melinda/main.dart';
import 'package:melinda/views/PPOBSuccess.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class PascabayarTagihan extends StatelessWidget {
  String no;
  PascabayarTagihan({Key? key, required this.no}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.grey),
        centerTitle: true,
        title: Text(
          "Pascabayar",
          style: TextStyle(color: PRIMARY_COLOR),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nomor Telepon"),
                    Text(
                      no,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Operator"),
                    Text(
                      "TELKOMSEL",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Nama Pelanggan"),
                    Text("N / A", style: TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Periode Tagihan"),
                    Text("N / A", style: TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Biaya Admin"),
                    Text("Rp 0", style: TextStyle(fontWeight: FontWeight.w700))
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total Tagihan"),
                    Text("Rp 0",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, color: PRIMARY_COLOR))
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return PPOBSuccess(name: "Farhan",poin: 15,PPOB: "pascabayar",);
                    }));
                  },
                  child: const Text("Bayar"),
                ),
              ))
        ],
      ),
    );
  }
}
