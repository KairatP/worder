import 'package:flutter/cupertino.dart';
import 'package:worder/view/widget/basic_container.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key, 
    required this.title, 
    required this.toggle, 
    this.onChange,
  });

  final String title;
  final bool toggle;
  final ValueChanged<bool>? onChange;

  @override
  Widget build(BuildContext context) {
    return BasicContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top:8, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
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
