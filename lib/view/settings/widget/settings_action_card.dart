import 'package:flutter/material.dart';
import 'package:worder/view/widget/view.dart';

class SettingsActionCard extends StatelessWidget {
  const SettingsActionCard({
    super.key,
    required this.title,
    required this.buttonName,
    required this.onTab, 
    required this.buttonColor,
  });

  final String title;
  final String buttonName;
  final Color buttonColor;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return BasicContainer(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      margin: const EdgeInsets.only(top: 8,left: 10, right: 10),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        trailing: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
          ),
          onPressed: onTab,
          child: Text(
            buttonName,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: buttonColor),
          ),
          // Icons.delete,
          // color: AppColors.redColor,
          // size: 32,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        // subtitle: Text(
        //   "The search history has been saved on the cache, you can clean it by using this feature"
        // ),
      ),
    );
  }
}
