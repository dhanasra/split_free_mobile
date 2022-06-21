import 'package:flutter/material.dart';

import 'color_utils.dart';
import 'enum_utils.dart';

class IconUtils {

  static const DEFAULT = Icons.check;
  static const ERROR = Icons.close;
  static const WARNING = Icons.warning_amber_rounded;
  static const INFO = Icons.info_outline;
  static const SUCCESS = Icons.check;
  static const PRIMARY = Icons.star_border;

  static Icon getIcon(COLOR_TYPE type){
    Color iconColor = ColorUtils.getColor(type);
    switch(type){
      case COLOR_TYPE.DEFAULT: return Icon(DEFAULT,color: iconColor,);
      case COLOR_TYPE.ERROR: return Icon(ERROR,color: iconColor,);
      case COLOR_TYPE.WARNING: return Icon(WARNING,color: iconColor,);
      case COLOR_TYPE.INFO: return Icon(INFO,color: iconColor,);
      case COLOR_TYPE.SUCCESS: return Icon(SUCCESS,color: iconColor,);
      case COLOR_TYPE.PRIMARY: return Icon(PRIMARY,color: iconColor,);
      case COLOR_TYPE.TRANSPARENT: return Icon(PRIMARY,color: iconColor,);
      case COLOR_TYPE.WHITE: return Icon(PRIMARY,color: iconColor,);
      case COLOR_TYPE.BLACK: return Icon(PRIMARY,color: iconColor,);
    }
  }

}