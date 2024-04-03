// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:melinda/API/produk.dart';
import 'package:melinda/model/ProdukModel.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class Katalog extends StatefulWidget {
  const Katalog({super.key});

  @override
  State<Katalog> createState() => _KatalogState();
}

class _KatalogState extends State<Katalog> {
  // Kategori Dropdown
  final kategoriItem = ['Kategori 1', 'Kategori 2', 'Kategori 3'];
  String? valueKategori;

  // Stok Dropdown
  final stokItem = ['Stok 1', 'Stok 2', 'Stok 3'];
  String? valueStok;

  List<Results> produk = [];

  var search = TextEditingController();
  String url = "https://fourtour.site/melinda/produk/0";

  void getProduk(String query) {
    Produk().getProduk("$url?search=$query").then((value) {
      produk.clear();
      produk.addAll(value!);
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Produk().getProduk(url).then((value) {
      produk.addAll(value!);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 38,
              width: widthMedia,
              child: TextField(
                onChanged: (value) {
                  getProduk(value);
                },
                onSubmitted: (value) => getProduk(value),
                controller: search,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 217, 217, 217),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 217, 217, 217),
                      width: 1,
                    ),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 217, 217, 217),
                  ),
                  hintText: 'Cari di katalog',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 7.5),
              child: Row(
                children: [
                  Container(
                    width: widthMedia / 2.75,
                    height: heightMedia / 25.0,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 7.5),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: Color.fromARGB(255, 217, 217, 217),
                        width: 1,
                      ),
                    ),
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: AutoSizeText(
                        "Kategori",
                        style: TextStyle(
                          color: Color.fromARGB(255, 217, 217, 217),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      underline: SizedBox(),
                      items: kategoriItem
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: valueKategori,
                      onChanged: (value) {
                        setState(() {
                          valueKategori = value as String;
                        });
                      },
                    ),
                  ),
                  Container(
                    width: widthMedia / 3.5,
                    height: heightMedia / 25.0,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 7.5),
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        color: Color.fromARGB(255, 217, 217, 217),
                        width: 1,
                      ),
                    ),
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: AutoSizeText(
                        "Stok",
                        style: TextStyle(
                          color: Color.fromARGB(255, 217, 217, 217),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      underline: SizedBox(),
                      items: stokItem
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: valueStok,
                      onChanged: (value) {
                        setState(() {
                          valueStok = value as String;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Menampilkan '),
                  TextSpan(
                    text: "${produk.length}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(text: 'sembako'),
                ],
              ),
            ),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 0),
            itemCount: produk.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, i) {
              return Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: 500,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.network(
                              "https://fourtour.site/melinda${produk[i].gambar}",
                              fit: BoxFit.contain,
                              scale: 2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AutoSizeText(
                                        produk[i].kategori!,
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: PRIMARY_COLOR,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      AutoSizeText(
                                        produk[i].nama.toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              215, 151, 151, 151),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      AutoSizeText(
                                        '${produk[i].harga} Poin',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromARGB(215, 31, 31, 31),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 7.5,
                                    vertical: 2.5,
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                  decoration: BoxDecoration(
                                    color: PRIMARY_COLOR.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: AutoSizeText(
                                    "Ditukar ${produk[i].penukar} kali",
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                      color: PRIMARY_COLOR,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              child: Container(
                                                height: heightMedia / 5.0,
                                                padding: EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        AutoSizeText(
                                                          "Apakah kamu yakin menukarkan",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    31,
                                                                    31,
                                                                    31),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      10.0),
                                                          child: AutoSizeText(
                                                            "${produk[i].harga} Poin",
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      148,
                                                                      214,
                                                                      10),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 26,
                                                            ),
                                                          ),
                                                        ),
                                                        AutoSizeText(
                                                          "Untuk ${produk[i].nama}?",
                                                          style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    31,
                                                                    31,
                                                                    31),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width:
                                                              widthMedia / 4.0,
                                                          padding:
                                                              EdgeInsets.only(
                                                            right: 5.0,
                                                          ),
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  PRIMARY_COLOR,
                                                            ),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: AutoSizeText(
                                                              "Batalkan",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              widthMedia / 4.0,
                                                          padding:
                                                              EdgeInsets.only(
                                                            left: 5.0,
                                                          ),
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              side: BorderSide(
                                                                width: 1.5,
                                                                color:
                                                                    PRIMARY_COLOR,
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Produk().penukaran(
                                                                  context,
                                                                  produk[i]
                                                                      .sId!,
                                                                  1,
                                                                  produk[i]
                                                                      .harga!);
                                                            },
                                                            child: AutoSizeText(
                                                              "Ya",
                                                              style: TextStyle(
                                                                color:
                                                                    PRIMARY_COLOR,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
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
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: PRIMARY_COLOR,
                                    ),
                                    child: AutoSizeText(
                                      "Tukar Poin",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 5,
              mainAxisExtent: 264,
            ),
          ),
        ],
      ),
    );
  }

  // Build Menu Kategori
  DropdownMenuItem<String> buildMenuKategori(String kategoriItem) =>
      DropdownMenuItem(
        value: kategoriItem,
        child: AutoSizeText(
          kategoriItem,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  // Build Menu Kategori
  DropdownMenuItem<String> buildMenuStok(String stokItem) => DropdownMenuItem(
        value: stokItem,
        child: AutoSizeText(
          stokItem,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
