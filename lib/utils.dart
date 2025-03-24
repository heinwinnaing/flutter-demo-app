import 'package:intl/intl.dart';

abstract class Serializable {
  Map<String, dynamic> toJson();
}

class Utils {
  static String displayDate(DateTime date, String format){
    return DateFormat(format).format(date);
  }
  static String textEmptyDisplay(String? text) {
    return (text == null || text == '') ? '-' : text;
  }

  static String numberDisplay(int value) {
    return NumberFormat('#,##,##0').format(value);
  }

  static String cardNumberDisplay(String value) {
    String str = '';
    String d = '';
    for (int i = 0; i < value.length; i++) {
      d += value[i];
      if (d.length == 4) {
        str += ' ';
        str += d;
        d = '';
      }
    }
    return str;
  }
}