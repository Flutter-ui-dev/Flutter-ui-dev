import 'package:flutter/material.dart';
import 'package:nft/widgets/image_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010101),
      body: Stack(
        children: [
          Positioned.fill(
            child: ShaderMask(
              blendMode: BlendMode.dstOut,
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.9),
                    Colors.black,
                  ],
                  stops: const [0, 0.62, 0.67, 0.85, 1],
                ).createShader(rect);
              },
              child: SingleChildScrollView(
                child: Column(
                  children: const <Widget>[
                    SizedBox(height: 30),
                    ImageListView(
                      startIndex: 1,
                      duration: 25,
                    ),
                    SizedBox(height: 10),
                    ImageListView(
                      startIndex: 11,
                      duration: 45,
                    ),
                    SizedBox(height: 10),
                    ImageListView(
                      startIndex: 21,
                      duration: 65,
                    ),
                    SizedBox(height: 10),
                    ImageListView(
                      startIndex: 31,
                      duration: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 24,
            right: 24,
            child: Container(
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Art with NFTs',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Check out this raffle for you guys only! new coin minted show some love.',
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.2,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 140,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff3000ff),
                    ),
                    child: const Text(
                      'Discover',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
