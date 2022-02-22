import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nftapp/animations/fade_animation.dart';
import 'package:nftapp/animations/slide_animation.dart';
import 'package:nftapp/constants.dart';

class NFTScreen extends StatelessWidget {
  const NFTScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              const _AppBar(),
              SizedBox(height: 32.h),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black26),
                ),
                child: Hero(
                  tag: '1',
                  child: Image.asset(
                    'assets/images/image-1.jpeg',
                    height: 260.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              SlideAnimation(
                intervalStart: 0.4,
                begin: const Offset(0, 30),
                child: FadeAnimation(
                  intervalStart: 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'DAY 74',
                        style: TextStyle(
                          fontSize: 24.r,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/profile.jpg',
                              width: 20.r,
                            ),
                          ),
                          SizedBox(width: 8.h),
                          const Text(
                            '@Mark Rise',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Who we were and what we will become are there, they are around us, they are batting, they are resting and they are being watched...More',
                        style: bodyTextStyle,
                      ),
                      SizedBox(height: 8.h),
                      const Divider(),
                      SizedBox(height: 8.h),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/user.jpeg',
                            width: 40.r,
                            height: 40.r,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: const Text('Highest Bid Placed By'),
                        subtitle: Text(
                          'Merry Rose',
                          style: TextStyle(
                            fontSize: 16.r,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          '15.97 ETH',
                          style: TextStyle(
                            fontSize: 16.r,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      const Button(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Place Bid',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.r,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '20h: 35m: 08s',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.r,
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        SizedBox(width: 16.h),
        Text(
          'Auctions',
          style: TextStyle(
            fontSize: 16.r,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        const Icon(
          Iconsax.heart5,
          color: Colors.red,
        ),
        SizedBox(width: 16.h),
        const Icon(Iconsax.menu_1),
      ],
    );
  }
}
