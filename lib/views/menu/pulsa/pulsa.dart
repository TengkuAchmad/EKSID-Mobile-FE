import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:melinda/views/menu/pulsa/pulsa_checkout.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class Pulsa extends StatefulWidget {
  const Pulsa({super.key});

  @override
  State<Pulsa> createState() => _PulsaState();
}

class _PulsaState extends State<Pulsa> {
  String inputNomorTelepon = '';

  final maskFormatter = MaskedInputFormatter('####-####-####-#');
  final TextEditingController numberController = TextEditingController();

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
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AutoSizeText(
              "Rp $textBayar",
              style: TextStyle(
                fontSize: 16,
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
          'Pulsa',
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
              padding: const EdgeInsets.symmetric(
                vertical: 7.5,
                horizontal: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: AutoSizeText(
                      "Pilih Nominal",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      CardRadioButton("5.000", "6.150", 1),
                      CardRadioButton("20.000", "21.000", 2),
                      CardRadioButton("25.000", "26.000", 3),
                      CardRadioButton("50.000", "51.000", 4),
                      CardRadioButton("100.000", "98.000", 5),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Visibility(
        visible: inputNomorTelepon != '' && valueNominal != "",
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
                  builder: (context) => PulsaCheckout(
                    noTelepon: numberController.value.text,
                    nominalPulsa: valueNominal.toString(),
                    bayarPulsa: valueBayar.toString(),
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
  final String textNominal;
  final String textBayar;

  RadioModel(
      this.isSelected, this.buttonText, this.textNominal, this.textBayar);
}
