import 'package:intl/intl.dart';

extension DateFormatTryParse on DateFormat {
  DateTime? tryParse(String inputString, [bool utc = false]) {
    try {
      return parse(inputString, utc);
    } on FormatException {
      return null;
    }
  }
}

String dateFromUsJsonDate(String text) {
  var data = DateFormat('yyyy-MM-dd').parse(text);
  return DateFormat('dd/MM/yyyy').format(data);
}
