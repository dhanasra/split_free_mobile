import 'dart:ui';

import 'enum_utils.dart';


class ColorUtils {

  static const APP_COLOR_PRIMARY = Color(0xFF222222);
  static const APP_COLOR_SECONDARY = Color(0xFF37474f);
  static const APP_COLOR_ADITIONAL = Color(0xFF526069);

  static const TEXT_COLOR_DARK = Color(0xFF222222);
  static const TEXT_COLOR_MEDIUM = Color(0xFF37474f);
  static const TEXT_COLOR_LIGHT = Color(0xFF526069);
  static const PROMPT_COLOR = Color(0xFF76838f);
  static const PROMPT_COLOR_LIGHT = Color(0xFFa3afb7);


  static const BUTTON_TEXT_COLOR_DARK = Color(0xFFFFFFFF);
  static const BUTTON_TEXT_COLOR_MEDIUM = Color(0xFFeeeeee);
  static const BUTTON_TEXT_COLOR_LIGHT = Color(0xFFaaaaaa);

  static const BORDER_COLOR_DARK = Color(0xFFa4aaac);
  static const BORDER_COLOR_LIGHT = Color(0xFFe4eaec);

  static const BG_COLOR_1 = Color(0xFFFFFFFF);
  static const BG_COLOR_2 = Color(0xFFdddddd);

  static const ICON_COLOR_DARK = Color(0xFF222222);
  static const ICON_COLOR_MEDIUM = Color(0xFF37474f);
  static const ICON_COLOR_LIGHT = Color(0xFF526069);

  static const HIGHLIGHT_COLOR = Color(0xFF37474f);

  static const BUTTON_COLOR_PRIMARY = Color(0xFF1C4E80);
  static const BUTTON_COLOR_SECONDARY = Color(0xFF5C5CFF);
  static const BUTTON_COLOR_ADITIONAL = Color(0xFF8A8AFF);

  static const DEFAULT = Color(0xFF0F0F0F);
  static const ERROR = Color(0xFFE53E2C);
  static const WARNING = Color(0xFFFFA60D);
  static const INFO = Color(0xFF2999F2);
  static const SUCCESS = Color(0xFF32A64F);
  static const PRIMARY = Color(0xFF008080);
  static const TRANSPARENT = Color(0x00FFFFFF);
  static const BLACK = Color(0xFF000000);
  static const WHITE = Color(0xFFFFFFFF);

  static const CUSTOMER = Color(0xFFF66536);
  static const VENDOR = Color(0xFFDBAE58);

  static Color getColor(COLOR_TYPE type){
    switch(type){
      case COLOR_TYPE.DEFAULT: return DEFAULT;
      case COLOR_TYPE.ERROR: return ERROR;
      case COLOR_TYPE.WARNING: return WARNING;
      case COLOR_TYPE.INFO: return INFO;
      case COLOR_TYPE.SUCCESS: return SUCCESS;
      case COLOR_TYPE.PRIMARY: return PRIMARY;
      case COLOR_TYPE.TRANSPARENT: return TRANSPARENT;
      case COLOR_TYPE.WHITE: return WHITE;
      case COLOR_TYPE.BLACK: return BLACK;
    }
  }


}