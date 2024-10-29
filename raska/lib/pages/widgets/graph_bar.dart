import 'package:flutter/material.dart';

class GraphBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example of a bar graph or bottle shape
    return Container(
      height: 150,
      width: double.infinity,
      color: Colors.blueGrey[100],
      child: Center(child: Text("Donation Graph Here")),
    );
  }
}
