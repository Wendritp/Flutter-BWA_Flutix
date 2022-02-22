part of 'extensions.dart';

extension DateTimeExtension on DateTime {
  String get dateAndTime => "${this.shortDayName} ${this.day}, ${this.hour}:00";
  String get shortDayName {
    switch (this.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      default:
        return "Sun";
    }
  }

  String get dayName {
    switch (this.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      default:
        return "Sunday";
    }
  }

  String get monthName {
    switch (this.month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'April';
      case 8:
        return 'July';
      case 9:
        return 'August';
      case 10:
        return 'September';
      case 11:
        return 'October';
      case 12:
        return 'November';
      default:
        return "December";
    }
  }
}
