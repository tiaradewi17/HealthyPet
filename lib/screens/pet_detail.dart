import 'package:flutter/material.dart';
import 'package:healthypet/screens/bottom_bar.dart';

class CookieDetail extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  CookieDetail({this.assetPath, this.cookieprice, this.cookiename});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Pickup',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Color(0xFF545D68),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 15.0),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Categories',
            style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF818AF9),
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Hero(
          tag: assetPath,
          child: Image.asset(
            assetPath,
            height: 200.0,
            width: 200.0,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 20.0),
        Center(
          child: Text(
            cookieprice,
            style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF818AF9),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Center(
          child: Text(
            cookiename,
            style: TextStyle(
              color: Color(0xFF575E67),
              fontFamily: 'Varela',
              fontSize: 28.0,
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
              'Kucing adalah hewan mandiri yang sering tidur sebagian besar hari dan aktif di malam hari. Mereka berkomunikasi dengan meong dan bahasa tubuh, seperti meronta ekor. Kucing dapat membentuk ikatan dengan pemiliknya dan membutuhkan perawatan seperti makanan, air, dan kunjungan ke dokter hewan.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 18.0,
                color: Color(0xFFB4B8B9),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Color(0xFF818AF9),
            ),
            child: Center(
              child: Text(
                'Add to cart',
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF818AF9),
        child: Icon(Icons.add_shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
