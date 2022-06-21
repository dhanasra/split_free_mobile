import 'package:components/components.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/dimention_utils.dart';
import '../../utils/enum_utils.dart';
import '../../utils/font_utils.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.theme,
    this.textTheme,
    this.width,
    this.padding,
    this.margin
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final COLOR_TYPE theme;
  final COLOR_TYPE? textTheme;
  final double? width;
  final List<double>? margin;
  final List<double>? padding;

  @override
  Widget build(BuildContext context) {
    return Box(
      margin: margin??[10,12],
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Box(
            borderColor: ColorUtils.getColor(theme),
            radius: DimensionUtils.CORNER_ROUND,
            alignment: center,
            padding: padding??[0],
            child:  Content(
              text: text,
              width: width??60,
              textAlign: middle,
              fontFamily: FontUtils.FONT_FAMILY,
              fontSize: FontUtils.FONT_SIZE_TEXT_SMALL,
              fontWeight: FontUtils.FONT_WEIGHT_HEADER,
              color: textTheme!=null ? ColorUtils.getColor(textTheme!) : ColorUtils.getColor(theme),
              radius: DimensionUtils.CORNER_ROUND,
            ),
          ),
          onTap: onPressed,
        ),
      ),
    );
  }
}
