import 'package:flutter/material.dart';
import 'package:healthypet/screens/pet_detail.dart';

class CookiePage extends StatefulWidget {
  @override
  _CookiePageState createState() => _CookiePageState();
}

class _CookiePageState extends State<CookiePage> {
  List<Cookie> cookies = [
    Cookie('Kucing Persia', '\$3.99', 'assets/images/persia.jpg', false),
    Cookie('Kucing Anggora', '\$5.99', 'assets/images/anggora.jpg', false),
    Cookie('Kucing Russian Blue', '\$1.99', 'assets/images/rusianblue.jpg', false),
    Cookie('Kucing Siam', '\$2.99', 'assets/images/siam.jpeg', false),
    Cookie('Kucing Siam', '\$2.99', 'assets/images/siam.jpeg', false),
    Cookie('Kucing Siam', '\$2.99', 'assets/images/siam.jpeg', false),
    Cookie('Kucing Siam', '\$2.99', 'assets/images/siam.jpeg', false),
    Cookie('Kucing Siam', '\$2.99', 'assets/images/siam.jpeg', false),
  ];

  Widget _buildCard(Cookie cookie) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CookieDetail(
              assetPath: cookie.imgPath,
              cookieprice: cookie.price,
              cookiename: cookie.name,
            ),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          // Toggle item favorit saat ikon love dipencet
                          cookie.isFavorite = !cookie.isFavorite;
                        });
                      },
                      child: cookie.isFavorite
                          ? Icon(Icons.favorite, color: Color(0xFF818AF9))
                          : Icon(Icons.favorite_border, color: Color(0xFF818AF9)),
                    )
                  ],
                ),
              ),
              Hero(
                tag: cookie.imgPath,
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(cookie.imgPath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 7.0),
              Text(
                cookie.price,
                style: TextStyle(
                  color: Color(0xFF818AF9),
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              Text(
                cookie.name,
                style: TextStyle(
                  color: Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 14.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(color: Color(0xFFEBEBEB), height: 1.0),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Tombol Add to Cart atau tampilan jumlah item
                    if (!cookie.isFavorite) ...[
                      Icon(Icons.shopping_basket, color: Color(0xFF818AF9), size: 12.0),
                      Text(
                        'Add to cart',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          color: Color(0xFF818AF9),
                          fontSize: 12.0,
                        ),
                      )
                    ] else ...[
                      Icon(Icons.remove_circle_outline, color: Color(0xFF818AF9), size: 12.0),
                      Text(
                        '3',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          color: Color(0xFF818AF9),
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      ),
                      Icon(Icons.add_circle_outline, color: Color(0xFF818AF9), size: 12.0),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Pet"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 30.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: (MediaQuery.of(context).size.width / 2 - 30) / 220,
              children: cookies.map((cookie) => _buildCard(cookie)).toList(),
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }
}

class Cookie {
  final String name;
  final String price;
  final String imgPath;
  bool isFavorite;

  Cookie(this.name, this.price, this.imgPath, this.isFavorite);
}
