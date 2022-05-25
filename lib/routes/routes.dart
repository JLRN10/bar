import 'package:flutter/material.dart';

import '../screen/main_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/main': (BuildContext context) => MainScreen(),
  };
}
