import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nftapp/animations/page_transition.dart';
import 'package:nftapp/constants.dart';
import 'package:nftapp/screens/onboarding_screen.dart';

import '../animations/slide_animation.dart';
import 'nft_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double _padding = 24;

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: const _AppBar(),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: const _Header(),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: const SlideAnimation(child: _CategoryList()),
            ),
            SizedBox(height: 24.h),
            SlideAnimation(
              begin: Offset(400.w, 0),
              child: SizedBox(
                height: 500,
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              child: const NFTScreen(),
                              type: PageTransitionType.fadeIn,
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20.w),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'A. ',
                                    style: TextStyle(
                                      fontSize: 20.r,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Text(
                                    'DAY 74',
                                    style: TextStyle(
                                      fontSize: 14.r,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '@Mark Rise',
                                    style: TextStyle(
                                      fontSize: 14.r,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Hero(
                                tag: '$index',
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        index % 2 == 0
                                            ? 'assets/images/image-0.jpg'
                                            : 'assets/images/image-1.jpeg',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  EventStat(
                                    title: '20h: 25m: 08s',
                                    subtitle: 'Remaining Time',
                                  ),
                                  EventStat(
                                    title: '15.97 ETH',
                                    subtitle: 'Highest Bid',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        iconSize: 22.r,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: BottomIcon(
              icon: Iconsax.home_15,
              isActive: true,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(icon: Iconsax.discover_1),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(icon: Iconsax.add_square),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(icon: Iconsax.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: BottomIcon(icon: Iconsax.wallet_3),
            label: 'Wallet',
          ),
        ],
      ),
    );
  }
}

class BottomIcon extends StatelessWidget {
  const BottomIcon({Key? key, required this.icon, this.isActive = false})
      : super(key: key);
  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Divider(
          thickness: 2,
          indent: 25.w,
          endIndent: 25.w,
          color: isActive ? Colors.black : Colors.transparent,
        )
      ],
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({Key? key}) : super(key: key);

  final List<String> _options = const [
    'Trending',
    'Digital Arts',
    '3D Videos',
    'Games',
    'Collections',
    'Lands',
    'Real Estate',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _options.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: index == 0 ? Colors.black : null,
            ),
            padding: EdgeInsets.only(
              left: 22.w,
              right: index == 0 ? 22.w : 0,
            ),
            child: Center(
              child: Text(
                _options[index],
                style: TextStyle(
                  fontSize: 14.r,
                  color: index == 0 ? Colors.white : Colors.black54,
                  fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Live',
              style: bodyTextStyle,
            ),
            SizedBox(height: 8.h),
            Text(
              'Auctions',
              style: TextStyle(
                fontSize: 26.r,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              'Enjoy! The latest hot acutions',
              style: bodyTextStyle,
            ),
          ],
        ),
        const Icon(Iconsax.setting_4),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppLogo(),
        Container(
          width: 40.r,
          height: 40.r,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/profile.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
