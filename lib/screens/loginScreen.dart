import 'dart:math';
import 'package:ecom_app_1/screens/mainScreen.dart';
import 'package:ecom_app_1/screens/registrationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../globals.dart';
import '../services/Webservice.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showText = false;
  bool loading = false;

  var _controller = new MaskedTextController(mask: '000-0000-000');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Map data = {};

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
      }
    );
  }

  loginUser() async {
    final result = await Webservice().loginUser(jsonEncode(data));
    if (result.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('auth-token', result.headers['auth-token']);
      print('Logged in successfully');
    }
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
            backgroundColor: Colors.black,
            appBar: AppBar(
              leading: Transform.rotate(
                angle: 180 * pi / 180,
                child: IconButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen())),
                  icon: Icon(
                    Icons.subdirectory_arrow_right,
                    color: Colors.white,
                  ),
                ),
              ),
              backgroundColor: Colors.black,
            ),
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Container(
                        child: SafeArea(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.height * 0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Let's sign you in.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.053,
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
                                    fontSize: size.height * 0.045,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Expanded(
                                  child: Form(
                                    key: formKey,
                                    child: Container(
                                      /* color: Colors.grey, */
                                      child: ListView(children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
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
                                                data['rationCardNumber'] = value;
                                              },
                                              size,
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
                                                  horizontal:
                                                      size.width * 0.07),
                                              child: PinPut(
                                                obscureText: '*',
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        size.width * 0.055),
                                                fieldsCount: 4,
                                                onSubmit: (String pin) {
                                                  if (formKey.currentState
                                                      .validate()) {
                                                    formKey.currentState.save();
                                                    data['pin'] = pin;
                                                    loginUser();
                                                  }
                                                },
                                                focusNode: _pinPutFocusNode,
                                                controller: _pinPutController,
                                                followingFieldDecoration:
                                                    BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.grey
                                                          .withOpacity(0.7)),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                selectedFieldDecoration:
                                                    BoxDecoration(
                                                  border: Border.all(
                                                      width: 2,
                                                      color: Colors.white
                                                          .withOpacity(0.9)),
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                ),
                                                submittedFieldDecoration:
                                                    BoxDecoration(
                                                  border: Border.all(
                                                      width: 2,
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
                                ),
                                Container(
                                  /* color: Colors.grey, */
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
                                            "Don't have an account?",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(width: size.width * 0.01),
                                          InkWell(
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegistrationScreen())),
                                            child: Text(
                                              "Register",
                                              style: TextStyle(
                                                  color: Colors.white),
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  TextFormField createTextField(label, isNumber, validator, onSaved, size) {
    return TextFormField(
      controller: isNumber ? _controller : null,
      maxLength: isNumber ? 12 : 10,
      onSaved: onSaved,
      validator: validator,
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: Colors.white,
        fontSize: size.height * 0.02,
      ),
      decoration: InputDecoration(
        prefix: isNumber
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
