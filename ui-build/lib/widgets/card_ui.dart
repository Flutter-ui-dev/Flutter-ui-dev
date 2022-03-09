import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neumorphismtest/constant.dart';

import '../data/card_data.dart';

class CardUI extends StatelessWidget {
  const CardUI({
    Key? key,
    required this.card,
  }) : super(key: key);

  final BankCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16.h,
        bottom: 16.h,
        left: 8.w,
        right: 8.w,
      ),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 6),
        curve: Interval(0.4, 1, curve: Curves.fastOutSlowIn),
        duration: const Duration(milliseconds: 950),
        builder: (BuildContext context, double? value, Widget? child) {
          return Neumorphic(
            style: NeumorphicStyle(
              depth: value!,
              color: bgColor,
              intensity: value * 2,
              shape: NeumorphicShape.flat,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        card.cardName,
                        style: TextStyle(
                          fontSize: 12.r,
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/${card.bank}.svg',
                        width: 80.r,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            card.no,
                            style: TextStyle(
                              fontSize: 14.r,
                              letterSpacing: 0.4,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            card.userName,
                            style: TextStyle(
                              fontSize: 14.r,
                              letterSpacing: 0.4,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/icons/${card.cardProvider}.svg',
                        width: 40.r,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
