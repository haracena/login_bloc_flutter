import 'package:flutter/material.dart';
import 'package:form_bloc/src/blocs/provider.dart';
import 'package:form_bloc/src/pages/home_page.dart';
import 'package:form_bloc/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider( // widget personalizado de InheritedWidget
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple
        ),
      ),
    );
  }
}
