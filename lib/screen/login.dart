import 'package:bar/provider/user_provider.dart';
import 'package:bar/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    Map? _UserMap;
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.black87,
                            Colors.black,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 450),
                      child: Image.asset(
                        'images/logobar.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        //color: Colors.white,
                        scale: 2.3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'By clicking Log in, you agree with our Terms. Learn how we process your data in our Privacy Policy and Cookies Policy.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          SignInButton(
                            Buttons.Google,
                            onPressed: () async {
                              User? user = await Authenticator.iniciarSesion(
                                  context: context);
                              var name = user?.displayName;
                              var id = user?.email;
                              userProvider.name = '' + name!;
                              Navigator.pushNamed(context, '/main');
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          SignInButton(
                            Buttons.FacebookNew,
                            onPressed: () async {
                              var email =
                                  await Authenticator.signInWithFacebook();
                              print(email.user?.displayName);
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          SignInButton(
                            Buttons.Twitter,
                            text: "Use Twitter",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
