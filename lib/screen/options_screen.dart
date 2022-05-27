import 'dart:html';

import 'package:flutter/material.dart';
import 'package:bar/utils/colors_palette.dart';

class OptionsScreen extends StatefulWidget {
  OptionsScreen({Key? key}) : super(key: key);

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.colorBlack50,
      appBar: AppBar(
        //foregroundColor: ColorPalette.colorBlack,
        title: Text("Main Options"),
        backgroundColor: ColorPalette.colorPrimary,
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 8,),
            //Cocktails
            _optWitget("assets/images/cocktails.jpg", "COCKTAILS", 1),
            SizedBox(height: 8,),
            //Drinks
             _optWitget("assets/images/drinks.jpg", "DRINKS", 2),
            SizedBox(height: 8,),
            //Snacks
             _optWitget("assets/images/snacks.jpg", "SNACKS", 3),
          ],
        ),
      ),
    );
  }

  Widget _optWitget(String img, String text, int option)
  {
    return Center(
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(10.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          splashColor: ColorPalette.colorBlack25,
          onTap: (){
            switch (option) {
              case 1:
                Navigator.pushNamed(context, '/cocktails');
                break;
              case 2:
                Navigator.pushNamed(context, '/drinks');
                break;
              case 3:
                Navigator.pushNamed(context, '/snacks');
                break;
            }
          },
          child: Ink.image(
            colorFilter: ColorFilter.srgbToLinearGamma(),
            image: AssetImage(img),
            height: 200,
            width: 300,
            fit: BoxFit.cover,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 40,
                    color: ColorPalette.colorWhite,
                    backgroundColor: ColorPalette.colorBlack50,
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}