import 'package:bankingapp/animations/animations.dart';
import 'package:bankingapp/animations/fade_animation.dart';
import 'package:bankingapp/animations/slide_animation.dart';
import 'package:bankingapp/constants.dart';
import 'package:bankingapp/widgets/bottom_nav_bar.dart';
import 'package:bankingapp/widgets/custom_app_bar.dart';
import 'package:bankingapp/widgets/first_card.dart';
import 'package:bankingapp/widgets/second_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'card_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 50.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const CardScreen(),
                            type: PageTransitionType.fromBottom,
                          ),
                        );
                      },
                      child: const CustomAppBar(),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Accounts',
                      style: kHeadingStyle,
                    ),
                    SizedBox(height: 10.h),
                    const FadeAnimation(
                      intervalStart: 0.2,
                      child: FirstCard(),
                    ),
                    SizedBox(height: 15.h),
                    const FadeAnimation(
                      intervalStart: 0.3,
                      child: SecondCard(),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Recent Payments',
                      style: kHeadingStyle,
                    ),
                    SizedBox(height: 15.h),
                    SlideAnimation(
                      begin: const Offset(0, 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'TODAY',
                            style: kUpperCase,
                          ),
                          SizedBox(height: 5.h),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: SvgPicture.asset(
                              'assets/images/atnt.svg',
                              width: 30.r,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              'AT&T',
                              style: kHeadingStyle,
                            ),
                            subtitle: Text(
                              'Unlimited Family Plan',
                              style: TextStyle(fontSize: 11.r),
                            ),
                            trailing: Text(
                              '- \$ 35',
                              style: kMoneyStyle.copyWith(fontSize: 14.r),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'YESTERDAY',
                            style: kUpperCase,
                          ),
                          SizedBox(height: 5.h),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: SvgPicture.asset(
                              'assets/images/blizzard.svg',
                              width: 30.r,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              'Blizzard Entertainment',
                              style: kHeadingStyle,
                            ),
                            subtitle: Text(
                              '6 Month Subscription',
                              style: TextStyle(fontSize: 11.r),
                            ),
                            trailing: Text(
                              '- \$ 79,89',
                              style: kMoneyStyle.copyWith(fontSize: 14.r),
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: SvgPicture.asset(
                              'assets/images/d&b.svg',
                              width: 30.r,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              'David & Buster\'s',
                              style: kHeadingStyle,
                            ),
                            subtitle: Text(
                              'Restaurents',
                              style: TextStyle(fontSize: 11.r),
                            ),
                            trailing: Text(
                              '- \$ 135,32',
                              style: kMoneyStyle.copyWith(fontSize: 14.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Bottom Bar
          const SlideAnimation(
            begin: Offset(0, 100),
            child: BottomNavBar(),
          ),
        ],
      ),
    );
  }
}
