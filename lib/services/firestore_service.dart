import 'package:pill_case/models/pill_model.dart';

class FirestoreService {
  List getPills() => [
        Pill(name: 'Vitamine A', time: "13:00"),
        Pill(name: 'Vitamine B', time: "16:00")
      ];
}
