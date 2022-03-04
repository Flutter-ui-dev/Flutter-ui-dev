import 'package:flutter/material.dart';
import 'package:nft/animations/fade_animation.dart';
import 'package:nft/widgets/blur_container.dart';

class NFTScreen extends StatelessWidget {
  const NFTScreen({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: image,
                child: Image.asset(image),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: FadeAnimation(
                  intervalEnd: 0.1,
                  child: BlurContainer(
                    child: Container(
                      width: 160,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.1),
                      ),
                      child: const Text(
                        'Digital NFT Art',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: FadeAnimation(
              intervalStart: 0.3,
              child: Text(
                'Monkey #271',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: FadeAnimation(
              intervalStart: 0.35,
              child: Text(
                'Owned by Gennady',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FadeAnimation(
              intervalStart: 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  _InfoTile(title: '3d 5h 23m', subtitle: 'Remaining Time'),
                  _InfoTile(title: '16.7 ETH', subtitle: 'Highest Bid'),
                ],
              ),
            ),
          ),
          const Spacer(),
          FadeAnimation(
            intervalStart: 0.6,
            child: Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff3000ff),
              ),
              child: const FadeAnimation(
                intervalStart: 0.8,
                child: Text(
                  'Place Bid',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
