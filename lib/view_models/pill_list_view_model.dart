import 'package:flutter/material.dart';
import 'package:pill_case/services/firestore_service.dart';
import 'package:pill_case/models/pill_model.dart';
import 'package:pill_case/view_models/pill_view_model.dart';

class PillListViewModel with ChangeNotifier {
  List<PillViewModel> pillViewModels = [];

  void retrievePillViewModels() {
    List pills = FirestoreService().getPills();
    pillViewModels = pills.map((pill) => PillViewModel(pill: pill)).toList();
  }
}
