import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  const BlurredContainer({super.key, required this.child, required this.width, required this.height});

  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      blur: 10,
      width: width,
      height: height,
      elevation: 4,
      shadowColor: Colors.white24,
      color: Colors.white38,
      padding: const EdgeInsets.all(20),
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: child,
    );
  }
}
