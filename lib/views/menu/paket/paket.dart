import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:melinda/views/menu/paket/paket_checkout.dart';
import 'package:melinda/views/Colors.dart';

Color PRIMARY_COLOR = Warna().PRIMARY_COLOR;

class Paket extends StatefulWidget {
  const Paket({super.key});

  @override
  State<Paket> createState() => _PaketState();
}

class _PaketState extends State<Paket> {
  String inputNomorTelepon = '';

  final maskFormatter = MaskedInputFormatter('####-####-####-#');
  final TextEditingController numberController = TextEditingController();

  String namaPaket = '';
  String masaAktif = '';
  String smsTsel = '';
  String voiceTsel = '';
  String kuotaInternet = '';
  String voiceOperator = '';
  String hargaPaket = '';

  Widget CardRadioButton(
      String textPaket,
      String textAktif,
      String textSms,
      String textVoice,
      textInternet,
      String textVoiceOperator,
      String textHarga,
      int index) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor:
            (namaPaket == textPaket) ? PRIMARY_COLOR : Colors.white,
      ),
      onPressed: () {
        setState(() {
          namaPaket = textPaket;
          masaAktif = textAktif;
          hargaPaket = textHarga;
          kuotaInternet = textInternet;
          voiceTsel = textVoice;
          smsTsel = textSms;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 7.5),
              child: AutoSizeText(
                textPaket,
                style: TextStyle(
                  color:
                      (namaPaket == textPaket) ? Colors.white : PRIMARY_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            if (textAktif.toString() != "")
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      "Masa Aktif",
                      style: TextStyle(
                        color: (namaPaket == textPaket)
                            ? Colors.black
                            : Colors.black54,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    AutoSizeText(
                      textAktif.toString(),
                      style: TextStyle(
                        color: (namaPaket == textPaket)
                            ? Colors.black
                            : Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            if (textSms.toString() != "")
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      "SMS TSEL",
                      style: TextStyle(
                        color: (namaPaket == textPaket)
                            ? Colors.black
                            : Colors.black54,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    AutoSizeText(
                      textSms.toString(),
                      style: TextStyle(
                        color: (namaPaket == textPaket)
                            ? Colors.black
                            : Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            if (textVoice.toString() != "")
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      "Voice TSEL",
                      style: TextStyle(
                        color: (namaPaket == textPaket)
                            ? Colors.black
                            : Colors.black54,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    AutoSizeText(
                      textVoice.toString(),
                      style: TextStyle(
                        color: (namaPaket == textPaket)
                            ? Colors.black
                            : Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            if (textInternet.toString() != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      "Internet",
                      style: TextStyle(
                        color: (namaPaket == textPaket)
                            ? Colors.black
                            : Colors.black54,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    AutoSizeText(
                      textInternet.toString(),
                      style: TextStyle(
                        color: (namaPaket == textPaket)
                            ? Colors.black
                            : Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            if (textVoiceOperator.toString() != "")
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      "Voice Operator Lain",
                      style: TextStyle(
                        color: (namaPaket == textPaket)
                            ? Colors.black
                            : Colors.black54,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                    AutoSizeText(
                      textVoiceOperator.toString(),
                      style: TextStyle(
                        color: (namaPaket == textPaket)
                            ? Colors.black
                            : Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: AutoSizeText(
                  textHarga.toString(),
                  style: TextStyle(
                    color:
                        (namaPaket == textPaket) ? Colors.white : PRIMARY_COLOR,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          'Paket Data',
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: AutoSizeText(
                    "Nomor Telepon",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.always,
                  controller: numberController,
                  inputFormatters: [maskFormatter],
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
                    hintText: 'Masukkan Nomor Telepon',
                  ),
                  onChanged: (value) =>
                      setState(() => inputNomorTelepon = value),
                ),
              ],
            ),
          ),
          if (inputNomorTelepon == '')
            Image.asset(
              'assets/images/empty-pulsa.png',
              scale: 1,
            ),
          if (inputNomorTelepon != '')
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  CardRadioButton("Combo Spesial 12 GB", "30 Hari", '',
                      "30 Menit", "12 GB", "", "37.000", 1),
                  CardRadioButton("Paket Spesial 20 GB", "30 Hari", "100 SMS",
                      "35 Menit", "20 GB", "15 Menit", "50.000", 1),
                  CardRadioButton("Paket Istimewa 15 GB", "30 Hari", "",
                      "30 Menit", "", "", "40.000", 1),
                ],
              ),
            ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Visibility(
        visible: inputNomorTelepon != '' && namaPaket != "",
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
                  builder: (context) => PaketCheckout(
                    noTelepon: numberController.value.text,
                    namaPaket: namaPaket.toString(),
                    masaAktif: masaAktif.toString(),
                    hargaPaket: hargaPaket.toString(),
                  ),
                ),
              );
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
  final String textPaket,
      kuotaAktif,
      kuotaSms,
      kuotaVoice,
      kuotaInternet,
      kuotaVoiceOperatorLain,
      textHarga;

  RadioModel(
    this.isSelected,
    this.buttonText,
    this.textPaket,
    this.kuotaAktif,
    this.kuotaSms,
    this.kuotaVoice,
    this.kuotaInternet,
    this.kuotaVoiceOperatorLain,
    this.textHarga,
  );
}
