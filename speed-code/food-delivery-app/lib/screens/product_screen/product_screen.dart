import 'package:flutter/material.dart';
import 'package:foodie/core/animations/fade_animation.dart';
import 'package:foodie/core/animations/scale_animation.dart';
import 'package:foodie/core/animations/slide_animation.dart';
import 'package:foodie/core/utils/navigation.dart';
import 'package:foodie/core/utils/size_config.dart';
import 'package:foodie/core/utils/ui_helper.dart';
import 'package:foodie/core/widgets/app_bar/custom_app_bar.dart';
import 'package:foodie/core/widgets/button/buttons.dart';
import 'package:foodie/screens/product_screen/widgets/product_info_text.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late double _height;

  final _duration = const Duration(milliseconds: 750);
  final _psudoDuration = const Duration(milliseconds: 150);

  _navigateBack() async {
    await _animateContainerFromBottomToTop();

    Navigation.pop(context);
  }

  _animateContainerFromBottomToTop() async {
    //Animate back to default value
    _height = MediaQuery.of(context).padding.top + rh(50);
    setState(() {});

    //Wait till animation is finished
    await Future.delayed(_duration);
  }

  _animateContainerFromTopToBottom() async {
    //Wait
    await Future.delayed(_psudoDuration);

    //Animate from top to bottom
    _height = MediaQuery.of(context).size.height;
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //Default height

    _height = MediaQuery.of(context).padding.top + rh(50);
    setState(() {});

    //Animate Container from Top to bottom
    _animateContainerFromTopToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        height: _height,
        duration: _duration,
        padding: EdgeInsets.only(bottom: rh(20)),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                onBackTap: _navigateBack,
              ),
              SizedBox(
                height: 50 * SizeConfig.heightMultiplier,
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 0,
                      bottom: 0,
                      left: -180,
                      child: ScaleAnimation(
                        begin: 0,
                        duration: const Duration(milliseconds: 1000),
                        intervalStart: 0.2,
                        curve: Curves.easeOutBack,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            'assets/images/donut/donut_4.png',
                            width: rw(380),
                          ),
                        ),
                      ),
                    ),

                    //Food Info
                    Positioned.fill(
                      top: rh(40),
                      bottom: 0,
                      right: rw(space4x),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FadeAnimation(
                          duration: const Duration(milliseconds: 1250),
                          child: ScaleAnimation(
                            intervalStart: 0.4,
                            duration: const Duration(milliseconds: 1250),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                ProductInfoText(
                                  text: 'Weight',
                                  value: '400g',
                                ),
                                ProductInfoText(
                                  text: 'Calories',
                                  value: '567 Cal',
                                ),
                                ProductInfoText(
                                  text: 'People',
                                  value: '1 Person',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: space2x),
                child: FadeAnimation(
                  intervalStart: 0.4,
                  duration: const Duration(milliseconds: 1300),
                  child: SlideAnimation(
                    intervalStart: 0.4,
                    begin: const Offset(0, 80),
                    duration: const Duration(milliseconds: 1300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Raspberry Donut',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(height: rh(space1x)),
                        Text(
                          '\$12.95',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Theme.of(context).primaryColorDark,
                                    fontSize: rf(18),
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                        SizedBox(height: rh(space2x)),
                        Text(
                          'lorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetlorem ipsum doremetorem ipsum doremet',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: space2x,
                  vertical: space5x,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Buttons.icon(
                        context: context,
                        icon: Icons.favorite_border,
                        size: 28,
                        iconColor: Theme.of(context).primaryColorDark,
                        top: space2x,
                        left: space2x,
                        right: space2x,
                        bottom: space2x,
                        semanticLabel: 'Favorite',
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: rw(space2x)),
                    Expanded(
                      child: Buttons.flexible(
                        vPadding: 20,
                        borderRadius: 15,
                        context: context,
                        text: 'Add to Cart',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
