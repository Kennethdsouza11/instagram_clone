import 'package:flutter/cupertino.dart';

import '../../resources/auth_methods.dart';
import '../user.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser =>
      _user!; // We are getting the data of the user using get method. ! is used to say that its not gonna be null.

  //Creating a function to refresh the user everytime
  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
