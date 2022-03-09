import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphismtest/animations/animations.dart';
import 'package:neumorphismtest/data/card_data.dart';
import 'package:neumorphismtest/widgets/bills_section.dart';
import 'package:neumorphismtest/widgets/card_ui.dart';

import '../widgets/app_bar.dart';
import '../widgets/recent_transactions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  final EdgeInsets _padding = const EdgeInsets.symmetric(horizontal: 16);

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.96);
    super.initState();
  }

  final _duration = const Duration(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Padding(
              padding: _padding,
              child: const CustomAppBar(),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 202.h,
              child: PageView.builder(
                controller: _pageController,
                itemCount: cardData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Hero(
                    tag: "$index",
                    child: CardUI(
                      card: cardData[index],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            SlideAnimation(
              begin: const Offset(0, 20),
              duration: _duration,
              intervalStart: 0.4,
              child: FadeAnimation(
                duration: _duration,
                intervalStart: 0.4,
                child: const BillSection(),
              ),
            ),
            SizedBox(height: 32.h),
            SlideAnimation(
              begin: const Offset(0, 20),
              duration: _duration,
              intervalStart: 0.6,
              child: FadeAnimation(
                duration: _duration,
                intervalStart: 0.6,
                child: const RecentTransactions(),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
