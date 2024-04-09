import 'package:flutter/material.dart';
import 'package:worder/ui_assets/my_assets/colors.dart';
import 'botom_sheet_base.dart';

class BotomSheetElements extends StatelessWidget {
  const BotomSheetElements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? searchText; // Changed to nullable as it may initially be null
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
                        color: AppColors.shadowColor.withOpacity(0.1),
                        border:
                            Border.all(color: AppColors.mainColor, width: 1.0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        autofocus: true,
                        onChanged: (value) {
                          searchText = value;
                        },
                        decoration: const InputDecoration(
                            hintText: "Enter your word to find rhymes...",
                            hintStyle: TextStyle(color: AppColors.greyColor),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            border: OutlineInputBorder(
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
                    color: AppColors.mainColor,
                    border: Border.all(
                        color: AppColors.transparentColor, width: 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    color: AppColors.whiteColor,
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      /// do search action
                      Navigator.of(context).pop(searchText);
                    },
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
            separatorBuilder: (context, _) => const Divider(height: 0, color: Colors.transparent,),
            itemCount: 15,
          ))
        ],
      ),
    );
  }
}