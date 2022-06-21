import 'package:components/components.dart';
import 'package:flutter/material.dart';

import 'color_utils.dart';
import 'enum_utils.dart';
import 'font_utils.dart';
import 'icon_utils.dart';

class SnackBarUtils {

  static void snackBar({
    required BuildContext context,
    required String message,
    COLOR_TYPE type = COLOR_TYPE.DEFAULT
  }){
    Widget content = Content(
      text: message,
      color: ColorUtils.getColor(type),
      bgColor: ColorUtils.BG_COLOR_1,
      fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
      fontFamily: FontUtils.FONT_FAMILY,
      fontWeight: FontUtils.FONT_WEIGHT_HEADER,
      textAlign: start,
      margin: const [5,0,0,0],
      expanded: true,
    );
    SnackBar snackBar = SnackBar(
      content: Row(
        children: [
          IconUtils.getIcon(type),
          Flexible(child: content)
        ],
      ),
      backgroundColor: ColorUtils.BG_COLOR_1,
      elevation: 10,
      behavior: SnackBarBehavior.floating
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}