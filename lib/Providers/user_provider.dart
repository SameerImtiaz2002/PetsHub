import 'package:flutter/material.dart';
import 'package:petshub/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    firstname: '',
    lastname: '',
    email: '',
    password: '',
    token: '',
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
