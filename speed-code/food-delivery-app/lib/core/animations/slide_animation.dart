import 'package:flutter/material.dart';

///Animates the child
///
///using TweenAnimationBuilder
class SlideAnimation extends StatelessWidget {
  const SlideAnimation({
    Key? key,
    required this.child,
    this.begin = const Offset(250, 0),
    this.end = const Offset(0, 0),
    this.intervalStart = 0,
    this.intervalEnd = 1,
    this.duration = const Duration(milliseconds: 450),
    this.curve = Curves.fastOutSlowIn,
  }) : super(key: key);

  ///Animate from value
  ///
  ///[default value Offset(250,0)]
  final Offset begin;

  ///Animate to value
  ///
  ///[default value Offset(0,0)]
  final Offset end;

  ///Animation delay
  ///
  ///[default is 0]
  final double intervalStart;

  ///Animation delay
  ///
  ///[default is 1]
  final double intervalEnd;

  ///Animation Duration
  ///
  ///[default is 750ms]
  final Duration duration;

  ///Animation Curve
  ///
  ///[default is Curves.fastOutSlowIn]
  final Curve curve;

  ///This widget will be animated
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween<Offset>(begin: begin, end: end),
      duration: duration,
      curve: Interval(intervalStart, intervalEnd, curve: curve),
      child: child,
      builder: (BuildContext context, Offset? value, Widget? child) {
        return Transform.translate(
          offset: value!,
          child: child,
        );
      },
    );
  }
}
