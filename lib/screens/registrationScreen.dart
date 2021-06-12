import 'dart:convert';
import 'dart:math';
import 'package:ecom_app_1/screens/loginScreen.dart';
import 'package:ecom_app_1/services/Webservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../globals.dart';
import 'mainScreen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Map data = {};
  bool showText = false;
  bool loading = false;

  var _controllerMobileNumber = new MaskedTextController(mask: '000-0000-000');
  var _controllerAadharNumber =
      new MaskedTextController(mask: '0000-0000-0000');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initiateLoader();
  }

  Future initiateLoader() {
    setState(() {
      loading = !loading;
    });
    return Future.delayed(
      const Duration(milliseconds: 1400),
      () {
        setState(() {
          loading = !loading;
        });
      },
    );
  }

  registerUser() async {
    final result = await Webservice().registerUser(jsonEncode(data));
    if (result.statusCode != 200)
      return print('Error Ocuured');
    else
      return print('User registered successfully');
  }

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return loading
        ? Center(
            child: Lottie.network(constants['loader']['url'],
                height: size.height * 0.2),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: bgColor,
              elevation: 0,
              leading: Transform.rotate(
                angle: 180 * pi / 180,
                child: IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                  ),
                  icon: Icon(Icons.subdirectory_arrow_right),
                ),
              ),
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Let's get started.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.053,
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
                                        createTextField(
                                          'Full Name',
                                          false,
                                          (value) {
                                            if (value.length < 3)
                                              return "Too short.";
                                          },
                                          (value) {
                                            data['name'] = value;
                                          },
                                          size,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.03,
                                        ),
                                        createTextField(
                                          'Card number',
                                          false,
                                          (value) {
                                            if (value == '' ||
                                                value.length < 10)
                                              return "Enter a valid card number.";
                                          },
                                          (value) {
                                            data['cardNumber'] = value;
                                          },
                                          size,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.03,
                                        ),
                                        createTextField(
                                          'Mobile',
                                          true,
                                          (value) {
                                            if (value == '' ||
                                                value.length < 10)
                                              return "Enter valid mobile number.";
                                          },
                                          (value) {
                                            data['mobileNumber'] = value;
                                          },
                                          size,
                                        ),
                                        SizedBox(
                                          height: size.height * 0.03,
                                        ),
                                        Text(
                                          'Enter pin',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: size.width * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.03,
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.07),
                                          child: PinPut(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: size.width * 0.055),
                                            fieldsCount: 4,
                                            onSubmit: (String pin) {
                                              if (formKey.currentState
                                                  .validate()) {
                                                formKey.currentState.save();
                                                data['pin'] = pin;
                                                registerUser();
                                              }
                                            },
                                            focusNode: _pinPutFocusNode,
                                            controller: _pinPutController,
                                            followingFieldDecoration:
                                                BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(0.7)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            selectedFieldDecoration:
                                                BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(0.9)),
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                            ),
                                            submittedFieldDecoration:
                                                BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blue),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.01),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                builder: (context) =>
                                                    LoginScreen(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Login",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.025,
                                    ),
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
              ),
            ),
          );
  }

  TextFormField createTextField(label, isNumber, validator, onSaved, size) {
    return TextFormField(
      controller: label == 'Mobile'
          ? _controllerMobileNumber
          : label == 'Aadhar'
              ? _controllerAadharNumber
              : null,
      maxLength: label == 'Mobile'
          ? 12
          : label == 'Aadhar'
              ? 14
              : null,
      onSaved: onSaved,
      validator: validator,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: TextStyle(
        color: Colors.white,
        fontSize: size.height * 0.02,
      ),
      decoration: InputDecoration(
        prefix: label == 'Mobile'
            ? Text(
                '+91 ',
                style: TextStyle(color: Colors.white),
              )
            : null,
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
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
