import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data.dart';
import 'hero_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;

  double _pageOffset = 1;
  double _offset = 0;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: 1,
    );

    _pageController.addListener(() {
      setState(() {
        _pageOffset = _pageController.page!;
        _offset = _pageController.offset;
      });
    });
    super.initState();
  }

  _navigate(hero) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return HeroScreen(hero: hero);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.arrow_back_ios),
                Icon(CupertinoIcons.search, size: 26),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MARVEL',
                  style: TextStyle(
                    fontSize: 32.r,
                    fontFamily: 'Marvel',
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  'Super hero',
                  style: TextStyle(
                    fontSize: 14.r,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 4,
              itemBuilder: (context, index) {
                final val = ((_pageOffset.abs() - index)).abs();
                final scale = 1 - ((val * 0.1)).clamp(0, 1);

                final parallax = (1 - val) * 50;

                final hero = superheros[index];

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w),
                  child: GestureDetector(
                    onTap: () {
                      _navigate(hero);
                    },
                    onVerticalDragUpdate: (details) {
                      int sensitivity = 8;
                      if (details.delta.dy < -sensitivity) {
                        // Up Swipe
                        _navigate(hero);
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform.scale(
                          scale: scale * 1.0,
                          child: Hero(
                            tag: hero['name']!,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 0.w),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              width: 400,
                              height: 500,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromRGBO(
                                    int.parse(hero['r']!),
                                    int.parse(hero['g']!),
                                    int.parse(hero['b']!),
                                    1),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 230.h,
                          left: 16.w,
                          right: 16.w,
                          child: Hero(
                            tag: hero['description']!,
                            child: Material(
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    hero['name']!.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 32.r,
                                      fontFamily: 'Marvel',
                                      letterSpacing: 1.5,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    hero['realname']!,
                                    style: TextStyle(
                                      fontSize: 14.r,
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    hero['description']!,
                                    maxLines: 5,
                                    style: TextStyle(
                                      fontSize: 14.r,
                                      color: Colors.grey.shade100,
                                      height: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 85.h,
                          left: 0,
                          right: 0,
                          child: Transform.rotate(
                            angle: pi / 2,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -40,
                          left: 10 - parallax,
                          right: 10 - parallax,
                          child: Hero(
                            tag: hero['img']!,
                            child: Image.asset(
                              hero['img']!,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
