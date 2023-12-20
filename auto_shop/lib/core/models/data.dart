import 'package:intl/intl.dart';

class CalendarData {
  final String name;

  final DateTime date;
  final String position;
  final String rating;

  String getDate() {
    final formatter = DateFormat('kk:mm');

    return formatter.format(date);
  }

  CalendarData({
    required this.name,
    required this.date,
    required this.position,
    required this.rating,
  });
}

final List<CalendarData> calendarData = [
  CalendarData(
    name: 'Painter1',
    date: DateTime.now().add(Duration(days: -16, hours: 5)),
    position: "Paint Job",
    rating: '₽',
  ),
  CalendarData(
    name: 'Engine Masters',
    date: DateTime.now().add(Duration(days: -5, hours: 8)),
    position: "Engine Service",
    rating: '₽',
  ),
  CalendarData(
    name: 'Car Doctor',
    date: DateTime.now().add(Duration(days: -10, hours: 3)),
    position: "General Maintenance",
    rating: '\$',
  ),
  CalendarData(
    name: 'Michellene Man',
    date: DateTime.now().add(Duration(days: 6, hours: 6)),
    position: "Tyre Service",
    rating: '\$',
  ),
  CalendarData(
    name: 'Squeky Clean',
    date: DateTime.now().add(Duration(days: -18, hours: 9)),
    position: "Wash",
    rating: '\$',
  ),
  CalendarData(
    name: 'Tinted',
    date: DateTime.now().add(Duration(days: -12, hours: 2)),
    position: "WInd screen And Window service",
    rating: '\$',
  ),
  CalendarData(
    name: 'Clean deal',
    date: DateTime.now().add(Duration(days: -8, hours: 4)),
    position: "Wash",
    rating: '\$',
  ),
  CalendarData(
    name: 'Car Masters',
    date: DateTime.now().add(Duration(days: -3, hours: 6)),
    position: "General Maintenance",
    rating: '₽',
  ),
  CalendarData(
    name: 'Clean Deal',
    date: DateTime.now().add(Duration(days: -2, hours: 6)),
    position: "Wash",
    rating: '₽',
  ),
  CalendarData(
    name: 'Megan Salazar',
    date: DateTime.now().add(Duration(days: -2, hours: 7)),
    position: "Engine Service",
    rating: '₽',
  ),
  CalendarData(
    name: 'Celeste expert',
    date: DateTime.now().add(Duration(days: -14, hours: 5)),
    position: "Tyre",
    rating: '₽',
  ),
];
