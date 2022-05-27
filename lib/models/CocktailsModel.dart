class CocktailsModel {
  String? strDrink;
  String? strDrinkThumb;
  String? idDrink;

  CocktailsModel({
    this.strDrink,
    this.strDrinkThumb,
    this.idDrink
  });

  factory CocktailsModel.fromMap(Map<String, dynamic> map) {
    return CocktailsModel(
      strDrink: map['strDrink'],
      strDrinkThumb: map['strDrinkThumb'],
      idDrink: map['idDrink']
    );
  }
}