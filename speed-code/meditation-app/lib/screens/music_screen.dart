import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meditation/animations/animations.dart';
import 'package:meditation/widgets/blur_effect.dart';
import 'package:meditation/widgets/music_tile.dart';
import 'package:meditation/widgets/wave_clip.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ScaleAnimation(
              begin: 1.1,
              child: ClipPath(
                clipper: WaveClip(),
                child: Container(
                  width: double.infinity,
                  height: ScreenUtil().screenHeight * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/tree.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BlurEffect(
                    child: Container(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Back Button
          Positioned(
            top: 40.h,
            left: 10.w,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),

          //Main Body
          Positioned(
            top: 110.h,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    'Killing Anxiety',
                    style: TextStyle(
                      fontSize: 26.r,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: ScreenUtil().screenWidth * 0.8,
                    child: Text(
                      'Calm your anxieties, reduce tension and increase body awarness',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.r,
                        height: 1.5,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ScaleAnimation(
                    begin: 0.8,
                    child: Container(
                      width: 180.r,
                      height: 180.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/yoga.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'by Tony Lane',
                    style: TextStyle(
                      fontSize: 14.r,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    thickness: 0.75,
                    indent: ScreenUtil().screenWidth * 0.25,
                    endIndent: ScreenUtil().screenWidth * 0.25,
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: SlideAnimation(
                      begin: const Offset(0, 100),
                      child: Column(
                        children: <Widget>[
                          const MusicTile(
                            title: 'Behaviour of Mind',
                            length: '2:04',
                            isLocked: false,
                          ),
                          SizedBox(height: 20.h),
                          const MusicTile(
                            title: 'Your Inner Voice',
                            length: '1:56',
                          ),
                          SizedBox(height: 20.h),
                          const MusicTile(
                            title: 'Embrace your emotions',
                            length: '3:12',
                          ),
                          SizedBox(height: 20.h),
                          const MusicTile(
                            title: 'Letting go of everything',
                            length: '2:37',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Play Button
          Positioned.fill(
            bottom: 30.h,
            left: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 80.r,
                height: 80.r,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(2, 6),
                        blurRadius: 50,
                        color: Colors.green.shade200.withOpacity(0.1),
                      ),
                    ]),
                child: Icon(
                  Icons.play_arrow,
                  size: 25.r,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          //Bottom Gradient
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SlideAnimation(
              begin: const Offset(0, 50),
              intervalEnd: 0.6,
              child: Container(
                height: 140.h,
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.green.shade100,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '2:30',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          'Rainforest-Relaxing',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.r,
                          ),
                        ),
                        Text(
                          '-0:50',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ],
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
