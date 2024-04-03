import 'package:flutter/material.dart';
import 'package:melinda/views/menu/bpjs/bpjs.dart';
import 'package:melinda/views/menu/emoney/emoney.dart';
import 'package:melinda/views/menu/listrik/listrik.dart';
import 'package:melinda/views/menu/paket/paket.dart';
import 'package:melinda/views/menu/pdam/pdamInput.dart';
import 'package:melinda/views/menu/pulsa/pulsa.dart';
import 'package:melinda/views/menu/telkom/telkomInput.dart';
import 'package:melinda/views/menu/tvkabel/tvKabelMenu.dart';
import 'package:melinda/views/menu/pascabayar/pascabayar.dart';
import 'package:melinda/views/menu/angsuran/angsuran.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.grey,
        ),
        centerTitle: true,
        title: Text(
          "Semua Menu",
          style: TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisSpacing: 8,
          mainAxisSpacing: 20,
          crossAxisCount: 4,
          children: <Widget>[
            cardMenu(context, "assets/icons/ic_pulsa.png", "Pulsa", Pulsa()),
            cardMenu(context, "assets/icons/ic_paket_data.png", "Paket Data",
                Paket()),
            cardMenu(
                context, "assets/icons/ic_listrik.png", "Listrik", Listrik()),
            cardMenu(
                context, "assets/icons/ic_e_money.png", "E-money", EMoney()),
            cardMenu(context, "assets/icons/ic_tv_kabel.png", "TV Kabel",
                TvKabelMenu()),
            cardMenu(
                context, "assets/icons/ic_telkom.png", "Telkom", TelkomInput()),
            cardMenu(context, "assets/icons/ic_pdam.png", "PDAM", PDAMInput()),
            cardMenu(context, "assets/icons/ic_bpjs.png", "BPJS", BPJS()),
            cardMenu(context, "assets/icons/ic_pascabayar.png", "Pascabayar",
                Pascabayar()),
            cardMenu(context, "assets/icons/ic_angsuran.png", "Angsuran",
                Angsuran()),
          ],
        ),
      ),
    );
  }
}

GestureDetector cardMenu(
    BuildContext context, String gambar, String text, Widget widget) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return widget;
      })));
    },
    child: Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ClipRRect(
        child: SizedBox(
          height: 67,
          width: 67,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                gambar,
                width: 30,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
