import 'package:bar/provider/user_provider.dart';
import 'package:bar/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../models/user.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: LoginScreen(),
      backgroundColor: Colors.black,
      duration: 3000,
      imageSrc: "images/logobar.png",
      imageSize: 200,
      text: "Bar PUB",
      textStyle: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: "Comics Sams"),
    );
  }
}
