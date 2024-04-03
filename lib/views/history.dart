import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:melinda/API/riwayat.dart';
import 'package:melinda/model/RiwayatModel.dart';
import 'package:intl/intl.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(
        milliseconds: 500,
      ),
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: BackButton(
            color: Colors.grey,
          ),
          title: Text(
            'History',
            style: TextStyle(
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w700,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                labelColor: PRIMARY_COLOR,
                indicatorColor: PRIMARY_COLOR,
                indicatorWeight: 3.0,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Color.fromARGB(35, 0, 0, 0),
                tabs: [
                  Tab(text: 'Verifikasi'),
                  Tab(text: 'Selesai'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            VerifikasiDisplay(),
            SelesaiDisplay(),
          ],
        ),
      ),
    );
  }
}

class VerifikasiDisplay extends StatefulWidget {
  const VerifikasiDisplay({super.key});

  @override
  State<VerifikasiDisplay> createState() => _VerifikasiDisplayState();
}

class _VerifikasiDisplayState extends State<VerifikasiDisplay> {
  DateTime date = DateTime.now();

  List<Results> list = [];

  @override
  void initState() {
    super.initState();
    Riwayat().getRiwayat().then((value) {
      var limit = (value!.length == 0) ? 0 : value.length;
      for (int x = 0; x < value.length; x++) {
        if (value[x].status == "menunggu") {
          list.add(value[x]);
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: SizedBox(
                  width: widthMedia / 2.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: PRIMARY_COLOR,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );

                      // CANCEL
                      if (newDate == null) return;

                      // OK
                      setState(() {
                        date = newDate;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "${date.day}/${date.month}/${date.year}",
                          style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.solidCalendarDays,
                          color: PRIMARY_COLOR,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: widthMedia / 10,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: PRIMARY_COLOR,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                String dateString = list[index].created!;
                String dateWithoutTime = dateString.substring(0, 10);
                String image =
                    "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80";
                if (list[index].gambar != null) {
                  image = "https://fourtour.site/melinda${list[index].gambar!}";
                }
                print(list[index].gambar);
                return CardRiwayat(
                    widthMedia,
                    context,
                    heightMedia,
                    list[index].produk!,
                    list[index].biaya!,
                    list[index].status!,
                    dateWithoutTime,
                    image);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container CardRiwayat(
      double widthMedia,
      BuildContext context,
      double heightMedia,
      String produk,
      int poin,
      String status,
      String waktu,
      String image) {
    return Container(
      margin: EdgeInsets.only(left: 5, top: 5, right: 5),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: heightMedia / 7.0,
                width: double.maxFinite,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10.0,
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(8.0), // Image border
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(50), // Image radius
                                child: Image.network(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          produk,
                                          style: TextStyle(
                                            color: PRIMARY_COLOR,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                        AutoSizeText(
                                          // "Beras 1kg"
                                          "",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    AutoSizeText(
                                      "$poin Poin",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      waktu,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    AutoSizeText(
                                      status,
                                      style: TextStyle(
                                        color: PRIMARY_COLOR,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SelesaiDisplay extends StatefulWidget {
  const SelesaiDisplay({super.key});

  @override
  State<SelesaiDisplay> createState() => _SelesaiDisplayState();
}

class _SelesaiDisplayState extends State<SelesaiDisplay> {
  DateTime date = DateTime.now();

  List<Results> list = [];

  @override
  void initState() {
    super.initState();
    Riwayat().getRiwayat().then((value) {
      print(value![0].status);
      for (int x = 0; x < value.length; x++) {
        if (value[x].status == "ok") {
          list.add(value[x]);
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 15,
                ),
                child: SizedBox(
                  width: widthMedia / 2.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: PRIMARY_COLOR,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );

                      // CANCEL
                      if (newDate == null) return;

                      // OK
                      setState(() {
                        date = newDate;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "${date.day}/${date.month}/${date.year}",
                          style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          FontAwesomeIcons.solidCalendarDays,
                          color: PRIMARY_COLOR,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: widthMedia / 10,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: PRIMARY_COLOR,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                String dateString = list[index].created!;
                String dateWithoutTime = dateString.substring(0, 10);
                String image =
                    "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80";
                if (list[index].gambar != null) {
                  image = "https://fourtour.site/melinda${list[index].gambar!}";
                }
                return CardRiwayat(
                    widthMedia,
                    context,
                    heightMedia,
                    list[index].produk!,
                    list[index].biaya!,
                    list[index].status!,
                    dateWithoutTime,
                    image);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container CardRiwayat(
      double widthMedia,
      BuildContext context,
      double heightMedia,
      String produk,
      int poin,
      String status,
      String date,
      String image) {
    return Container(
      margin: EdgeInsets.only(left: 5, top: 5, right: 5),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: heightMedia / 7.0,
                width: double.maxFinite,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10.0,
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(8.0), // Image border
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(50), // Image radius
                                child: Image.network(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          produk,
                                          style: TextStyle(
                                            color: PRIMARY_COLOR,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                        AutoSizeText(
                                          // "Beras 1kg",
                                          "",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    AutoSizeText(
                                      "$poin Poin",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      date,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    AutoSizeText(
                                      status,
                                      style: TextStyle(
                                        color: PRIMARY_COLOR,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
