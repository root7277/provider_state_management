import 'package:provider_state_management/resurs/import.dart';

class Model extends ChangeNotifier {
  List<User> fullName = [];

  void getAddUser(User user) {
    fullName.add(user);
    notifyListeners();
  }

  void getRemoveUser(int index) {
    fullName.removeAt(index);
    notifyListeners();
  }

  void getChangeUser(int id, String changeName, String changePhone) {
    fullName[id].name = changeName;
    fullName[id].phone = changePhone;
    notifyListeners();
  }
}
