// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:melinda/main.dart';
import 'package:melinda/views/PPOBSuccess.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class TvKabelTagihan extends StatelessWidget {
  const TvKabelTagihan({super.key});

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
          "Detail Tagihan",
          style: TextStyle(color: PRIMARY_COLOR),
        ),
        centerTitle: true,
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
                    const Text("Penyedia TV Kabel"),
                    const Text(
                      "1122334455",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Nomor Pelanggan"),
                    const Text(
                      "1234567890",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Nama Pelanggan"),
                    const Text("N / A",
                        style: TextStyle(fontWeight: FontWeight.w700))
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
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return PPOBSuccess(
                          name: "Farhan", poin: 15, PPOB: "tv kabel");
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
