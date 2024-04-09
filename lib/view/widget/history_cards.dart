import 'package:flutter/material.dart';
import 'package:worder/view/widget/view.dart';

class HistoryCards extends StatelessWidget {
  const HistoryCards({
    super.key,
    required this.rhymes,
    required this.maxLines,
    required this.width, 
    required this.searchWord,
  });

  final int maxLines;
  final List<String> rhymes;
  final double width;
  final String searchWord;

  @override
  Widget build(BuildContext context) {
    return BasicContainer(
      width: width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
      child: Column(
        children: [
          Text(
            searchWord,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black.withOpacity(0.9),
              fontWeight: FontWeight.w700,
            ),
          ),
          Flexible(
              child: Text(
            rhymes.asMap().entries.map((e) {
              final sb = StringBuffer();
              sb.write(e.value);
              if (e.key != rhymes.length - 1) {
                sb.write(',  ');
              }
              return sb.toString();
            }).join(),
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ))

          // Wrap(
          //   spacing: 15,
          //   children: rhymes.map((e) => Text(e)).toList(),
          //    ///  another  way to use spacing:
          //    // rhymes.map((e) => Padding(
          //    //           padding: const EdgeInsets.only(right: 5),
          //    //           child: Text(e),
          //    //         ))
          //    //     .toList(),
          // ),
        ],
      ),
    );
  }
}
