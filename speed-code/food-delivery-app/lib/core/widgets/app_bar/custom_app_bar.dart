import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/ui_helper.dart';
import '../../utils/utils.dart';
import '../custom_widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    this.title = '',
    this.isTitleCentered,
    this.hasBackButton = true,
    this.isHeroAnimated = true,
    this.actions,
    this.onBackTap,
    this.showOptions = true,
  });

  ///Title of text
  final String title;

  ///Should the title be centered
  ///
  ///[Default is null]
  final bool? isTitleCentered;

  ///Platform adaptive back icon
  ///
  ///[Default is true]
  final bool hasBackButton;

  ///The widgets are rendered from end
  final List<Widget>? actions;

  ///Is Hero animated
  final bool isHeroAnimated;

  ///Show Action Option
  final bool showOptions;

  final VoidCallback? onBackTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: isHeroAnimated ? 'app_bar' : 'no_hero_animation',
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        padding: EdgeInsets.only(
          top: rh(50),
          left: space2x,
          right: space2x,
          bottom: rh(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                //Back Button
                if (hasBackButton)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: onBackTap ?? () => Navigation.pop(context),
                      child: Row(
                        children: [
                          PlatformIcon(
                            color: showOptions ? Colors.black : Colors.white,
                          ),
                          Text(
                            'Back',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                  fontSize: rf(14),
                                  color:
                                      showOptions ? Colors.black : Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),

                //Main Heading and Title
                Align(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),

                //Actions
                if (showOptions)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CIcons.fromMaterial(
                          icon: Icons.shopping_bag_outlined,
                          semanticLabel: 'Bag',
                        ),
                        SizedBox(width: rw(space3x)),
                        CIcons.fromMaterial(
                          icon: Icons.favorite_outline,
                          semanticLabel: 'Heart',
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            //Back Button
          ],
        ),
      ),
    );
  }
}

class PlatformIcon extends StatelessWidget {
  const PlatformIcon({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Buttons.icon(
      context: context,
      icon: CupertinoIcons.back,
      right: space1x,
      iconColor: color,
      semanticLabel: 'Back',
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // if (Platform.isIOS) {
    //   return Buttons.icon(
    //     context: context,
    //     icon: CupertinoIcons.back,
    //     right: space1x,
    //     iconColor: color,
    //     semanticLabel: 'Back',
    //     onPressed: () {
    //       Navigator.pop(context);
    //     },
    //   );
    // } else {
    //   return Buttons.icon(
    //     context: context,
    //     icon: Icons.arrow_back_sharp,
    //     right: space1x,
    //     iconColor: color,
    //     semanticLabel: 'Back',
    //     onPressed: () {
    //       Navigator.pop(context);
    //     },
    //   );
    // }
  }
}
