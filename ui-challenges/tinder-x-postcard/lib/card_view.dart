import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({
    Key? key,
    required this.text,
    this.isFront = true,
    required this.color,
    // required this.currentIdx,
    // required this.totalIdx,
  }) : super(key: key);
  final String text;
  final bool isFront;
  final Color color;
  // final int currentIdx;
  // final int totalIdx;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Text(
                  isFront ? "Question" : "Answer",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                // Text('$currentIdx / $totalIdx')
              ],
            ),
            const Spacer(),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Text(
              "Click to Flip",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
