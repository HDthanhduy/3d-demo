import 'package:flutter/material.dart';
import 'package:flutter_3d_demo/screens/home/home_screens.dart';
import 'package:flutter_3d_demo/screens/account/login_screens.dart';
// import 'home_page.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MaterialApp(initialRoute: '/loginIn', routes: {
      // '/': (context) => Loading(),
      '/loginIn': (context) => LoginScreen(),
      '/home': (context) => HomeScreen(),
      // '/location': (context) => ChooseLocation(),
    }));
