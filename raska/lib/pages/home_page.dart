import 'package:flutter/material.dart';
import 'package:raska/config/colors.dart';
import 'package:raska/pages/widgets/graph_bar.dart';
import 'package:raska/pages/widgets/promo_card_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: GraphBarWidget(), // Custom Widget for donation graph
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Highlights & Promotions",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 10),
                  PromoCardSlider(), // Your existing PromoCardSlider widget
                  SizedBox(height: 20),
                  // Volunteering Highlight Card
                  Text(
                    "Come Join the Volunteering Team",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: secondaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
