import 'package:flutter/material.dart';
import 'package:melinda/views/menu/angsuran/angsuranInput.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class Angsuran extends StatefulWidget {
  const Angsuran({super.key});

  @override
  State<Angsuran> createState() => _AngsuranState();
}

class _AngsuranState extends State<Angsuran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.grey),
        centerTitle: true,
        title: Text(
          "Pilih Penyedia Pinjaman",
          style: TextStyle(color: PRIMARY_COLOR),
        ),
      ),
      body: ListView(
        children: <Widget>[
          cardPinjaman("assets/icons/ic_maf.png", "MEGA AUTO FINANCE"),
          Divider(
            color: Colors.black,
          ),
          cardPinjaman("assets/icons/ic_mcf.png", "MEGA CENTRAL FINANCE"),
          Divider(
            color: Colors.black,
          ),
          cardPinjaman("assets/icons/ic_mf.png", "MEGA FINANCE"),
        ],
      ),
    );
  }

  GestureDetector cardPinjaman(String image, String text) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AngsuranInput(
            image: image,
            text: text,
          );
        }));
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(image),
            Text(
              text,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
