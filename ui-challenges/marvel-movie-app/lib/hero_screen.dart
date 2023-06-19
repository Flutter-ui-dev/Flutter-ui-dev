import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marvelmovie/data.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({Key? key, required this.hero}) : super(key: key);

  final dynamic hero;

  @override
  _HeroScreenState createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  double _position = 1500;

  @override
  void initState() {
    _animatePosition();
    super.initState();
  }

  _animatePosition() async {
    await Future.delayed(const Duration(milliseconds: 150));
    _position = 500;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dy > sensitivity) {
            // Down Swipe
            Navigator.pop(context);
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: widget.hero['name']!,
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    int.parse(widget.hero['r']!),
                    int.parse(widget.hero['g']!),
                    int.parse(widget.hero['b']!),
                    1,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -16.h,
              left: -40,
              right: -40,
              child: Hero(
                tag: widget.hero['img']!,
                child: Image.asset(widget.hero['img']!),
              ),
            ),
            Positioned.fill(
              top: 300.h,
              left: 32,
              right: 32,
              child: Hero(
                tag: widget.hero['description']!,
                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.hero['name']!.toUpperCase(),
                        style: TextStyle(
                          fontSize: 32.r,
                          fontFamily: 'Marvel',
                          letterSpacing: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.hero['realname']!,
                        style: TextStyle(
                          fontSize: 14.r,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        widget.hero['description']!,
                        maxLines: 5,
                        style: TextStyle(
                          fontSize: 14.r,
                          color: Colors.grey.shade100,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              top: _position.h,
              left: 0,
              right: 0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  int sensitivity = 8;
                  if (details.delta.dy > sensitivity) {
                    // Down Swipe
                    _position = 500;
                    setState(() {});
                  } else if (details.delta.dy < -sensitivity) {
                    // Up Swipe
                    _position = 280;
                    setState(() {});
                  }
                },
                child: Container(
                  height: 600,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "LATEST NEWS",
                        style: TextStyle(
                          fontSize: 22.r,
                          fontFamily: 'Marvel',
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 120,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: latestImgs.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 16.w),
                          itemBuilder: (context, index) {
                            final img = latestImgs[index];
                            return Container(
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        "RELATED MOVIES",
                        style: TextStyle(
                          fontSize: 22.r,
                          fontFamily: 'Marvel',
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        height: 180,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: relatedMovies.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 16.w),
                          itemBuilder: (context, index) {
                            final img = relatedMovies[index];
                            return Container(
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 64.h,
              left: 32,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Transform.rotate(
                  angle: -pi / 2,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
