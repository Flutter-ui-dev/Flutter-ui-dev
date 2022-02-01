import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/animations/animations.dart';
import 'package:meditation/widgets/activity_card.dart';
import 'package:meditation/widgets/blur_effect.dart';
import 'package:meditation/widgets/bottom_icon.dart';
import 'package:meditation/widgets/wave_clip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/images/desert.jpeg'), context);
    precacheImage(const AssetImage('assets/images/sky.jpeg'), context);
    precacheImage(const AssetImage('assets/images/ocean.jpeg'), context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: ScreenUtil().screenHeight * 0.52,
            left: 0,
            child: ScaleAnimation(
              begin: 0.4,
              intervalEnd: 0.8,
              child: ClipPath(
                clipper: WaveClip(),
                child: const ActivityCard(
                  image: 'assets/images/ocean.jpeg',
                  title: 'Sensations',
                  subtitle: 'Feel the moments',
                ),
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().screenHeight * 0.26,
            left: 0,
            child: ScaleAnimation(
              begin: 0.7,
              intervalEnd: 0.6,
              child: ClipPath(
                clipper: WaveClip(),
                child: const ActivityCard(
                  image: 'assets/images/sky.jpeg',
                  title: 'Daydream',
                  subtitle: 'go beyond the Form',
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: ScaleAnimation(
              begin: 0.8,
              intervalEnd: 0.4,
              child: ClipPath(
                clipper: WaveClip(),
                child: const ActivityCard(
                  image: 'assets/images/desert.jpeg',
                  title: 'Meditation',
                  subtitle: 'discover happiness',
                ),
              ),
            ),
          ),

          //APPBAR
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BlurEffect(
              child: Container(
                width: ScreenUtil().screenWidth,
                color: Colors.white.withOpacity(0.2),
                padding: EdgeInsets.only(
                  top: 28.h,
                  bottom: 5.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.queue_music,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(left: 15.w),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(right: 15.w),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //UserImage
          Positioned.fill(
            top: 44.h,
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/user.jpeg',
                  width: 50.r,
                  height: 50.r,
                ),
              ),
            ),
          ),

          Positioned(
            width: ScreenUtil().screenWidth,
            bottom: 30.h,
            child: SlideAnimation(
              begin: const Offset(0, 100),
              child: FadeAnimation(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    BottomIcon(
                      icon: Icons.center_focus_strong,
                      title: 'Focus',
                      isSelected: false,
                    ),
                    BottomIcon(
                      icon: Icons.music_note,
                      title: 'Relax',
                      isSelected: true,
                    ),
                    BottomIcon(
                      icon: Icons.nightlight,
                      title: 'Focus',
                      isSelected: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
