import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatefulWidget {

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart',
          style: TextStyle(
              color: Colors.black
          ),
        ),

        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),

      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('',
            style: TextStyle(
              fontSize: 15
            ),
            ),
            SizedBox(height: 40,),
            Container(
              width: .9.sw,
              height:.7.sw,
              child: SvgPicture.asset(
                "assets/images/emptyCart.svg",
                alignment: Alignment.center,
                fit: BoxFit.fill,
                width: .4.sw,
              ),
            ),
          ],
        ),
      )
    );
  }
}