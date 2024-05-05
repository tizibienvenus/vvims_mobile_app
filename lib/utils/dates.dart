import 'package:intl/intl.dart';

class Dates {

  static String formatDateMDY(DateTime date) {
    final DateFormat formatter = DateFormat('MMMM d, y');
    return formatter.format(date);
  }

  static String formatDateIN(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yy');
    return formatter.format(date);
  }

  static String formatTimeHm(DateTime date) {
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(date);
  }

  static String formatStringDateMDY(String date) {
    var dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('MMMM d, y');
    return formatter.format(dateTime);
  }

  static String formatStringDateIN(String date) {
    var dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('dd/MM/yy');
    return formatter.format(dateTime);
  }

  static String formatStringTimeHm(String date) {
    var dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('HH:mm');
    return formatter.format(dateTime);
  }

  static bool isDateToday(String? date) {
    var dateTime = DateTime.parse(date!);
    final now = DateTime.now();
    final formatter = DateFormat('MMMM d, y');
    final formattedDate = formatter.format(dateTime);
    final formattedToday = formatter.format(now);
    return formattedDate == formattedToday;
  }

  static bool isDateYesterday(String? date) {
    var dateTime = DateTime.parse(date!);
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    return dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day;
  }

  static String? generateDayString(String? date){
    var now = DateTime.now();
    var dateTime = DateFormat("dd/mm/yy").format(DateFormat("dd/mm/yy").parse(date!));
    final today = DateFormat("dd/mm/yy").format(DateTime.now());
    final tomorrow = DateFormat("dd/mm/yy").format(now.add(const Duration(days: 1)));
    if(dateTime == today){
      return 'Today';
    }else if(dateTime == tomorrow ){
      return 'Tomorrow';
    }else{
      return date;
    }
  }


}