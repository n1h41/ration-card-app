import 'package:ecom_app_1/screens/loginScreen.dart';
import 'package:ecom_app_1/screens/registrationScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Lottie.asset('assets/41413-brahma-logo.json'),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.08),
                            child: Column(
                              children: [
                                Text(
                                  "You're Digital Ration Card.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Bring together your files, your tools, projects and people. Including a new mobile and desktop application.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.045,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: size.height * 0.08,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.08,
                                      vertical: size.height * 0.03),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.grey[800],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegistrationScreen(),
                                                ),
                                              );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Register',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            child: Center(
                                              child: Text(
                                                'Sign In',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
