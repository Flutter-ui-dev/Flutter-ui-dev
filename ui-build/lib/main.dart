import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphismtest/constant.dart';
import 'package:neumorphismtest/screens/home_screen.dart';
import 'package:neumorphismtest/screens/splash_screen.dart';
import 'package:neumorphismtest/screens/success_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => MaterialApp(
        title: 'One Finance',
        debugShowCheckedModeBanner: false,

        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        theme: ThemeData(
          fontFamily: "Outfit",
          scaffoldBackgroundColor: bgColor,
        ),
        home: const SplashScreen(),
        // home: SuccessScreen(),
      ),
    );
  }
}
