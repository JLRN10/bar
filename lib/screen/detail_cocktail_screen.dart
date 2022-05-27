import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bar/models/CocktailModel.dart';
import 'package:bar/utils/colors_palette.dart';
import '../network/cocktail_api.dart';

class DetailCocktailScreen extends StatefulWidget {
  DetailCocktailScreen({Key? key}) : super(key: key);

  @override
  State<DetailCocktailScreen> createState() => _DetailCocktailScreenState();
}

class _DetailCocktailScreenState extends State<DetailCocktailScreen> {

  CocktailAPI? cocktailAPI;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cocktailAPI = CocktailAPI();
  }

  int _n = 1;
  int _amt = 1;

  @override
  Widget build(BuildContext context) {

    final cocktail = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final idDrink = cocktail['idDrink'];
    final strDrink = cocktail['strDrink'];

    return Scaffold(
      bottomNavigationBar: _buttonsBuy(strDrink),
      backgroundColor: ColorPalette.colorBlack50,
      body: FutureBuilder(
        future: cocktailAPI!.getCocktail(idDrink),
        builder: (BuildContext context, AsyncSnapshot<CocktailModel?> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Hay un error en la petición")
            );
          }
          else {
            if (snapshot.connectionState == ConnectionState.done) {
              //print(snapshot.data!.first.url);
              return _viewCocktail(snapshot.data!);
            }
            else {
              return CircularProgressIndicator();
            }
          }
        }
      ),
    );
  }

  Widget _viewCocktail(CocktailModel cocktail)
  {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          shadowColor: ColorPalette.colorBlack,
          pinned: true,
          expandedHeight: 500,
          flexibleSpace: Container(
            color: ColorPalette.colorPrimary,
            child: FlexibleSpaceBar(
              title: Text(
                "${cocktail.strDrink}",
                style: TextStyle(
                  color: ColorPalette.colorWhite,
                  backgroundColor: ColorPalette.colorBlack50
                ),
              ),
              background: Image.network("${cocktail.strDrinkThumb}"),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: ColorPalette.colorBlack50,
                        child: Text(
                          "Categoria: ${cocktail.strCategory}",
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorPalette.colorWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: ColorPalette.colorBlack50,
                        child: Text(
                          "Contiene Alcohol: ${cocktail.strAlcoholic}",
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorPalette.colorWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: ColorPalette.colorBlack50,
                        child: Text(
                          "Vaso: ${cocktail.strGlass}",
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorPalette.colorWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: ColorPalette.colorBlack50,
                        child: Text(
                          "Preparación: ${cocktail.strInstructions}",
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorPalette.colorWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 285,
              ),
            ],
          )
        )
      ],
    );
  }

  Widget _buttonsBuy(String cocktail) {
    return Container(
      margin: EdgeInsets.only(left: 130, right: 130, top: 0, bottom: 5),
      //color: ColorPalette.colorBlack25,
      height: 66,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text(""),
                  style: OutlinedButton.styleFrom(
                    primary: ColorPalette.colorWhite,
                    backgroundColor: ColorPalette.colorBlack
                  ),
                  onPressed: () {
                    add();
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  child: Text(
                    'Cantidad:  $_amt',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                OutlinedButton.icon(
                  icon: Icon(Icons.remove),
                  label: Text(""),
                  style: OutlinedButton.styleFrom(
                    primary: ColorPalette.colorWhite,
                    backgroundColor: ColorPalette.colorBlack
                  ),
                  onPressed: () {
                    minus();
                  },
                ),
              ],
            ),
          ),
          OutlinedButton.icon(
            icon: Icon(Icons.shopping_cart),
            label: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 50,
                child: Text("Compar")
              ),
            ),
            style: OutlinedButton.styleFrom(
              primary: ColorPalette.colorWhite,
              backgroundColor: ColorPalette.colorBlack
            ),
            onPressed: () {
              //Notificar
              showDialog(
                context: context, 
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('¿Agregar producto al Carrito?'),
                  content: Text("Producto: $cocktail \nCantidad: $_amt"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        //Agregar al provider
                        //Moverte al Carrito
                        Navigator.pop(context, '/carrito');
                      },
                      child: const Text('OK'),
                    ),
                  ],
                )
              );
            },
          ),
        ],
      ),
    );
  }

  void add() {
    setState(() {
      _n++;
      _amt = _amt + 1;
    });
  }

  void minus() {
    setState(() {
      if (_n != 1) _n--;
      if (_amt != 1) _amt = _amt - 1;
    });
  }
}