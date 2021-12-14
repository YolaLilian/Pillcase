import 'package:pill_case/enums/pill_status.dart';
import 'package:pill_case/models/pill_model.dart';

class PillViewModel {
  final Pill _pill;

  PillViewModel({required Pill pill}) : _pill = pill;

  String get name {
    return _pill.name;
  }

  DateTime get dateTime {
    return _pill.dateTime;
  }

  PillStatus get status {
    return _pill.status;
  }
}
