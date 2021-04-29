import 'dart:math';
import 'package:ecom_app_1/screens/HomePage.dart';
import 'package:ecom_app_1/screens/RegisterUserPage.dart';
import 'package:ecom_app_1/screens/ShopHomePage.dart';
import 'package:flutter/material.dart';
import '../services/Webservice.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showText = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var email;
  var password;

  loginUser() async {
    Map data = {'email': email, 'password': password};
    final result = await Webservice().loginUser(jsonEncode(data));
    print(result.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Transform.rotate(
          angle: 180 * pi / 180,
          child: IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage())),
            icon: Icon(
              Icons.subdirectory_arrow_right,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's sign u in.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "Welcome back.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "You've been missed!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                      Expanded(
                        child: Form(
                          key: formKey,
                          child: Container(
                            /* color: Colors.grey, */
                            child: ListView(children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  createTextField('Email', false, (value) {
                                    if (value == '' || value.length <= 3)
                                      return "Enter valid email address.";
                                  }, (value) {
                                    email = value;
                                  }),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  createTextField('Password', true, (value) {
                                    if (value == '' || value.length < 8)
                                      return "Password length must be atleast 8 character long.";
                                  }, (value) {
                                    password = value;
                                  }),
                                ],
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Container(
                        /* color: Colors.grey, */
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(width: size.width * 0.01),
                                InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterUserPage())),
                                  child: Text(
                                    "Register",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            InkWell(
                              enableFeedback: true,
                              onTap: () {
                                /* if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  loginUser();
                                } */
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShopHomePage()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 6),
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.03),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
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
      ),
    );
  }

  TextFormField createTextField(label, isPassword, validator, onSaved) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      keyboardType: !isPassword
          ? TextInputType.emailAddress
          : TextInputType.visiblePassword,
      style: TextStyle(color: Colors.white, fontSize: 18),
      obscureText: isPassword ? !showText : true,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  !showText
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye,
                  color: Colors.white,
                ),
                onPressed: () => setState(() {
                  showText = !showText;
                }),
              )
            : null,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
