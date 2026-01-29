import 'package:flutter/material.dart';
import 'package:web_portfolio/utils/constants.dart';

class InlineBulletList extends StatelessWidget {
  const InlineBulletList(this.texts, {this.singleLine = false, super.key});
  final List<String> texts;
  final bool singleLine;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(
          Padding(
            padding: const EdgeInsets.only(top: 2.5, bottom: 2.5),
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
                const SizedBox(width: 15),
                Expanded(
                  child: singleLine
                      ? FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            text,
                            maxLines: 1,
                            softWrap: false,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              color: kCaptionColor,
                            ),
                          ),
                        )
                      : Text(
                          text,
                          maxLines: 10,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: kCaptionColor,
                          ),
                        ),
                ),
              ],
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