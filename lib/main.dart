import 'package:bar/models/user.dart';
import 'package:bar/routes/routes.dart';
import 'package:bar/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => UserProvider(),
        ), // Provider para Manejo del Usario Mesero
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: getApplicationRoutes(),
      home: SplashScreen(),
    );
  }
}
