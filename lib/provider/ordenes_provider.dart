import 'package:flutter/material.dart';

import '../models/bebida_model.dart';

class OrdenesProvider extends ChangeNotifier {
  List<BebidaModelo> bebidas = [];
  List<BebidaModelo> snacks = [];
  List<BebidaModelo> botellas = [];
  List<BebidaModelo> Ordenes = [];

  //  Agregar bebidas a la lista
  addbebidas(BebidaModelo bebida) {
    bebidas.add(bebida);
  }

  //  Eliminar bebidas a la lista
  deletebebidas(BebidaModelo bebida) {
    bebidas.remove(bebida);
  }
}
