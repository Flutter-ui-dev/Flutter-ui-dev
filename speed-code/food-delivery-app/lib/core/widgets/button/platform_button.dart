import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Smart Widget
///
///Performs Check of platform
///
///and returns appropriate widget
class PlatformButton extends StatelessWidget {
  const PlatformButton({
    required this.child,
    required this.onPressed,
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor,
    this.padding,
    this.width,
    this.height,
    this.isDisabled = false,
  });

  ///Child Widget
  final Widget child;

  ///Background color of button
  final Color? backgroundColor;

  ///Min width of button
  final double? width;

  ///Height of the button
  final double? height;

  ///[Intital Value is false]
  final bool isDisabled;

  ///Default Padding of material and IOS are given
  final EdgeInsetsGeometry? padding;

  ///Border Radius of Button
  ///
  ///[Initial value is 0]
  final BorderRadius borderRadius;

  ///Onpressed Callback function
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    //Check for the platform
    if (Platform.isAndroid) {
      //Return android button
      return MaterialButton(
        minWidth: width ?? 0,
        height: height ?? 0,
        // splashColor: Colors.transparent,
        padding: padding,
        elevation: 0,
        color: backgroundColor,
        disabledColor: Theme.of(context).disabledColor,
        // disabledColor: Theme.of(context).primaryColor.withOpacity(0.1),
        onPressed: isDisabled ? null : onPressed,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        child: child,
      );
    } else {
      //Return Cupertino Button
      return SizedBox(
        height: height,
        width: width,
        child: CupertinoButton(
          minSize: null,
          padding: padding,
          borderRadius: borderRadius,
          disabledColor: Theme.of(context).disabledColor,
          color: backgroundColor,
          onPressed: isDisabled ? null : onPressed,
          child: child,
        ),
      );
    }
  }
}
