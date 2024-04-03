// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:melinda/API/auth.dart';
import 'package:melinda/API/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var editPhone = TextEditingController();
  var editName = TextEditingController();
  var editEmail = TextEditingController();
  var controller = TextEditingController();
  var plama = TextEditingController();
  var pbaru = TextEditingController();
  var pverifikasi = TextEditingController();

  String name = "";
  String phone = "";
  String email = "";

  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;

  void _getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name')!;
    String phone = prefs.getString('phone')!;
    String email = prefs.getString('email')!;
    setState(() {
      this.name = name;
      this.phone = phone;
      this.email = email;
    });
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          backgroundColor: PRIMARY_COLOR,
          leading: BackButton(
            color: Colors.white,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Profil"),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              "Yakin keluar dari akun ini?",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            actions: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                      foregroundColor: PRIMARY_COLOR),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Tidak")),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: PRIMARY_COLOR,
                                      foregroundColor: Colors.white),
                                  onPressed: () {
                                    Auth().logout(context);
                                  },
                                  child: Text("Iya")),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.output))
            ],
          )),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 21),
            child: Column(
              children: [
                CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/user.png")),
                Container(
                  padding: EdgeInsets.only(top: 5.0, bottom: 21.0),
                  child: Text(
                    'Ubah Foto Profil',
                    style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            )),

        //   info user
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 24,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey, width: 1))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nomor Telepon",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  Text(phone),
                                ],
                              ),
                            ),
                            IconButton(
                                iconSize: 24,
                                onPressed: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5))),
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: height(context) * 0.25,
                                        padding: EdgeInsets.all(8),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: IconButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                icon: Icon(
                                                  Icons.close,
                                                  color: PRIMARY_COLOR,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    "Ganti Nomor Telepon",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: PRIMARY_COLOR),
                                                  ),
                                                ),
                                                Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5),
                                                    child:
                                                        Text("Nomor Telepon")),
                                                Container(
                                                    height: 30,
                                                    child: TextField(
                                                      onChanged: (value) async {
                                                        setState(() {});
                                                      },
                                                      controller: editPhone,
                                                      cursorColor:
                                                          PRIMARY_COLOR,
                                                      decoration: InputDecoration(
                                                          hintText: phone,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .symmetric(
                                                                      vertical:
                                                                          0,
                                                                      horizontal:
                                                                          10),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              PRIMARY_COLOR)),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              PRIMARY_COLOR))),
                                                    )),
                                                Center(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 15),
                                                    width: width(context) * 0.7,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    PRIMARY_COLOR),
                                                        onPressed: () async {
                                                          final prefs =
                                                              await SharedPreferences
                                                                  .getInstance();
                                                          var phone =
                                                              editPhone.text;
                                                          var name =
                                                              prefs.getString(
                                                                  'name');
                                                          var email =
                                                              prefs.getString(
                                                                  'email');
                                                          var password =
                                                              prefs.getString(
                                                                  'password');
                                                          User().changeUser(
                                                              context,
                                                              phone,
                                                              name!,
                                                              email!);
                                                        },
                                                        child: Text("Ubah")),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.chevron_right,
                                    color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 25.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 24,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey, width: 1))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nama',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  Text(name),
                                ],
                              ),
                            ),
                            IconButton(
                                iconSize: 24,
                                onPressed: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5))),
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: height(context) * 0.25,
                                        padding: EdgeInsets.all(8),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: IconButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                icon: Icon(
                                                  Icons.close,
                                                  color: PRIMARY_COLOR,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    "Ganti Nama",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: PRIMARY_COLOR),
                                                  ),
                                                ),
                                                Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5),
                                                    child: Text("Nama")),
                                                Container(
                                                    height: 30,
                                                    child: TextField(
                                                      onChanged: (value) {
                                                        setState(() {});
                                                      },
                                                      controller: editName,
                                                      cursorColor:
                                                          PRIMARY_COLOR,
                                                      decoration: InputDecoration(
                                                          hintText: name,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .symmetric(
                                                                      vertical:
                                                                          0,
                                                                      horizontal:
                                                                          10),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              PRIMARY_COLOR)),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              PRIMARY_COLOR))),
                                                    )),
                                                Center(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 15),
                                                    width: width(context) * 0.7,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    PRIMARY_COLOR),
                                                        onPressed: () async {
                                                          final prefs =
                                                              await SharedPreferences
                                                                  .getInstance();
                                                          var phone =
                                                              prefs.getString(
                                                                  'phone');
                                                          var name =
                                                              editName.text;
                                                          prefs.setString(
                                                              'name',
                                                              editName.text);
                                                          var email =
                                                              prefs.getString(
                                                                  'email');
                                                          var password =
                                                              prefs.getString(
                                                                  'password');
                                                          User().changeUser(
                                                              context,
                                                              phone!,
                                                              name,
                                                              email!);
                                                        },
                                                        child: Text("Ubah")),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 25.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 24,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey, width: 1))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  Text(email),
                                ],
                              ),
                            ),
                            IconButton(
                                iconSize: 24,
                                onPressed: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5))),
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: height(context) * 0.25,
                                        padding: EdgeInsets.all(8),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: IconButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                icon: Icon(
                                                  Icons.close,
                                                  color: PRIMARY_COLOR,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    "Ganti Email",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: PRIMARY_COLOR),
                                                  ),
                                                ),
                                                Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5),
                                                    child: Text("Email")),
                                                Container(
                                                    height: 30,
                                                    child: TextField(
                                                      onChanged: (value) {
                                                        setState(() {});
                                                      },
                                                      controller: editEmail,
                                                      cursorColor:
                                                          PRIMARY_COLOR,
                                                      decoration: InputDecoration(
                                                          hintText: email,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .symmetric(
                                                                      vertical:
                                                                          0,
                                                                      horizontal:
                                                                          10),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              PRIMARY_COLOR)),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              PRIMARY_COLOR))),
                                                    )),
                                                Center(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        top: 15),
                                                    width: width(context) * 0.7,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    PRIMARY_COLOR),
                                                        onPressed: () async {
                                                          final prefs =
                                                              await SharedPreferences
                                                                  .getInstance();
                                                          var phone =
                                                              prefs.getString(
                                                                  'phone');
                                                          var name =
                                                              prefs.getString(
                                                                  'name');
                                                          print(editEmail.text);
                                                          User().changeUser(
                                                            context,
                                                            phone!,
                                                            name!,
                                                            editEmail.text,
                                                          );
                                                        },
                                                        child: Text("Ubah")),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 25.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.key,
                      size: 24,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.grey, width: 1))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Password',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  Text('******'),
                                ],
                              ),
                            ),
                            IconButton(
                                iconSize: 24,
                                onPressed: () {
                                  showModalBottomSheet(
                                      useSafeArea: true,
                                      enableDrag: true,
                                      isScrollControlled: true,
                                      isDismissible: false,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      context: context,
                                      builder: (context) {
                                        var heightBottom =
                                            height(context) * 0.7;
                                        return Container(
                                          height: heightBottom,
                                          padding: EdgeInsets.all(8),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: IconButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: PRIMARY_COLOR,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      "Ganti Password",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: PRIMARY_COLOR),
                                                    ),
                                                  ),
                                                  Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5),
                                                      child: Text(
                                                          "Password Lama")),
                                                  Container(
                                                      height: 30,
                                                      child: TextField(
                                                        onTap: () {
                                                          setState(() {
                                                            heightBottom =
                                                                height(context);
                                                          });
                                                        },
                                                        onChanged: (value) {
                                                          setState(() {});
                                                        },
                                                        controller: plama,
                                                        cursorColor:
                                                            PRIMARY_COLOR,
                                                        decoration: InputDecoration(
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .symmetric(
                                                                        vertical:
                                                                            0,
                                                                        horizontal:
                                                                            10),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                PRIMARY_COLOR)),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                PRIMARY_COLOR))),
                                                      )),
                                                  Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5),
                                                      child: Text(
                                                          "Password Baru")),
                                                  Container(
                                                      height: 30,
                                                      child: TextField(
                                                        obscureText: true,
                                                        onChanged: (value) {
                                                          setState(() {});
                                                        },
                                                        controller: pbaru,
                                                        cursorColor:
                                                            PRIMARY_COLOR,
                                                        decoration: InputDecoration(
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .symmetric(
                                                                        vertical:
                                                                            0,
                                                                        horizontal:
                                                                            10),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                PRIMARY_COLOR)),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                PRIMARY_COLOR))),
                                                      )),
                                                  Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 5),
                                                      child: Text(
                                                          "Ulangi Password")),
                                                  Container(
                                                      height: 30,
                                                      child: TextField(
                                                        obscureText: true,
                                                        onChanged: (value) {
                                                          setState(() {});
                                                        },
                                                        controller: pverifikasi,
                                                        cursorColor:
                                                            PRIMARY_COLOR,
                                                        decoration: InputDecoration(
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .symmetric(
                                                                        vertical:
                                                                            0,
                                                                        horizontal:
                                                                            10),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                PRIMARY_COLOR)),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                PRIMARY_COLOR))),
                                                      )),
                                                  Center(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 15),
                                                      width:
                                                          width(context) * 0.7,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      PRIMARY_COLOR),
                                                          onPressed: () async {
                                                            final prefs =
                                                                await SharedPreferences
                                                                    .getInstance();
                                                            var passlama =
                                                                prefs.getString(
                                                                    'password');
                                                            if (pbaru.text ==
                                                                pverifikasi
                                                                    .text) {
                                                              if (plama.text ==
                                                                  passlama) {
                                                                DialogPassword(
                                                                    context,
                                                                    "Masukkan password baru");
                                                              } else {
                                                                User().changePassword(
                                                                    context,
                                                                    plama.text,
                                                                    pbaru.text);
                                                              }
                                                            } else {
                                                              DialogPassword(
                                                                  context,
                                                                  "Password tidak sama");
                                                            }
                                                          },
                                                          child: Text("Ubah")),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Future<dynamic> DialogPassword(BuildContext context, String text) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  Future<dynamic> ProfilBottomSheet(
      BuildContext context, String content, TextEditingController controller) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      context: context,
      builder: (context) {
        return Container(
          height: height(context) * 0.25,
          padding: EdgeInsets.all(8),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: PRIMARY_COLOR,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Ganti $content",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: PRIMARY_COLOR),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Text(content)),
                  Container(
                      height: 30,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: controller,
                        cursorColor: PRIMARY_COLOR,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsetsDirectional.symmetric(
                                vertical: 0, horizontal: 10),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: PRIMARY_COLOR)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: PRIMARY_COLOR))),
                      )),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      width: width(context) * 0.7,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: PRIMARY_COLOR),
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            var phone = prefs.getString('phone');
                            var name = prefs.getString('name');
                            var email = prefs.getString('email');
                            var password = prefs.getString('password');
                            User().changeUser(context, phone!, name!, email!);
                          },
                          child: Text("Ubah")),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
