// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:melinda/views/menu/emoney/emoney_checkout.dart';
import 'package:melinda/views/Colors.dart';

Color PRIMARY_COLOR = Warna().PRIMARY_COLOR;

class EMoney extends StatefulWidget {
  const EMoney({super.key});

  @override
  State<EMoney> createState() => _EMoneyState();
}

class _EMoneyState extends State<EMoney> {
  // E-Wallet Dropdown
  String? dropdownValue;
  final walletItem = ['Dana', 'Gopay', 'E-TOLL MANDIRI'];

  String inputNomorTelepon = '';

  final maskFormatter = MaskedInputFormatter('####-####-####-#');
  final TextEditingController numberController = TextEditingController();

  String valueNominal = '';
  Widget NominalRadioButton(String text, int index) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 2.0,
          color: (valueNominal == text) ? Colors.white : PRIMARY_COLOR,
        ),
        backgroundColor: (valueNominal == text) ? PRIMARY_COLOR : Colors.white,
      ),
      onPressed: () {
        setState(() {
          valueNominal = text;
        });
      },
      child: Center(
        child: AutoSizeText(
          text,
          style: TextStyle(
            color: (valueNominal == text) ? Colors.white : PRIMARY_COLOR,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

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
          'E-MONEY',
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const AutoSizeText(
                "e-Wallet",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: DropdownButton2(
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      FontAwesomeIcons.chevronDown,
                      size: 14,
                    ),
                    iconEnabledColor: Colors.black,
                  ),
                  buttonStyleData: ButtonStyleData(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: PRIMARY_COLOR,
                        width: 2,
                      ),
                      color: Colors.white,
                    ),
                    elevation: 0,
                  ),
                  isExpanded: true,
                  hint: AutoSizeText(
                    "Pilih e-Wallet",
                    style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  underline: const SizedBox(),
                  items:
                      walletItem.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: AutoSizeText(
                        value,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                  value: dropdownValue,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          if (dropdownValue != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const AutoSizeText(
                  "Nomor Telepon / Kartu",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.phone,
                    autovalidateMode: AutovalidateMode.always,
                    controller: numberController,
                    inputFormatters: [maskFormatter],
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                          color: PRIMARY_COLOR,
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(215, 95, 214, 10),
                          width: 1,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: PRIMARY_COLOR,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: PRIMARY_COLOR,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: PRIMARY_COLOR,
                          width: 2.0,
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: PRIMARY_COLOR,
                      ),
                      hintText: 'Contoh : 0812345678910',
                    ),
                    onChanged: (value) =>
                        setState(() => inputNomorTelepon = value),
                  ),
                ),
              ],
            ),
          if (dropdownValue != null && inputNomorTelepon != '')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const AutoSizeText(
                  "Pilih Nominal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.5),
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      NominalRadioButton("25.000", 1),
                      NominalRadioButton("50.000", 2),
                      NominalRadioButton("100.000", 3),
                      NominalRadioButton("200.000", 4),
                      NominalRadioButton("300.000", 5),
                      NominalRadioButton("400.000", 6),
                      NominalRadioButton("500.000", 7),
                      NominalRadioButton("750.000", 8),
                      NominalRadioButton("1.000.000", 9),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Visibility(
        visible: inputNomorTelepon != '' &&
            dropdownValue != null &&
            valueNominal != '',
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
                  builder: (context) => EmoneyCheckout(
                    noTelepon: numberController.value.text,
                    ewallet: dropdownValue.toString(),
                    nominal: valueNominal.toString(),
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
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}
