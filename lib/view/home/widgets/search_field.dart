import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key, 
    required this.onTab,
  });

  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15)
              .copyWith(bottom: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            const Icon(Icons.search_rounded,
            color: Colors.white,
            ),
            const SizedBox(width: 12),
            Text(
              'Search, rhymes...',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ])),
    );
  }
}