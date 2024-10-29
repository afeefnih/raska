import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raska/config/components/button2.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, // Set background color from theme
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Spacer(),
            // Splash Image
            Center(
              child: Image.asset(
                'lib/images/splash(3).png',
                fit: BoxFit.cover, // Adjust to fit within bounds
              ),
            ),
            const SizedBox(height: 20), // Space between image and subtitle
            Text(
              'Your kindness spreads compassions',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10), 
            Text(
              'Get started and join the campaign to ensure that no one gies to feel hungry. #ShareTheGoodness!',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),


            const Spacer(),
        
            // Dot Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 1 ? Colors.white : Colors.grey, // Highlight the current dot
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),
            
            MyButton2(
              text: 'Get Started', 
              onTap: () {
                Navigator.pushNamed(context, '/main_page');
              }
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );  }
}