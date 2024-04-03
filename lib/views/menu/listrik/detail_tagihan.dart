import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:melinda/views/Colors.dart';
import 'package:melinda/views/PPOBSuccess.dart';

Color PRIMARY_COLOR = Warna().PRIMARY_COLOR;

class DetailTagihan extends StatefulWidget {
  String noMeter;
  DetailTagihan({Key? key, required this.noMeter}) : super(key: key);

  @override
  State<DetailTagihan> createState() => _DetailTagihanState();
}

class _DetailTagihanState extends State<DetailTagihan> {
  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
            color: Color.fromARGB(255, 210, 210, 210),
          ),
        ),
        title: Text(
          'Detail Tagihan',
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        "No. Meter / No. Pelanggan",
                        style: TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      AutoSizeText(
                        widget.noMeter,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        "Nama Pelanggan",
                        style: TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      AutoSizeText(
                        "N/A",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        "Periode Tagihan",
                        style: TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      AutoSizeText(
                        "N/A",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        "Biaya Admin",
                        style: TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      AutoSizeText(
                        "Rp 0",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(125, 0, 0, 0),
                  thickness: 1.5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        "Total Tagihan",
                        style: TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      AutoSizeText(
                        "Rp 0",
                        style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return PPOBSuccess(name: "Farhan", poin: 15, PPOB: "listrik");
              },
            ));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: PRIMARY_COLOR,
          ),
          child: const AutoSizeText(
            "Bayar",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
