import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicTile extends StatelessWidget {
  const MusicTile({
    Key? key,
    required this.title,
    required this.length,
    this.isLocked = true,
  }) : super(key: key);

  final String title;
  final bool isLocked;
  final String length;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isLocked ? Icons.lock : Icons.play_arrow,
          color: Colors.grey,
        ),
        SizedBox(width: 20.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.r,
            color: isLocked ? Colors.grey : Colors.black,
            fontWeight: isLocked ? FontWeight.w600 : FontWeight.w700,
          ),
        ),
        const Spacer(),
        Text(
          length,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 14.r,
          ),
        ),
      ],
    );
  }
}
