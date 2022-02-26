import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic_audio_player/colors.dart';

class TrackImage extends StatelessWidget {
  const TrackImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.all(10),
      style: const NeumorphicStyle(
        color: backgroundColor,
        depth: 32,
        intensity: 0.8,
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.flat,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              "assets/images/flower.jpg",
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
