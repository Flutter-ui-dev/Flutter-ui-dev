import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer effect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final highlightColor = Color(0xFF696C80);
    final baseColor = Color(0xFF4B4D5C);
    return Scaffold(
      backgroundColor: const Color(0xFF353535),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemBuilder: (_, i) {
            final delay = (i * 300);
            return ShrimmerCard(
                delay: delay,
                highlightColor: highlightColor,
                baseColor: baseColor);
          },
          itemCount: 20,
        ),
      ),
    );
  }
}

class ShrimmerCard extends StatelessWidget {
  const ShrimmerCard({
    Key? key,
    required this.delay,
    required this.highlightColor,
    required this.baseColor,
  }) : super(key: key);

  final int delay;
  final Color highlightColor;
  final Color baseColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          FadeShimmer(
            height: 80,
            width: 80,
            radius: 10,
            // fadeTheme: isDarkMode ? FadeTheme.dark : FadeTheme.light,
            millisecondsDelay: delay,
            highlightColor: highlightColor,
            baseColor: baseColor,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FadeShimmer(
                height: 15,
                width: 100,
                radius: 20,
                millisecondsDelay: delay,
                highlightColor: highlightColor,
                baseColor: baseColor,
                // fadeTheme:
                //     isDarkMode ? FadeTheme.dark : FadeTheme.light,
              ),
              const SizedBox(
                height: 20,
              ),
              FadeShimmer(
                height: 15,
                width: 150,
                radius: 20,
                millisecondsDelay: delay,
                highlightColor: highlightColor,
                baseColor: baseColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
