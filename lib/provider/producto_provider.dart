import 'package:flutter/cupertino.dart';

class ProductoProvider with ChangeNotifier {
  String _tamanoZapatillaSeleccionado = '7';
  String _colorZapatillaSeleccionado = 'azul.png';

  String get tamanoZapatillaSeleccionado => this._tamanoZapatillaSeleccionado;

  String get colorZapatillaSeleccionado => this._colorZapatillaSeleccionado;

  set tamanoZapatillaSeleccionado(String seleccion) {
    this._tamanoZapatillaSeleccionado = seleccion;
    notifyListeners();
  }

  set colorZapatillaSeleccionado(String color) {
    this._colorZapatillaSeleccionado = color;
    notifyListeners();
  }
}
