// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:flutter_svg/svg.dart';

class CIcons {
  ///From Material Library Icon
  static Widget fromMaterial({
    required IconData icon,
    required String semanticLabel,
    Color? color,
    double? size,
  }) {
    return Icon(
      icon,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }

  ///Custom Svg icon from asset
  static Widget fromSvg({
    required String iconPath,
    required String semanticLabel,
    Color? color,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      iconPath,
      width: width,
      height: height,
      color: color,
      semanticsLabel: semanticLabel,
    );
  }
}
