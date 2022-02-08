import 'package:bankingapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondCard extends StatelessWidget {
  const SecondCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Icon(
            Icons.euro_rounded,
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'EURO',
                style: kUpperCase,
              ),
              SizedBox(height: 5.h),
              Text(
                '€ 5 312,05',
                style: kMoneyStyle,
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.keyboard_arrow_down,
            size: 28.r,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
