import 'package:bankingapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstCard extends StatelessWidget {
  const FirstCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kOrange,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.attach_money,
            size: 24.r,
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'US DOLLAR',
                          style: kUpperCase,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          '\$ 13 528,31',
                          style: kMoneyStyle,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_up_rounded,
                      size: 28.r,
                      color: Colors.black54,
                    ),
                  ],
                ),
                Divider(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'AVAILABLE THIS MONTH',
                      style: TextStyle(
                        fontSize: 10.r,
                        color: Colors.black54,
                      ),
                    ),
                    const Text(
                      '\$ 16 531, 05',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  width: double.infinity,
                  height: 6.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Spent \$ 8 312,31',
                  style: TextStyle(
                    fontSize: 10.r,
                    color: Colors.black54,
                  ),
                ),
                Divider(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Manage',
                      style: kHeadingStyle,
                    ),
                    const Icon(
                      Icons.edit,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
