import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/widgets/blur_effect.dart';

class BottomIcon extends StatelessWidget {
  const BottomIcon({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final bool isSelected;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlurEffect(
          borderRadius: 100,
          child: Container(
            width: 60.r,
            height: 60.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: isSelected ? Colors.white : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 80,
                  offset: const Offset(1, 10),
                )
              ],
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.black : Colors.white,
              size: 20.r,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        BlurEffect(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12.r,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}
