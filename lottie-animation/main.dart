import 'package:flutter/material.dart';

import 'asset_lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo Home Page',
      debugShowCheckedModeBanner: false,
      home: AssetLottie(),
    );
  }
}
