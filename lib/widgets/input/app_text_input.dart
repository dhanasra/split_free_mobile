import 'package:components/components.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import '../../utils/font_utils.dart';

class AppTextInput {

  static Widget textInputModern({
    required String hintText,
    required IconData icon,
    required TextEditingController controller,
    String? suffixText,
    VoidCallback? suffixTextClick,
    ValueChanged? onChanged,
    List<double>? margin,
    bool isEnabled = true
  }){
    return  RichRow(
      margin: margin ?? const [20,5],
      children: [
        Icon(icon,size: 20,),
        Flexible(
          child: TextInput(
            isEnabled: isEnabled,
            onChanged: onChanged,
            controller: controller,
            enabledBorderWidth: 2,
            focusedBorderWidth: 2,
            margin: const [15,0,0,0],
            textHeight: 1.4,
            contentPadding: const [5,10],
            isClassic: true,
            hintText: hintText,
            suffixText: suffixText!=null
                ? SizedBox(
                    child: InkWell(
                      onTap: suffixTextClick??()=>{},
                      child: Content(
                        text: suffixText,
                        margin: const [0,0,12,0],
                        color: ColorUtils.BUTTON_COLOR_SECONDARY,
                        fontSize: FontUtils.FONT_SIZE_TEXT_SMALL_MID,
                        fontFamily: FontUtils.FONT_FAMILY,
                        fontWeight: FontUtils.FONT_WEIGHT_HEADER,
                      ),
              ),
            ):null,
            fontSize: FontUtils.FONT_SIZE_TEXT,
            fontFamily: FontUtils.FONT_FAMILY,
            fontWeight: FontUtils.FONT_WEIGHT_TEXT,
          ),
        )
      ],
    );
  }

}