import 'package:flutter/material.dart';
import 'package:bip39/bip39.dart' as bip39;
class PhraseCard extends StatelessWidget {
  const PhraseCard({Key? key, required this.phrase}) : super(key: key);
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
            width: 1.5
          )),
      child: Center(
          child: Text(
        phrase,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 13, fontFamily: "Roboto"),
      )),
    );
  }
}
class Phrase {
  String phrases = "";
  Phrase () {
    phrases = bip39.generateMnemonic();
  }

  List<PhraseCard> getsecretphrases () {
    List<PhraseCard> listPhrase = <PhraseCard>[];
    List<String> randomPhrase = phrases.split(" ");
    for (var element in randomPhrase) {
      listPhrase.add(PhraseCard(phrase: element));
    }
    return listPhrase;
  }
  List<String> stringList () {
    return phrases.split(" ");
  }

}
class ListPhraseView extends StatelessWidget {
  ListPhraseView({required this.p,Key? key }) : super(key: key);
  Phrase p;
  @override
  Widget build(BuildContext context) {
    List<PhraseCard> secretphrases = p.getsecretphrases();
    return Container(
      height: 250,
      width: 300,
      padding: const EdgeInsets.fromLTRB(10,0,10,10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          style: BorderStyle.solid,
          width: 2.0
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
