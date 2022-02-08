import 'package:bankingapp/animations/scale_animation.dart';
import 'package:bankingapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.h,
          bottom: 30.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                size: 26.r,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20.h),
            ScaleAnimation(
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/card.png',
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 20.w,
                    child: Text(
                      'Andrew Joshep',
                      style: kHeadingStyle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              "DEBIT CARD",
              style: kUpperCase,
            ),
            SizedBox(height: 5.h),
            Text(
              "Exclusive edition",
              style: TextStyle(fontSize: 24.r),
            ),
            SizedBox(height: 15.h),
            const FeatureCard(
              title: 'Premium Service',
              iconPath: 'assets/images/rocket.svg',
              color: kOrange,
            ),
            SizedBox(height: 10.h),
            const FeatureCard(
              title: '2% of daily purchase',
              iconPath: 'assets/images/piggy.svg',
              color: kBlue,
            ),
            SizedBox(height: 10.h),
            const FeatureCard(
              title: 'Up to 10% off while traveling',
              iconPath: 'assets/images/airplane.svg',
              color: kPink,
            ),
            SizedBox(height: 10.h),
            const FeatureCard(
              title: '3% annual interest',
              iconPath: 'assets/images/interest.svg',
              color: kGreen,
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Apply for Card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.r,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16.h,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.color,
  }) : super(key: key);

  final String title;
  final String iconPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 50.r,
          height: 50.r,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          child: SvgPicture.asset(
            iconPath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 15.w,
        ),
        Text(
          title,
          style: kHeadingStyle,
        ),
      ],
    );
  }
}
