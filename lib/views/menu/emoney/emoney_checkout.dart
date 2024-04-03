import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:melinda/views/Colors.dart';
import 'package:melinda/views/PPOBSuccess.dart';

Color PRIMARY_COLOR = Warna().PRIMARY_COLOR;

class EmoneyCheckout extends StatefulWidget {
  String noTelepon, ewallet, nominal;
  EmoneyCheckout(
      {Key? key,
      required this.noTelepon,
      required this.ewallet,
      required this.nominal})
      : super(key: key);

  @override
  State<EmoneyCheckout> createState() => _EmoneyCheckoutState();
}

class _EmoneyCheckoutState extends State<EmoneyCheckout> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: true,
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
          'Checkout',
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
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
                        "Nomor Telepon",
                        style: TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      AutoSizeText(
                        widget.noTelepon,
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
                        "E-Wallet",
                        style: TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      AutoSizeText(
                        widget.ewallet,
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
                        "Harga",
                        style: TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      AutoSizeText(
                        "Rp ${widget.nominal}",
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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.wallet_outlined,
                            color: PRIMARY_COLOR,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                            ),
                            child: AutoSizeText(
                              "Metode Pembayaran",
                              style: TextStyle(
                                color: Color.fromARGB(125, 0, 0, 0),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        FontAwesomeIcons.chevronRight,
                        size: 18,
                        color: Color.fromARGB(150, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/icons/ic_point.png",
                            scale: 1,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                            ),
                            child: AutoSizeText(
                              "Poin 100.000",
                              style: TextStyle(
                                color: Color.fromARGB(125, 0, 0, 0),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: _switchValue ? PRIMARY_COLOR : PRIMARY_COLOR,
                        ),
                        child: CupertinoSwitch(
                          value: _switchValue,
                          activeColor: PRIMARY_COLOR,
                          trackColor: CupertinoColors.white,
                          thumbColor: PRIMARY_COLOR,
                          onChanged: (v) => setState(() {
                            _switchValue = v;
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: AutoSizeText(
                    "Rincian Pembayaran",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
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
                        "Rp 37.000",
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
                        "Promo",
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        "Melinda Poin",
                        style: TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      AutoSizeText(
                        "- Rp 0",
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
                        "Total Bayar",
                        style: TextStyle(
                          color: Color.fromARGB(125, 0, 0, 0),
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      AutoSizeText(
                        "Rp 37.000",
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
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return PPOBSuccess(
                  name: "Farhan", poin: 15, PPOB: widget.ewallet);
            }));
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
