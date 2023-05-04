import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:random/app/models/user.dart';
import 'package:random/app/data/repositories/user.dart';

class HomeController extends ChangeNotifier {
  @observable
  final UserRepository _userRepository = UserRepository();

  @action
  Future<ObservableList<User>> fetchUsersData() async {
    final List<User> users = await this._userRepository.getUser();
    return ObservableList.of(users);
  }

  @observable
  ObservableList<User> users;

  @observable
  Future<void> getUsers() async {
    List<User> userList = await fetchUsersData();
    users = ObservableList.of(userList);
    notifyListeners();
  }
}
