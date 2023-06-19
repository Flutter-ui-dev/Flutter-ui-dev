import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

import 'card_model.dart';
import 'card_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:
              GoogleFonts.poppinsTextTheme(const TextTheme().copyWith())),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 4;
  SwipeableCardSectionController _cardController =
      SwipeableCardSectionController();

  List<CardModal> cardQuestion = [
    CardModal(
      color: Colors.orange,
      question:
          "What is the name of the Infinity Stone that is featured in the movie Doctor Strange?",
      answer: "The Time Stone",
    ),
    CardModal(
      color: Colors.blueAccent,
      question:
          "What is the name of the Infinity Stone that is featured in the movie Doctor Strange?",
      answer: "The Time Stone",
    ),
    CardModal(
      color: Colors.pinkAccent,
      question:
          "What is the name of the Infinity Stone that is featured in the movie Doctor Strange?",
      answer: "The Time Stone",
    ),
    CardModal(
      color: Colors.redAccent,
      question: "Black Panther is set in which fictional country?",
      answer: "Wakanda",
    ),
    CardModal(
      color: Colors.indigo,
      question: "Natasha Romanoff tells Loki she's got what in her ledger?",
      answer: "Red",
    ),
    CardModal(
      color: Colors.purpleAccent,
      question: "Thor's Mjolnir is made from the metal of a dying ___?",
      answer: "Star",
    ),
    CardModal(
      color: Colors.deepOrange,
      question: "Pym Particles were created by who?",
      answer: "Hank Pym",
    ),
  ];
  @override
  void initState() {
    super.initState();
    _cardController = SwipeableCardSectionController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Flashcards"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SwipeableCardsSection(
            cardController: _cardController,
            context: context,
            //add the first 3 cards
            items: cardQuestion
                .map((card) => FlipCard(
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL, // default
                    side: CardSide.FRONT,
                    front: CardView(
                      text: card.question,
                      color: card.color,
                    ),
                    back: CardView(
                      text: card.answer,
                      color: card.color,
                      isFront: false,
                    )))
                .toList(),
            onCardSwiped: (dir, index, widget) {
              final r = Random();
              int ranIdx = r.nextInt(cardQuestion.length);
              final card = cardQuestion[ranIdx];
              //Add the next card
              _cardController.addItem(FlipCard(
                  fill: Fill
                      .fillBack, // Fill the back side of the card to make in the same size as the front.
                  direction: FlipDirection.HORIZONTAL, // default
                  side: CardSide.FRONT,
                  front: CardView(
                    text: card.question,
                    color: card.color,
                  ),
                  back: CardView(
                    text: card.answer,
                    color: card.color,
                    isFront: false,
                  )));
            },
            enableSwipeUp: true,
            enableSwipeDown: false,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () => _cardController.triggerSwipeLeft(),
                  child: Image.asset(
                    "assets/delete.png",
                    color: Colors.red,
                    width: 25,
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () => _cardController.triggerSwipeRight(),
                  child: Image.asset(
                    "assets/check.png",
                    color: Colors.green,
                    width: 30,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
