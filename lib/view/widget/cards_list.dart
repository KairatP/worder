import 'package:flutter/material.dart';
import 'package:rhyme_me/global/ui_assets/my_assets/colors.dart';
import 'package:rhyme_me/view/widget/basic_container.dart';

class CardsList extends StatelessWidget {
  const CardsList({
    required this.isFavorite,
    super.key,
    required this.word,
    this.rhymes,
    required this.tabFavorite,
  });

  final bool isFavorite;
  final String word;
  final String? rhymes;
  final VoidCallback tabFavorite;

  @override
  Widget build(BuildContext context) {
    return BasicContainer(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(children: [
              Flexible(
                // fit: FlexFit.loose,
                child: Text(
                  word,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: AppColors.mainColor,
                ),
              ),
              if (rhymes != null) ...[
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    rhymes!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ]),
          ),
          IconButton(
              onPressed: tabFavorite,
              icon: Icon(
                Icons.favorite,
                color: isFavorite ? AppColors.redColor : AppColors.greyColor,
              ))
        ],
      ),
    );
  }
}
