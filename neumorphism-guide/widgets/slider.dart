import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic_audio_player/colors.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({Key? key}) : super(key: key);

  get primarybuttonColor => null;

  @override
  Widget build(BuildContext context) {
    return NeumorphicSlider(
      value: 30,
      min: 0,
      max: 50,
      height: 8,
      thumb: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primarybuttonColor,
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: trackColor,
          ),
        ),
      ),
      style: const SliderStyle(
        depth: 2,
        accent: trackAccentColor,
        variant: trackVarientColor,
      ),
    );
  }
}
