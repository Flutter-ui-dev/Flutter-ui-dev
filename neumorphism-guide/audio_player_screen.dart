import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic_audio_player/widgets/button.dart';
import 'package:neumorphic_audio_player/widgets/slider.dart';
import 'package:neumorphic_audio_player/widgets/text_widgets.dart';
import 'package:neumorphic_audio_player/widgets/track_image.dart';

import 'colors.dart';

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      // backgroundColor: Colors.deepOrange,
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),

          // APP BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomButtom(
                  child: Icon(
                    Icons.arrow_back,
                    color: iconColor,
                  ),
                  primaryBgColor: primarybuttonColor,
                  secondaryBgColor: secondaryButtonColor,
                ),
                Text(
                  "Flutter UI Dev",
                  style: TextStyle(
                    color: iconColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomButtom(
                  child: Icon(
                    Icons.menu,
                    color: iconColor,
                  ),
                  primaryBgColor: primarybuttonColor,
                  secondaryBgColor: secondaryButtonColor,
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          // AUDIO TRACK IMAGE

          const TrackImage(),

          const SizedBox(
            height: 40,
          ),

          // TRACK NAME AND DESCRIPTION
          const Text(
            "Lose it",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Flume ft. Vic Mensa",
            style: TextStyle(
              color: iconColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          // TRACK PROGRESS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: const [
                TrackTimerWidget(),
                // Neumorphic slider
                CustomSlider(),
              ],
            ),
          ),

          // TRACK CONTROLL BUTTON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomButtom(
                  padding: EdgeInsets.all(25),
                  child: Icon(
                    Icons.fast_rewind_rounded,
                    color: iconColor,
                  ),
                  primaryBgColor: primarybuttonColor,
                  secondaryBgColor: secondaryButtonColor,
                ),
                CustomButtom(
                  padding: EdgeInsets.all(25),
                  child: Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
                  primaryBgColor: primaryActiveButtonColor,
                  secondaryBgColor: secondaryActiveButtonColor,
                ),
                CustomButtom(
                  padding: EdgeInsets.all(25),
                  child: Icon(
                    Icons.fast_forward_rounded,
                    color: iconColor,
                  ),
                  primaryBgColor: primarybuttonColor,
                  secondaryBgColor: secondaryButtonColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
