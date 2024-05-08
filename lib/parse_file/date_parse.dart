import 'package:intl/intl.dart';

enum CustomDateFormat {
  yyyy_MM_dd_HH_mm_ss_SSS, // app date format
  dd_MM_yyyy_slash,
  dd_MM_yyyy_dot,
  dd_MM_yyyy_space,
  yyyyMMdd,
  dd_MMM_yyyy_space,
  MM_dd_yyyy_slash,
  MM_dd_yyyy_dash,
  yyyy_MM_dd_slash,
  yyyy_MM_dd_dot,
  yyyy_MM_dd_dash,
  MM_dd_yyyy_dot,
  MM_dd_yyyy_HH_mm_ss_dash,
  MM_dd_yyyy_slash_HH_mm_ss,
  yyyy_MM_dd_HH_mm_ss_slash,
  yyyy_MM_dd_dot_HH_mm_ss,
  dd_MM_yyyy_slash_HH_mm_ss,
  dd_MM_yyyy_dash_HH_mm_ss,
  yyMMdd
}


class AdditionalGlobalFormat {

  List<String> _inputFormats = [
    "yyyy-MM-dd HH:mm:ss.SSS",
    "dd/MM/yyyy",
    "dd.MM.yyyy",
    "dd MM yyyy",
    "yyyyMMdd",
    "dd MMM yyyy",
    "MM/dd/yyyy",
    "MM-dd-yyyy",
    "yyyy/MM/dd",
    "yyyy.MM.dd",
    "yyyy-MM-dd",
    "MM.dd.yyyy",
    "MM-dd-yyyy HH:mm:ss",
    "MM/dd/yyyy HH:mm:ss",
    "yyyy/MM/dd HH:mm:ss",
    "yyyy.MM.dd HH:mm:ss",
    "dd/MM/yyyy HH:mm:ss",
    "dd-MM-yyyy HH:mm:ss",
    "yyMMdd",
  ];

  String parseWithFormat(DateTime isoDateString, CustomDateFormat format) {
    switch (format) {
      case CustomDateFormat.yyyy_MM_dd_HH_mm_ss_SSS:
        return DateFormat(_inputFormats[0]).format(isoDateString);
      case CustomDateFormat.dd_MM_yyyy_slash:
        return DateFormat(_inputFormats[1]).format(isoDateString);
      case CustomDateFormat.dd_MM_yyyy_dot:
        return DateFormat(_inputFormats[2]).format(isoDateString);
      case CustomDateFormat.dd_MM_yyyy_space:
        return DateFormat(_inputFormats[3]).format(isoDateString);
      case CustomDateFormat.yyyyMMdd:
        return DateFormat(_inputFormats[4]).format(isoDateString);
      case CustomDateFormat.dd_MMM_yyyy_space:
        return DateFormat(_inputFormats[5]).format(isoDateString);
      case CustomDateFormat.MM_dd_yyyy_slash:
        return DateFormat(_inputFormats[6]).format(isoDateString);
      case CustomDateFormat.MM_dd_yyyy_dash:
        return DateFormat(_inputFormats[7]).format(isoDateString);
      case CustomDateFormat.yyyy_MM_dd_slash:
        return DateFormat(_inputFormats[8]).format(isoDateString);
      case CustomDateFormat.yyyy_MM_dd_dot:
        return DateFormat(_inputFormats[9]).format(isoDateString);
      case CustomDateFormat.yyyy_MM_dd_dash:
        return DateFormat(_inputFormats[10]).format(isoDateString);
      case CustomDateFormat.MM_dd_yyyy_dot:
        return DateFormat(_inputFormats[11]).format(isoDateString);
      case CustomDateFormat.MM_dd_yyyy_HH_mm_ss_dash:
        return DateFormat(_inputFormats[12]).format(isoDateString);
      case CustomDateFormat.MM_dd_yyyy_slash_HH_mm_ss:
        return DateFormat(_inputFormats[13]).format(isoDateString);
      case CustomDateFormat.yyyy_MM_dd_HH_mm_ss_slash:
        return DateFormat(_inputFormats[14]).format(isoDateString);
      case CustomDateFormat.yyyy_MM_dd_dot_HH_mm_ss:
        return DateFormat(_inputFormats[15]).format(isoDateString);
      case CustomDateFormat.dd_MM_yyyy_slash_HH_mm_ss:
        return DateFormat(_inputFormats[16]).format(isoDateString);
      case CustomDateFormat.dd_MM_yyyy_dash_HH_mm_ss:
        return DateFormat(_inputFormats[17]).format(isoDateString);
      case CustomDateFormat.yyMMdd:
        return DateFormat(_inputFormats[18]).format(isoDateString);
      default:
        throw FormatException('Date format not recognized');
    }
  }

  String IsoToFormatDate(String isoDateString,CustomDateFormat customDateFormat) {
    if (isoDateString == null || isoDateString == '') {
      return '';
    }
    DateTime dateTime = DateTime.parse(isoDateString);
    String formattedDate = parseWithFormat(dateTime,customDateFormat);
    return formattedDate;
  }




  String convertToISOFormat(String inputDate) {
    for (String format in _inputFormats) {
      try {
        DateTime parsedDate = DateFormat(format).parseStrict(inputDate);
        String iso8601String = parsedDate.toIso8601String();
        iso8601String = iso8601String.split('.').first;
        iso8601String += 'Z';
        return iso8601String;
      } catch (e) {
        continue;
      }
    }
    return '';
  }

}