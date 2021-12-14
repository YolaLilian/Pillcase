import 'package:pill_case/models/pill_model.dart';

class PillViewModel {
  Pill _pill;

  PillViewModel({required Pill pill}) : _pill = pill;

  String get name {
    return _pill.name;
  }

  String get time {
    return _pill.time;
  }
}
