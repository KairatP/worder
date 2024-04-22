import 'package:flutter/cupertino.dart';
import 'package:rhyme_me/view/widget/basic_container.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.title,
    required this.toggle,
    required this.style,
    this.onChange,
  });

  final String title;
  final bool toggle;
  final ValueChanged<bool>? onChange;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return BasicContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 8, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: style,
            // style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          CupertinoSwitch(
            value: toggle,
            onChanged: onChange,
          )
        ],
      ),
    );
  }
}
