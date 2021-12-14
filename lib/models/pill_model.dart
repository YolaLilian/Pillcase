import 'package:pill_case/enums/pill_status.dart';

class Pill {
  String name;
  DateTime dateTime;
  PillStatus status;

  Pill({required this.name, required this.dateTime, required this.status});
}
