import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bar/models/CocktailModel.dart';
import 'package:bar/models/CocktailsModel.dart';

class CocktailAPI {

  var URL_Cockatils = Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail");

  Future<List<CocktailsModel>?> getAllCocktails() async {
    final response1 = await http.get(URL_Cockatils);
    if(response1.statusCode == 200) {
      var cocktails = jsonDecode(response1.body)['drinks'] as List;
      List<CocktailsModel> listCocktails = cocktails.map((pokemon) => CocktailsModel.fromMap(pokemon)).toList();
      return listCocktails;
    }
    else {
      return null;
    }
  }

  Future<CocktailModel?> getCocktail(String id) async {
    String URL_Cockatil = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id";
    final response2 = await http.get(Uri.parse(URL_Cockatil));
    if(response2.statusCode == 200) {
      var cocktailMap = json.decode(response2.body)['drinks'] as List;
      //CocktailModel cocktail = CocktailModel.fromMap(map);
      List<CocktailModel> listCocktail = cocktailMap.map((pokemon) => CocktailModel.fromMap(pokemon)).toList();
      CocktailModel cocktail = listCocktail[0];
      print("Si se pudo");
      return cocktail;
    }
    else {
      print("Hola");
      return null;
    }
  }

}