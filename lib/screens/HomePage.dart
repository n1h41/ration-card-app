import 'package:ecom_app_1/screens/LoginPage.dart';
import 'package:ecom_app_1/screens/RegisterUserPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Lottie.asset('assets/41413-brahma-logo.json'),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: [
                          Text(
                            'Enterprise team collaboration.',
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
                      /* color: Colors.grey, */
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: size.height * 0.08,
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.08),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[800]),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterUserPage())),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text(
                                          'Register',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage())),
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'Sign In',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
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
