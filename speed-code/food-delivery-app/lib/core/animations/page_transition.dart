// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

enum PageTransitionType {
  none,
  fadeIn,
  scaleUp,
  scaleDown,
  scaleDownWithFadeIn,
  scaleUpWithFadeIn,
  fromLeft,
  fromTop,
  fromRight,
  fromBottom
}

class PageTransition extends PageRouteBuilder {
  ///Page to Navigate
  final Widget child;

  ///Transition Duration
  ///
  ///[default is 450ms]
  final Duration duration;

  ///Transition Curve
  ///
  ///[default is Curves.fastOutSlowIn]
  final Curve curve;

  final PageTransitionType type;

  PageTransition({
    required this.child,
    required this.type,
    this.curve = Curves.fastOutSlowIn,
    this.duration = const Duration(milliseconds: 450),
  }) : super(
          transitionDuration: duration,
          pageBuilder: (_, animation, secondaryAnimation) => child,
          //Child var scope is in function
          transitionsBuilder: (_, animation, secondaryAnimation, child) {
            final _animatedCurve =
                CurvedAnimation(parent: animation, curve: curve);
            switch (type) {
              case PageTransitionType.none:
                return child;
              case PageTransitionType.fadeIn:
                return FadeTransition(
                  opacity:
                      Tween<double>(begin: 0, end: 1).animate(_animatedCurve),
                  child: child,
                );
              case PageTransitionType.scaleUp:
                return ScaleTransition(
                  scale:
                      Tween<double>(begin: 0, end: 1).animate(_animatedCurve),
                  child: child,
                );
              case PageTransitionType.scaleDown:
                return ScaleTransition(
                  scale:
                      Tween<double>(begin: 2, end: 1).animate(_animatedCurve),
                  child: child,
                );
              case PageTransitionType.scaleUpWithFadeIn:
                return ScaleTransition(
                  scale:
                      Tween<double>(begin: 0.8, end: 1).animate(_animatedCurve),
                  child: FadeTransition(
                    opacity:
                        Tween<double>(begin: 0, end: 1).animate(_animatedCurve),
                    child: child,
                  ),
                );
              case PageTransitionType.scaleDownWithFadeIn:
                return ScaleTransition(
                  scale:
                      Tween<double>(begin: 1.2, end: 1).animate(_animatedCurve),
                  child: FadeTransition(
                    opacity:
                        Tween<double>(begin: 0, end: 1).animate(_animatedCurve),
                    child: child,
                  ),
                );
              case PageTransitionType.fromTop:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: const Offset(0, 0),
                  ).animate(_animatedCurve),
                  child: child,
                );
              case PageTransitionType.fromLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: const Offset(0, 0),
                  ).animate(_animatedCurve),
                  child: child,
                );
              case PageTransitionType.fromBottom:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: const Offset(0, 0),
                  ).animate(_animatedCurve),
                  child: child,
                );
              case PageTransitionType.fromRight:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: const Offset(0, 0),
                  ).animate(_animatedCurve),
                  child: child,
                );
              default:
                return child;
            }
          },
        );
}
