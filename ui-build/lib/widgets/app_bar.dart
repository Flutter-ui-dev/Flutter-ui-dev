import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neumorphismtest/animations/animations.dart';
import 'package:neumorphismtest/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Hero(
          tag: 'app_name',
          child: Material(
            color: Colors.transparent,
            child: Text(
              'One Finance',
              style: TextStyle(
                fontSize: 22.r,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        //Image
        Neumorphic(
          padding: const EdgeInsets.all(8),
          duration: const Duration(milliseconds: 1000),
          style: const NeumorphicStyle(
            depth: 2,
            color: bgColor,
            intensity: 2,
            surfaceIntensity: 1,
            shape: NeumorphicShape.concave,
          ),
          child: SvgPicture.asset(
            'assets/icons/user.svg',
            allowDrawingOutsideViewBox: true,
            placeholderBuilder: (context) => SizedBox(
              width: 20.r,
              height: 20.r,
            ),
            width: 20.r,
            height: 20.r,
          ),
        ),
      ],
    );
  }
}
