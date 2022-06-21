import 'package:easy_localization/easy_localization.dart';

class DateTimeUtils {

  static getMonth(DateTime date){
    final DateFormat formatter = DateFormat('MMM, yyyy');
    return formatter.format(date);
  }

  static getMonthByIndex(String month){
    return DateFormat('MMM').format(DateTime(0, int.parse(month)+1));
  }


}