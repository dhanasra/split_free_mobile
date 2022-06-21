import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/dimention_utils.dart';
import '../../utils/font_utils.dart';

class AppButton {

  static Widget commonButton({
    required String text,
    required VoidCallback onClick,
    bool isLoading = false,
    List<double>? margin
  }){
    return PrimaryButton(
      label: isLoading ? '' : text,
      prefix: isLoading ? const Box(
        width: 15,
        height: 15,
        margin: [10,0],
        child: CircularProgressIndicator(color: white,strokeWidth: 4,),
      ) : null,
      color: ColorUtils.BUTTON_TEXT_COLOR_DARK,
      height: DimensionUtils.BUTTON_DEFAULT_HEIGHT,
      fontFamily: FontUtils.FONT_FAMILY,
      fontWeight: FontUtils.FONT_WEIGHT_HEADER,
      radius: DimensionUtils.CORNER_BLUNT_2,
      buttonColor: isLoading ? ColorUtils.BUTTON_COLOR_SECONDARY : ColorUtils.BUTTON_COLOR_PRIMARY,
      margin: margin ?? const [0,0,0,30],
      expanded: true,
      onPressed: isLoading ? (){} : onClick,
      type: 1,
    );
  }

}