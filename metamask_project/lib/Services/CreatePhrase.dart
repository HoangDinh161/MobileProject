import 'package:flutter/material.dart';

class PhraseCard extends StatelessWidget {
  PhraseCard({Key? key, required this.phrase}) : super(key: key);
  final String phrase;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.blue,
            style: BorderStyle.solid,
          )),
      child: Center(
          child: Text(
        phrase,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14, fontFamily: "Roboto"),
      )),
    );
  }
}

class ListPhraseView extends StatelessWidget {
  final List<PhraseCard> secretphrases = [
    PhraseCard(phrase: "race"),
    PhraseCard(phrase: "hard"),
    PhraseCard(phrase: "card"),
    PhraseCard(phrase: "forgot"),
    PhraseCard(phrase: "kiss"),
    PhraseCard(phrase: "height"),
    PhraseCard(phrase: "understand"),
    PhraseCard(phrase: "wood"),
    PhraseCard(phrase: "engineering"),
    PhraseCard(phrase: "technology"),
    PhraseCard(phrase: "game"),
    PhraseCard(phrase: "fall"),
  ];

  ListPhraseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          style: BorderStyle.solid,
          width: 1.0
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridView.builder(
        itemCount: secretphrases.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
            childAspectRatio: 4),
        itemBuilder: (BuildContext context, int index) {
          return secretphrases[index];
        },
      ),
    );
  }
}
