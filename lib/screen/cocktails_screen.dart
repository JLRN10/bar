import 'package:flutter/material.dart';
import 'package:bar/models/CocktailsModel.dart';
import 'package:bar/network/cocktail_api.dart';
import 'package:bar/utils/colors_palette.dart';

class CocktailScreen extends StatefulWidget {
  CocktailScreen({Key? key}) : super(key: key);

  @override
  State<CocktailScreen> createState() => _CocktailScreenState();
}

class _CocktailScreenState extends State<CocktailScreen> {
  
  CocktailAPI? cocktailAPI;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cocktailAPI = CocktailAPI();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.colorBlack50,
      body: FutureBuilder(
        future: cocktailAPI!.getAllCocktails(),
        builder: (BuildContext context, AsyncSnapshot<List<CocktailsModel>?> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Hay un error en la petición")
            );
          }
          else {
            if (snapshot.connectionState == ConnectionState.done) {
              //print(snapshot.data!.first.url);
              return _listCocktails(snapshot.data, context);
            }
            else {
              return CircularProgressIndicator();
            }
          }
        }
      ),
    );
  }

  Widget _listCocktails(List<CocktailsModel>? cocktails, BuildContext context) {
    
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          shadowColor: ColorPalette.colorBlack,
          pinned: true,
          expandedHeight: 300,
          flexibleSpace: Container(
            color: ColorPalette.colorPrimary,
            child: FlexibleSpaceBar(
              title: Text("COCKTAILS"),
              background: Image.asset("assets/images/cocktails.jpg"),
            ),
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 3,
          children: _listCocktailsIn3(cocktails, context),
        )
      ],
    );
  }

  List<Widget> _listCocktailsIn3(List<CocktailsModel>? cocktails, BuildContext context) 
  {
    return List.generate(
      cocktails!.length,
      (index) {
        CocktailsModel cocktail = cocktails[index];
        return Padding(
          padding: EdgeInsets.all(10),
          child: Material(
            color: ColorPalette.colorBlack50,
            elevation: 8,
            borderRadius: BorderRadius.circular(10.0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              splashColor: ColorPalette.colorBlack25,
              onTap: (){
                Navigator.pushNamed(
                  context, 
                  '/detailCocktail', 
                  arguments: {
                    'idDrink': cocktail.idDrink,
                    'strDrink': cocktail.strDrink
                  }
                );
              },
              child: Ink.image(
                repeat: ImageRepeat.repeat,
                colorFilter: ColorFilter.srgbToLinearGamma(),
                image: NetworkImage("${cocktail.strDrinkThumb}"),
                fit: BoxFit.cover,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Text(
                      "  ${cocktail.strDrink!}  ",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorPalette.colorWhite,
                        backgroundColor: ColorPalette.colorBlack50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}