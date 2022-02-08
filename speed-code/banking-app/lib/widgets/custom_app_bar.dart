import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/images/user.jpeg',
            width: 45.r,
            height: 45.r,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 15.w),
        Text(
          'Anthony Jones',
          style: TextStyle(
            fontSize: 18.r,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.settings,
          color: Colors.black87,
        ),
      ],
    );
  }
}
