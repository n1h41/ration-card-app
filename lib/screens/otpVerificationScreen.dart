import 'dart:math';
import 'package:ecom_app_1/screens/loginScreen.dart';
import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatefulWidget {
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Transform.rotate(
          angle: 180 * pi / 180,
          child: IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen())),
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
                      padding: EdgeInsets.symmetric(horizontal: size.height * 0.03),
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
                            child: Container(
                              child: ListView(children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [],
                                ),
                              ]),
                            ),
                          ),
                          Container(
                            /* color: Colors.grey, */
                            padding: EdgeInsets.only(top: size.height * 0.01),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.grey),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  enableFeedback: true,
                                  onTap: () {
                                    /* FlutterOtp().sendOtp('7559865386', 'OTP is :', 1, 1000, '+91'); */
                                    /* if (formKey.currentState.validate()) {
                                      formKey.currentState.save();
                                    } */
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        bottom: size.height * 0.01),
                                    padding: EdgeInsets.symmetric(
                                        vertical: size.height * 0.03),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Verify OTP',
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
        ),
      ),
    );
  }
}
