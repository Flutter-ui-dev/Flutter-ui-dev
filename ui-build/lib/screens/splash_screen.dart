import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neumorphismtest/animations/animations.dart';
import 'package:neumorphismtest/constant.dart';
import 'package:neumorphismtest/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _height = 0;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 450), () {
      _height = MediaQuery.of(context).size.height + 100;
      setState(() {});
    });

    Timer(const Duration(milliseconds: 900), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          child: const HomeScreen(),
          type: PageTransitionType.scaleDownWithFadeIn,
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/icons/app_logo.svg',
                key: UniqueKey(),
                width: 160,
                height: 160,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 650),
                height: _height,
                curve: Curves.fastOutSlowIn,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
