import 'package:flutter/material.dart';

class ShopHomePage extends StatefulWidget {
  @override
  _ShopHomePageState createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        backgroundColor: Colors.black,
        title: Column(
          children: [
            Container(
              color: Colors.white,
              width: size.width * 0.29,
              height: 2,
            ),
            Text(
              'MARKET',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(5),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
