import 'package:flutter/material.dart';

class WinnerScreen extends StatelessWidget {
  const WinnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
          child:
          Image(
              image:
              AssetImage("images/winnerWinner.png")
          )),
    );
  }
}
