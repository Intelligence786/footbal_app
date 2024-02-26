import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String dateTimeFormatPattern = 'dd/MM/yyyy';
const String dateForMatch = 'dd MMM yyyy';
const String timePattern = 'HH.mm';

extension DateTimeExtension on DateTime {
  /// Return a string representing [date] formatted according to our locale
  String format([
    String pattern = dateTimeFormatPattern,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String formatAnother([
    String pattern = dateForMatch,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String time([
    String pattern = timePattern,
    String? locale,
  ]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}
