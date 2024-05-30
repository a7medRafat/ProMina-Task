import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child, required this.backGround});

  final Widget child;
  final String backGround;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            height: double.infinity,
            width: double.infinity,
            backGround,
            fit: BoxFit.cover,
          ),
          child
        ],
      ),
    );
  }
}
