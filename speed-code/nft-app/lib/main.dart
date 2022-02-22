import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftapp/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () {
        return MaterialApp(
          title: 'NFT App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Dsignes',
            primarySwatch: Colors.blue,
          ),
          home: const OnBoardingScreen(),
        );
      },
    );
  }
}
