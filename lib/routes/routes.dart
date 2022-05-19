import 'package:bar/screen/login.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/movies': (BuildContext context) => LoginScreen(),
  };
}
