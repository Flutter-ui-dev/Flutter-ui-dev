import 'package:flutter/material.dart';
import 'package:neumorphic_audio_player/colors.dart';

class TrackTimerWidget extends StatelessWidget {
  const TrackTimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "1:22",
          style: TextStyle(
            color: iconColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "3:43",
          style: TextStyle(
            color: iconColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
