import 'package:flutter/material.dart';
import 'package:bip39/bip39.dart' as bip39;
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
class Phrase {
  static String getrandomphrase()  {
    String randomMnemonic =  bip39.generateMnemonic();
    print(randomMnemonic);
    return randomMnemonic;
  }
  static List<PhraseCard> getsecretphrases () {
    List<PhraseCard> listPhrase = <PhraseCard>[];
    List<String> randomPhrase = getrandomphrase().split(" ");
    randomPhrase.forEach((element) {
      listPhrase.add(PhraseCard(phrase: element));
    });
    return listPhrase;
  }
}
class ListPhraseView extends StatelessWidget {
  ListPhraseView({Key? key }) : super(key: key);
  final List<PhraseCard> secretphrases = Phrase.getsecretphrases();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      padding: const EdgeInsets.fromLTRB(0,10,10,10),
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
