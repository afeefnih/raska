import 'package:flutter/material.dart';

class PromoCardSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Card(
            elevation: 6,
            child: Container(color:Color(0xffffd09c), width: 100, child: Center(child: Text("Promo 1"))),
          ),
          Card(
            elevation: 6,
            child: Container(color:Color(0xffffd09c), width: 100, child: Center(child: Text("Promo 2"))),
          ),
          Card(
            elevation: 6,
            child: Container(color:Color(0xffffd09c), width: 100, child: Center(child: Text("Promo 3"))),
          ),
          Card(
            elevation: 6,
            child: Container(color:Color(0xffffd09c), width: 100, child: Center(child: Text("Promo 4"))),
          ),
        ],
      ),
    );
  }
}
