import 'package:flutter/cupertino.dart';

class MyContainer extends StatelessWidget {
  const MyContainer(
      {super.key,
      required this.color,
      this.height,
      this.width,
      this.child,
      this.borderRadius,
      this.padding,
      this.margin,
      this.function,
      this.border});

  final Color? color;
  final double? height;
  final double? width;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: borderRadius, border: border, color: color),
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
