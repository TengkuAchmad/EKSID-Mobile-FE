import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:melinda/views/menu/listrik/detail_tagihan.dart';
import 'package:melinda/views/Colors.dart';

Color PRIMARY_COLOR = Warna().PRIMARY_COLOR;

class Listrik extends StatefulWidget {
  const Listrik({super.key});

  @override
  State<Listrik> createState() => _ListrikState();
}

class _ListrikState extends State<Listrik> {
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
          automaticallyImplyLeading: false,
          leading: BackButton(
            color: Colors.grey,
          ),
          title: Text(
            'Listrik PLN',
            style: TextStyle(
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w700,
            ),
          ),
          bottom: TabBar(
            labelColor: PRIMARY_COLOR,
            indicatorColor: PRIMARY_COLOR,
            indicatorWeight: 3.0,
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Color.fromARGB(35, 0, 0, 0),
            tabs: [
              Tab(text: 'Token Listrik'),
              Tab(text: 'Tagihan Listrik'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TokenListrik(),
            TagihanListrik(),
          ],
        ),
      ),
    );
  }
}

// Token Listrik
class TokenListrik extends StatefulWidget {
  const TokenListrik({super.key});

  @override
  State<TokenListrik> createState() => _TokenListrikState();
}

class _TokenListrikState extends State<TokenListrik> {
  String inputTokenMeter = '';

  String valueNominal = '';
  String valueBayar = '';
  Widget CardRadioButton(String textNominal, String textBayar, int index) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor:
            (valueNominal == textNominal) ? PRIMARY_COLOR : Colors.white,
      ),
      onPressed: () {
        setState(() {
          valueNominal = textNominal;
          valueBayar = textBayar;
        });
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 2.5,
              ),
              child: AutoSizeText(
                textNominal,
                style: TextStyle(
                  color: (valueNominal == textNominal)
                      ? Colors.white
                      : PRIMARY_COLOR,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AutoSizeText(
              "Rp $textBayar",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: (valueNominal == textNominal)
                    ? Colors.black
                    : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: AutoSizeText(
                    "No. Meter / No. Pelanggan",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  onChanged: (value) => setState(() => inputTokenMeter = value),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                        color: PRIMARY_COLOR,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                        color: PRIMARY_COLOR,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                        color: PRIMARY_COLOR,
                        width: 1,
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: PRIMARY_COLOR,
                    ),
                    hintText: 'Contoh : 123456789',
                  ),
                ),
              ],
            ),
          ),
          if (inputTokenMeter == '')
            Image.asset(
              'assets/images/empty.png',
              scale: 1,
            ),
          if (inputTokenMeter != '')
            GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                CardRadioButton("20.000", "20.750", 1),
                CardRadioButton("50.000", "50.750", 2),
                CardRadioButton("100.000", "100.750", 3),
                CardRadioButton("200.000", "200.750", 4),
                CardRadioButton("500.000", "500.750", 5),
                CardRadioButton("1.000.000", "1.000.750", 6),
              ],
            ),
          if (inputTokenMeter != '')
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.5,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        AutoSizeText(
                          "• ",
                          style: TextStyle(
                            color: Color.fromARGB(125, 0, 0, 0),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            "Mohon perhatian bahwa terdapat batas pembelian untuk token PLN. Jika pembelian telah melebihi limit, maka pesanan akan gagal. Silakan coba lagi pada hari pertama di bulan depan.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color.fromARGB(125, 0, 0, 0),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2.5,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        AutoSizeText(
                          "• ",
                          style: TextStyle(
                            color: Color.fromARGB(125, 0, 0, 0),
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            "Mohon perhatian bahwa terdapat batas pembelian untuk token PLN. Jika pembelian telah melebihi limit, maka pesanan akan gagal. Silakan coba lagi pada hari pertama di bulan depan. Untuk informasi lebih lanjut mengenai batas token PLN kamu, silakan hubungi PLN di (012)123 atau perikasa meteran listrik.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color.fromARGB(125, 0, 0, 0),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
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
      bottomNavigationBar: Visibility(
        visible: inputTokenMeter != '' && valueNominal != "",
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30,
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailTagihan(noMeter: inputTokenMeter);
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: PRIMARY_COLOR,
            ),
            child: const AutoSizeText(
              "Lanjut",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String textNominal;
  final String textBayar;

  RadioModel(
      this.isSelected, this.buttonText, this.textNominal, this.textBayar);
}

// Tagihan Listrik
class TagihanListrik extends StatefulWidget {
  const TagihanListrik({super.key});

  @override
  State<TagihanListrik> createState() => _TagihanListrikState();
}

class _TagihanListrikState extends State<TagihanListrik> {
  String inputTagihanMeter = '';

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: AutoSizeText(
                    "No. Meter / No. Pelanggan",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  onChanged: (value) =>
                      setState(() => inputTagihanMeter = value),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                        color: PRIMARY_COLOR,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                        color: PRIMARY_COLOR,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(
                        color: PRIMARY_COLOR,
                        width: 1,
                      ),
                    ),
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: PRIMARY_COLOR,
                    ),
                    hintText: 'Contoh : 123456789',
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/empty.png',
            scale: 1,
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Visibility(
        visible: inputTagihanMeter != '',
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30,
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailTagihan(
                    noMeter: inputTagihanMeter,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: PRIMARY_COLOR,
            ),
            child: const AutoSizeText(
              "Cek Tagihan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
