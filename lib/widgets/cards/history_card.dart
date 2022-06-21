import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/color_utils.dart';
import '../../utils/font_utils.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
    this.isFirst = false,
    required this.text,
    required this.updatedAt,
    required this.updatedBy
  }) : super(key: key);

  final bool isFirst;
  final String text;
  final String updatedBy;
  final String updatedAt;

  @override
  Widget build(BuildContext context) {
    return Box(
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: crossCenter,
              children: [
                Box(
                  margin: const [0,0,3,5],
                  child: Icon(
                    isFirst ? CupertinoIcons.circle_fill : CupertinoIcons.circle,
                    color: ColorUtils.HIGHLIGHT_COLOR,
                    size: 16,),
                ),
                Flexible(child: Box(bgColor: ColorUtils.HIGHLIGHT_COLOR.withOpacity(0.6),width: 2,margin: const [10,0],))
              ],
            ),
            Box(
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  Content(
                    text: text,
                    color: ColorUtils.TEXT_COLOR_MEDIUM,
                    fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                    fontFamily: FontUtils.FONT_FAMILY,
                    fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                  ),
                  Content(
                    text: updatedBy,
                    color: ColorUtils.TEXT_COLOR_MEDIUM,
                    fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
                    fontFamily: FontUtils.FONT_FAMILY,
                    fontWeight: FontUtils.FONT_WEIGHT_TEXT,
                    margin: const [0,0,10,0],
                  ),
                  Content(
                    text: updatedAt,
                    color: ColorUtils.TEXT_COLOR_MEDIUM,
                    fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
                    fontFamily: FontUtils.FONT_FAMILY,
                    fontWeight: FontUtils.FONT_WEIGHT_TEXT,
                  ),
                ],
              ),
              margin: const [0,0,0,20],
            )
          ],
        ),
      )
    );
  }
}
