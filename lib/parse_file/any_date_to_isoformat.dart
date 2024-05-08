import 'package:intl/intl.dart';

String convertToISOFormat(String inputDate) {
  List<String> inputFormats = [
    "yyyy-MM-dd HH:mm:ss.SSS", // app date format
    "dd/MM/yyyy",
    "dd.MM.yyyy",
    "dd MM yyyy",
    "yyyyMMdd",
    "dd MMM yyyy",
    "MM/dd/yyyy",
    "MM-dd-yyyy",
    "yyyy/MM/dd",
    "yyyy.MM.dd",
    "MM.dd.yyyy",
    "MM-dd-yyyy HH:mm:ss",
    "MM/dd/yyyy HH:mm:ss",
    "yyyy/MM/dd HH:mm:ss",
    "yyyy.MM.dd HH:mm:ss",
    "dd/MM/yyyy HH:mm:ss",
    "dd-MM-yyyy HH:mm:ss",
  ];
  for (String format in inputFormats) {
    try {
      DateTime parsedDate = DateFormat(format).parseStrict(inputDate);
      String iso8601String = parsedDate!.toIso8601String();
      iso8601String = iso8601String.split('.').first;
      iso8601String += 'Z';
      return iso8601String;
    } catch (e) {
      continue;
    }
  }
  return '';
}