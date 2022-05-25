import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  late String _name;
  // late String _email;
  late String _id;

  // Metodos GET and SET para el nombre del usuario logeado
  String get name {
    return _name;
  }

  set name(String nombre) {
    this._name = nombre;
    notifyListeners();
  }

  // Metodos GET and SET para el id del usuario logeado
  String get id {
    return _id;
  }

  set id(String id) {
    this._id = id;
    notifyListeners();
  }
}
