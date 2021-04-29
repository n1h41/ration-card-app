import 'dart:convert';
import 'dart:math';
import 'package:ecom_app_1/screens/LoginPage.dart';
import 'package:ecom_app_1/screens/ShopHomePage.dart';
import 'package:ecom_app_1/services/Webservice.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';

class RegisterUserPage extends StatefulWidget {
  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  String name;
  String email;
  String password;
  String mobileNumber;

  bool showText = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  registerUser() async {
    Map data = {
      'name': name,
      'email': email,
      'password': password,
      'mobileNumber': mobileNumber
    };
    final result = await Webservice().registerUser(jsonEncode(data));
    print(result.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Transform.rotate(
          angle: 180 * pi / 180,
          child: IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage())),
            icon: Icon(Icons.subdirectory_arrow_right),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Let's get started.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Form(
                        key: formKey,
                        child: ListView(children: [
                          Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              createTextField('Name', false, (value) {
                                if (value.length < 3) return "Too short.";
                              }, (value) {
                                name = value;
                              }),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              createTextField('Email', false, (value) {
                                if (!value.contains('.') ||
                                    !value.contains('@'))
                                  return "Enter valid email address.";
                              }, (value) {
                                email = value;
                              }),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              createTextField('Password', true, (value) {
                                if (value.length <= 3) return "Too short.";
                              }, (value) {
                                password = value;
                              }),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              createTextField('Mobile', false, (value) {
                                if (value.length <= 3) return "Too short.";
                              }, (value) {
                                mobileNumber = value;
                              }),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                    Container(
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
                                "Already have an account?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: size.width * 0.01),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                child: Text(
                                  "Login",
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
                                registerUser();
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
                                  'Register',
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
          )
        ],
      ),
    );
  }

  TextFormField createTextField(label, isPassword, validator, onSaved) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      keyboardType: label == 'Mobile'
          ? TextInputType.number
          : label == 'Email'
              ? TextInputType.emailAddress
              : TextInputType.text,
      style: TextStyle(color: Colors.white, fontSize: 18),
      obscureText: isPassword ? !showText : true,
      decoration: InputDecoration(
        prefix: label == 'Mobile'
            ? Text(
                '+91 ',
                style: TextStyle(color: Colors.white),
              )
            : null,
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
