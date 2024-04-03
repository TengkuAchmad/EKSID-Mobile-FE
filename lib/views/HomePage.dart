// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:melinda/API/produk.dart';
import 'package:melinda/views/history.dart';
import 'package:melinda/views/menu/pdam/pdamInput.dart';
import 'package:melinda/views/menu/telkom/telkomInput.dart';
import 'package:melinda/views/menu/tvkabel/tvKabelMenu.dart';
import 'package:melinda/views/menu/emoney/emoney.dart';
import 'package:melinda/views/menu/listrik/listrik.dart';
import 'package:melinda/views/menu/pulsa/pulsa.dart';
import 'package:melinda/views/menu/paket/paket.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Menu.dart';
import '../model/ProdukModel.dart';
import 'Profile.dart';

// Color PRIMARY_COLOR = Color.fromARGB(255, 149, 214, 10);
Color PRIMARY_COLOR = Color(0xFF0096D5);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "";
  String phone = "";
  int poin = 0;
  int volume = 0;
  List<Results> produk = [];
  String url = "https://fourtour.site/melinda/produk/0";
  @override
  void initState() {
    super.initState();
    Produk().getProduk(url).then((value) {
      produk.addAll(value!);
      setState(() {});
    });
    getUser();
  }

  void getUser() async {
    final prefs = await SharedPreferences.getInstance();
    this.name = prefs.getString("name")!;
    this.phone = prefs.getString('phone')!;
    try {
      this.poin = prefs.getInt('poin')!;
      this.volume = prefs.getInt('volume')!;
    } catch (e) {
      this.poin = 0;
      this.volume = 0;
    }
  }

  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PRIMARY_COLOR,
        child: Stack(
          children: [
            Positioned(
                top: -200,
                right: -200,
                child: Image(
                    image: AssetImage("assets/images/rounded_inagri.png"))),
            ListView(
              children: <Widget>[
                //AppBar
                Container(
                  margin: EdgeInsets.only(
                      top: height(context) * 0.03, left: width(context) * 0.05),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ProfilePage();
                          }));
                        },
                        child: Image(
                          image: AssetImage("assets/images/user.png"),
                          height: 36,
                          width: 36,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Selamat Datang, $name",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            Text(
                              phone,
                              style:
                                  TextStyle(fontSize: 8, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  width: width(context),
                  height: 150,
                  child: CarouselSlider(
                    items: imgList,
                    options: CarouselOptions(
                      aspectRatio: 1,
                      viewportFraction: 0.9,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                  ),
                ),
                SizedBox(
                  width: width(context),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.white),
                    //Bagian putih
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //REWARD
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Flexible(
                                  child: Card(
                                    elevation: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Container(
                                        margin: EdgeInsets.all(14),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Image(
                                                  image: AssetImage(
                                                      "assets/icons/ic_point.png"),
                                                  width: 14,
                                                ),
                                                Text(
                                                  "Reward eksid",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: PRIMARY_COLOR),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "$poin Poin",
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Card(
                                    elevation: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      width: width(context) * 0.45,
                                      child: Container(
                                        margin: EdgeInsets.all(14),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Image(
                                                  image: AssetImage(
                                                      "assets/icons/ic_kontribusi.png"),
                                                  width: 14,
                                                ),
                                                Text(
                                                  "Kontribusi eksid",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: PRIMARY_COLOR),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "$volume Liter",
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Petunjuk tukar poin
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            width: width(context),
                            child: Card(
                              elevation: 2,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 14),
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          // Image(
                                          //   image: AssetImage(
                                          //       "assets/icons/Tukar.png"),
                                          // ),
                                          Icon(
                                            Icons.swap_horiz,
                                            color: PRIMARY_COLOR,
                                          ),
                                          Text("Petunjuk tukar poin")
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return History();
                                              }));
                                            },
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/icons/ic_riwayat.png"),
                                              width: 20,
                                            ),
                                          ),
                                          Text("History")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: width(context),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  constraints: BoxConstraints(maxWidth: 400),
                                  height: 80,
                                  width: width(context),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      cardMenu("assets/icons/ic_semua_menu.png",
                                          "Semua menu", Menu()),
                                      cardMenu("assets/icons/ic_pulsa.png",
                                          "Pulsa", Pulsa()),
                                      cardMenu("assets/icons/ic_paket_data.png",
                                          "Paket Data", Paket()),
                                      cardMenu("assets/icons/ic_listrik.png",
                                          "Listrik", Listrik()),
                                    ],
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(maxWidth: 400),
                                  width: width(context),
                                  height: 80,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      cardMenu("assets/icons/ic_e_money.png",
                                          "E-money", EMoney()),
                                      cardMenu("assets/icons/ic_tv_kabel.png",
                                          "TV Kabel", TvKabelMenu()),
                                      cardMenu("assets/icons/ic_telkom.png",
                                          "Telkom", TelkomInput()),
                                      cardMenu("assets/icons/ic_pdam.png",
                                          "PDAM", PDAMInput()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Rekomendasi pilihan
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              "Rekomendasi pilihan",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                              height: height(context) * 0.33,
                              width: width(context),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: produk.length,
                                  itemBuilder: ((context, index) {
                                    return Container(
                                      height: 500,
                                      width: 100,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child: Image(
                                              image: NetworkImage(
                                                  "https://fourtour.site/melinda${produk[index].gambar!}"),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          Text(
                                            produk[index].kategori!,
                                            style: TextStyle(
                                                color: PRIMARY_COLOR,
                                                fontSize: 10),
                                          ),
                                          FittedBox(
                                            child: Text(
                                              produk[index].nama!,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          Text(
                                            "${produk[index].harga} Poin",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(3),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: PRIMARY_COLOR
                                                    .withOpacity(0.15)),
                                            child: Text(
                                              "Ditukar ${produk[index].penukar} kali",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: PRIMARY_COLOR),
                                            ),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                DialogPenukaran(context, index);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      PRIMARY_COLOR),
                                              child: Text("Tukar poin"))
                                        ],
                                      ),
                                    );
                                  }))),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              "Artikel",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            height: 160,
                            width: width(context),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image(
                                        image: AssetImage(
                                            "assets/images/artikel_sedekah.png")),
                                    Text(
                                      "Rabu, 18 Januari 2023",
                                      style: TextStyle(
                                          fontSize: 10, color: PRIMARY_COLOR),
                                    ),
                                    Text(
                                      "Sedekah Minyak Jelantah",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Image(
                                          image: AssetImage(
                                              "assets/images/artikel_biodiesel.png")),
                                      Text(
                                        "Senin, 16 Januari 2023",
                                        style: TextStyle(
                                            fontSize: 10, color: PRIMARY_COLOR),
                                      ),
                                      Text(
                                        "Peluang Minyak Jelantah",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image(
                                        image: AssetImage(
                                            "assets/images/artikel_sabun.png")),
                                    Text(
                                      "Selasa, 10 Januari 2023",
                                      style: TextStyle(
                                          fontSize: 10, color: PRIMARY_COLOR),
                                    ),
                                    Text(
                                      "Cara Membuat Sabun Jelantah",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> DialogPenukaran(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: height(context) / 5.0,
              margin: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      AutoSizeText(
                        "Apakah kamu yakin menukarkan",
                        style: TextStyle(
                          color: Color.fromARGB(255, 31, 31, 31),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: AutoSizeText(
                          "${produk[index].harga} Poin",
                          style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      ),
                      AutoSizeText(
                        "Untuk ${produk[index].nama}?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 31, 31, 31),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width(context) / 4.0,
                        padding: EdgeInsets.only(
                          right: 5.0,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PRIMARY_COLOR,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: AutoSizeText(
                            "Batalkan",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: width(context) / 4.0,
                        padding: EdgeInsets.only(
                          left: 5.0,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              width: 1.5,
                              color: PRIMARY_COLOR,
                            ),
                          ),
                          onPressed: () {
                            Produk().penukaran(context, produk[index].sId!, 1,
                                produk[index].harga!);
                          },
                          child: AutoSizeText(
                            "Ya",
                            style: TextStyle(
                              color: PRIMARY_COLOR,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  GestureDetector cardMenu(String gambar, String text, Widget widget) {
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

  final List<Widget> imgList = [
    ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset("assets/images/banner_1.png")),
    ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset("assets/images/banner_2.png"))
  ];
}
