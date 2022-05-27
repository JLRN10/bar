class CocktailModel {
  String? idDrink;
  String? strDrink;
  String? strCategory;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  String? strDrinkThumb;
  

  CocktailModel({
    this.idDrink,
    this.strDrink,
    this.strCategory,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strDrinkThumb
  });

  factory CocktailModel.fromMap(Map<String, dynamic> map) {
    return CocktailModel(
      idDrink: map['idDrink'],
      strDrink: map['strDrink'] ?? "",
      strCategory: map['strCategory'] ?? "",
      strAlcoholic: map['strAlcoholic'] ?? "",
      strGlass: map['strGlass'] ?? "",
      strInstructions: map['strInstructions'] ?? "",
      strDrinkThumb: map['strDrinkThumb'] ?? ""
    );
  }
}