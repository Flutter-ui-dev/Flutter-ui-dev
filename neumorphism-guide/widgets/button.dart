import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(15.0),
    required this.primaryBgColor,
    required this.secondaryBgColor,
  }) : super(key: key);
  final Widget child;
  final EdgeInsets padding;
  final Color primaryBgColor;
  final Color secondaryBgColor;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: const EdgeInsets.all(2),
      style: NeumorphicStyle(
        color: secondaryBgColor,
        depth: 10,
        intensity: 0.8,
        boxShape: const NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.flat,
      ),
      child: NeumorphicButton(
        minDistance: -10,
        onPressed: () {},
        padding: padding,
        style: NeumorphicStyle(
          boxShape: const NeumorphicBoxShape.circle(),
          color: primaryBgColor,
          shape: NeumorphicShape.convex,
        ),
        child: child,
      ),
    );
  }
}
