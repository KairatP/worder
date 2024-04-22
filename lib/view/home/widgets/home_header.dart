import 'package:flutter/material.dart';
import 'package:rhyme_me/view/widget/history_cards.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            final rhymes = List.generate(14, (index) => "word $index");

            return HistoryCards(
              rhymes: rhymes,
              maxLines: 3,
              width: 150,
              searchWord: "Wordsssssssssssssssssssssssssssssssssssssss",
            );
          }),
    );
  }
}
