import 'package:bar/models/user.dart';
import 'package:bar/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text('${user.name}'),
          titleTextStyle: TextStyle(color: Colors.white),
          backgroundColor: Colors.black),
    );
  }
}
