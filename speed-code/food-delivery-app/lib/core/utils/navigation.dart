// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

class Navigation {
  //Push on next page material page route
  static Future<void> push(
    BuildContext context, {
    Widget? screen,
    String? name,
    Route? customPageTransition,
  }) async {
    if (customPageTransition != null) {
      await Navigator.of(context).push(customPageTransition);
    }
    if (screen != null) {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => screen),
      );
    } else if (name != null) {
      Navigator.of(context).pushNamed(name);
    }
  }

  //Replace current page
  static void pushReplacement(
    BuildContext context, {
    Widget? screen,
    String? name,
    Route? customPageTransition,
  }) {
    if (customPageTransition != null) {
      Navigator.of(context).push(customPageTransition);
    }
    if (screen != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => screen),
      );
    } else if (name != null) {
      Navigator.of(context).pushReplacementNamed(name);
    }
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void popAllAndPush(
    BuildContext context, {
    Widget? screen,
    String? name,
    Route? customPageTransition,
  }) {
    if (customPageTransition != null) {
      Navigator.of(context).pushAndRemoveUntil(
        customPageTransition,
        (Route<dynamic> route) => false,
      );
    }
    if (screen != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => screen),
        (Route<dynamic> route) => false,
      );
    } else if (name != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        name,
        (Route<dynamic> route) => false,
      );
    }
  }

  /// POP until given name and push
  static void popTillNamedAndPush(
    BuildContext context, {
    required String popTill,
    Widget? screen,
    String? name,
    Route? customPageTransition,
  }) {
    if (customPageTransition != null) {
      Navigator.of(context).push(customPageTransition);
    }
    if (screen != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => screen),
        ModalRoute.withName(popTill),
      );
    } else if (name != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        name,
        ModalRoute.withName(popTill),
      );
    }
  }
}
