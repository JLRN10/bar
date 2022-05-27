import 'package:flutter/material.dart';

class CarritoProvider extends ChangeNotifier {
  late String _name;
  late int _cantidad;
  late String _id;

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

  int get cantidad {
    return _cantidad;
  }

  set cantidad(int cantidad) {
    this._cantidad = cantidad;
    notifyListeners();
  }
}
