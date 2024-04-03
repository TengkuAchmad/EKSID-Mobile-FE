// ignore_for_file: file_names, use_key_in_widget_constructors, non_constant_identifier_names, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:melinda/API/auth.dart';
import 'RegisterPage.dart';
import 'package:melinda/API/user.dart';

Color PRIMARY_COLOR = Color(0xFF0096D5);

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;
  bool checked = false;
  bool isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async => false ,
      child: Scaffold(
        body: Center(
            child: Container(
          color: PRIMARY_COLOR,
          height: height(context),
          width: width(context),
          child: Center(
            child: Hero(
              tag: 'container',
              child: Card(
                elevation: 5,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  width: width(context) * 0.7,
                  height: height(context) * 0.5,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: PRIMARY_COLOR,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        child: const Text(
                          "Masukkan dan lengkapi data berikut",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        height: 30,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              colorScheme: ThemeData()
                                  .colorScheme
                                  .copyWith(primary: PRIMARY_COLOR)),
                          child: TextField(
                            controller: email,
                            cursorColor: PRIMARY_COLOR,
                            style: const TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                                hintStyle: const TextStyle(fontSize: 12),
                                hintText: "user@gmail.com",
                                focusColor: PRIMARY_COLOR,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                suffixIcon: const Icon(
                                  Icons.alternate_email,
                                  size: 12,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: PRIMARY_COLOR),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        height: 30,
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              colorScheme: ThemeData()
                                  .colorScheme
                                  .copyWith(primary: PRIMARY_COLOR)),
                          child: TextField(
                            controller: password,
                            cursorColor: PRIMARY_COLOR,
                            obscureText: true,
                            style: const TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                                focusColor: PRIMARY_COLOR,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                suffixIcon: const Icon(
                                  Icons.remove_red_eye_sharp,
                                  size: 12,
                                ),
                                hintStyle: const TextStyle(fontSize: 12),
                                hintText: "password",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: PRIMARY_COLOR),
                                    borderRadius: BorderRadius.circular(12)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: checked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checked = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  "Ingat saya",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            Text(
                              "Lupa kata sandi?",
                              style:
                                  TextStyle(fontSize: 10, color: PRIMARY_COLOR),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height(context) * 0.05),
                        child: ElevatedButton(
                          onPressed: () {
                            Auth().LogIn(context, email.text, password.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: PRIMARY_COLOR,
                            fixedSize: Size(
                                width(context) * 0.6, height(context) * 0.05),
                          ),
                          child: const Text("Login"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Belum punya akun?",
                              style: TextStyle(fontSize: 10),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterPage();
                              })),
                              child: Text(
                                "Daftar disini",
                                style:
                                    TextStyle(color: PRIMARY_COLOR, fontSize: 10),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
