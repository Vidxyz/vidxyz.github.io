import 'package:flutter/material.dart';
import 'package:web_portfolio/utils/constants.dart';

class InlineBulletList extends StatelessWidget {
  const InlineBulletList(this.texts, {super.key});
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(
          Padding(
            padding: const EdgeInsets.only(top: 2.5, bottom: 2.5),
            child: IntrinsicWidth(
              child: Row(
                children: [
                  const SizedBox(
                    height: 15,
                    child: SizedBox(
                      width: 7.5,
                      height: 7.5,
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: kCaptionColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: 15,
                          maxHeight: 100
                      ),
                      child: Text(
                        text,
                        maxLines: 3,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: kCaptionColor
                        ),
                      ),
                    ),
                  ),
                  // WidgetUtils.spacer(2)
                ],
              ),
            ),
          )
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgetList,
    );
  }
}