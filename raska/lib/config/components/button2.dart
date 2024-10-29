import 'package:flutter/material.dart';
import 'package:raska/config/colors.dart';

class MyButton2 extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  
  const MyButton2({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: secondaryColor,
        borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //text
            Text(
            text,
            style: TextStyle(color: Colors.black),
            ),
      
            const SizedBox(width: 10),
      
            //icon
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
      
          ],
        ) 
      ),
    );
  }

}