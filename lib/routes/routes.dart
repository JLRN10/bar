import 'package:flutter/material.dart';
import 'package:bar/screen/cocktails_screen.dart';
import '../screen/carrito_screen.dart';
import '../screen/drinks_screen.dart';
import '../screen/main_screen.dart';
import '../screen/options_screen.dart';
import '../screen/snacks_screen.dart';
import '../screen/detail_cocktail_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/main': (BuildContext context) => OptionsScreen(),
    '/cocktails': (BuildContext context) => CocktailScreen(),
    '/drinks': (BuildContext context) => DrinkScreen(),
    '/snacks': (BuildContext context) => SnackScreen(),
    '/detailCocktail': (BuildContext context) => DetailCocktailScreen(),
    '/carrito': (BuildContext context) => CarritoScreen(),
  };
}
