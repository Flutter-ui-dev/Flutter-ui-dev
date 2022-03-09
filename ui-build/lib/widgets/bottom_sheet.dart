import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphismtest/animations/animations.dart';
import 'package:neumorphismtest/constant.dart';

import '../data/bills_data.dart';
import '../data/card_data.dart';
import '../screens/authorize_payment.dart';
import '../screens/success_screen.dart';
import 'card_ui.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({Key? key, required this.bill}) : super(key: key);

  final Bill bill;

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  late PageController _pageController;

  int _currentIndex = 0;

  double? _height = 350.h;

  bool _isExpanded = false;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.92,
    );
    super.initState();
  }

  _navigate() {
    _height = MediaQuery.of(context).size.height;
    _isExpanded = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 450),
      curve: Curves.fastOutSlowIn,
      height: _height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              curve: Curves.fastOutSlowIn,
              height: _isExpanded ? 60.h : 16.h,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              curve: Curves.fastOutSlowIn,
              height: 190.h,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() {
                  _currentIndex = index;
                }),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Payable Amount',
                        style: TextStyle(
                          fontSize: 14.r,
                          color: greyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Rs. ' + widget.bill.amount,
                        style: TextStyle(
                          fontSize: 16.r,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  _isExpanded
                      ? SlideAnimation(
                          intervalStart: 0.4,
                          begin: const Offset(0, 20),
                          child: FadeAnimation(
                            intervalStart: 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 24.h),
                                const TextTile(
                                  label: 'A/C No',
                                  value: '2485 0234 2341 1123',
                                ),
                                SizedBox(height: 24.h),
                                const TextTile(
                                  label: 'By the Name',
                                  value: 'Maharashtra Electricity Corporation',
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            _height == 350.h
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: NeumorphicButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      style: const NeumorphicStyle(
                        color: bgColor,
                        depth: 8,
                        intensity: 8,
                      ),
                      onPressed: _navigate,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pay With ',
                              style: TextStyle(
                                fontSize: 12.r,
                                letterSpacing: 0.2,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 450),
                              child: Text(
                                cardData[_currentIndex].cardName,
                                key: UniqueKey(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const FadeAnimation(
                    intervalStart: 0.6,
                    duration: Duration(milliseconds: 850),
                    child: AuthorizePayment(),
                  ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class AuthorizePayment extends StatelessWidget {
  const AuthorizePayment({Key? key}) : super(key: key);

  _navigate(context) async {
    await Navigator.push(
      context,
      PageTransition(
        child: const SuccessScreen(),
        type: PageTransitionType.scaleDownWithFadeIn,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32.h),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 8),
          curve: const Interval(0.4, 1, curve: Curves.fastOutSlowIn),
          duration: const Duration(milliseconds: 1500),
          builder: (BuildContext context, double? value, Widget? child) {
            return NeumorphicButton(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              style: NeumorphicStyle(
                color: bgColor,
                depth: value!,
                intensity: value,
                surfaceIntensity: value,
                boxShape: const NeumorphicBoxShape.circle(),
                shape: NeumorphicShape.concave,
              ),
              onPressed: () => _navigate(context),
              child: Center(
                child: Icon(
                  Icons.fingerprint,
                  size: 56.r,
                ),
              ),
            );
          },
        ),
        SizedBox(height: 16.h),
        Text(
          'Authorize Payment',
          style: TextStyle(
            fontSize: 18.r,
            letterSpacing: 0.4,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class TextTile extends StatelessWidget {
  const TextTile({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.r,
            color: greyColor,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.r,
            letterSpacing: 0.4,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
