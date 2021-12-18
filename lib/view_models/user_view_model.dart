import 'package:pill_case/models/user_model.dart';
import "package:pill_case/view_models/pill_list_view_model.dart";

class UserViewModel {
  final User _user;

  UserViewModel({required User user}) : _user = user;

  PillListViewModel get pills {
    return _user.pills;
  }

  String get email {
    return _user.email;
  }
}
