import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raska/config/components/button2.dart';
import 'package:raska/pages/splash_page(2).dart';

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor, // Set background color from theme
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Spacer(), // Space between image and subtitle
            // Splash Image
            Center(
              child: Image.asset(
                'lib/images/splash(1).png',
                fit: BoxFit.cover, // Adjust to fit within bounds
              ),
            ),
            const SizedBox(height: 20), // Space between image and subtitle
            
            // Subtitle
            Text(
              'Welcome to',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'R A S K A',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 30,              
              )   
            ),

            const SizedBox(height: 10), 

            Text(
              'Sign up to join our community, which is dedicated to eliminating food waste and feeding those in need',
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
                    color: index == 0 ? Colors.white : Colors.grey, // Highlight the current dot
                  ),
                );
              }),
            ),
        
            const SizedBox(height: 20),
            
            MyButton2(
              text: 'Next', 
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const Splash2()
                  ),
                );
              }
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
