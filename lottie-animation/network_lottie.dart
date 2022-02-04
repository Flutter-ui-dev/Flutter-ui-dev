import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NetworkLottie extends StatelessWidget {
  const NetworkLottie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
          'https://assets8.lottiefiles.com/packages/lf20_kwt1ale5.json',
          width: 100,
          animate: true,
        ),
      ),
    );
  }
}
