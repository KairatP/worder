import 'package:flutter/material.dart';
import 'package:rhyme_me/global/ui_assets/my_assets/colors.dart';

import 'botom_sheet_base.dart';

class BotomSheetElements extends StatelessWidget {
  const BotomSheetElements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? searchText;
    final theme = Theme.of(context);
    return BotomSheetBase(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch, // Ensures children expand horizontally
        children: [
          const SizedBox(
            height: 5,
          ),
          // const Divider(height: 3, color: AppColors.blackColor, thickness: 3, indent: 100, endIndent: 100,),
          Container(
            height: 4,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: AppColors.greyColor),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: theme.hintColor.withOpacity(0.1),
                        border:
                            Border.all(color: theme.primaryColor, width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        textInputAction: TextInputAction.search,
                        onSubmitted: (String value) => searchAction(context, value),
                        onChanged: (value) {
                          searchText = value;
                        },
                        decoration: InputDecoration(
                            hintText: "Enter your word to find rhymes...",
                            hintStyle: TextStyle(
                                color: theme.hintColor.withOpacity(0.5)),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    border: Border.all(
                        color: AppColors.transparentColor, width: 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    color: AppColors.whiteColor,
                    icon: const Icon(Icons.search),
                    onPressed: () => searchAction(context, searchText!),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: AppColors.greyColor,
          ),
          Expanded(
              child: ListView.separated(
            padding: const EdgeInsets.only(left: 10),
            itemBuilder: (context, index) => const ListTile(
              title: Text(''),
            ),
            separatorBuilder: (context, _) => const Divider(
              height: 0,
              color: Colors.transparent,
            ),
            itemCount: 15,
          ))
        ],
      ),
    );
  }

  void searchAction(BuildContext context, String value) {
    Navigator.of(context).pop(value);
  }
}
