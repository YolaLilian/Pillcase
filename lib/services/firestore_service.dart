import 'package:pill_case/models/pill_model.dart';
import 'package:pill_case/enums/pill_status.dart';

class FirestoreService {
  List getPills() => [
        Pill(
            name: 'Vitamine A',
            dateTime: DateTime.now(),
            status: PillStatus.completed),
        Pill(
            name: 'Vitamine B',
            dateTime: DateTime(2000, 12, 4, 5, 6, 7),
            status: PillStatus.completed),
        Pill(
            name: 'Vitamine C',
            dateTime: DateTime(2000, 12, 8, 8, 8, 8),
            status: PillStatus.failed),
        Pill(
            name: 'Vitamine D3',
            dateTime: DateTime(2000, 12, 9, 9, 9, 9),
            status: PillStatus.upcoming),
        Pill(
            name: 'Vitamine K',
            dateTime: DateTime(2000, 12, 2, 2, 2, 2),
            status: PillStatus.upcoming),
      ];
}
