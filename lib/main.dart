import 'package:flutter/material.dart';
import 'package:googlemaps_gdansk/locator.dart';
import 'package:googlemaps_gdansk/ui/router.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Googlemaps Gdansk',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        initialRoute: 'lang',
        onGenerateRoute: Router.generateRoute,
        debugShowCheckedModeBanner: false
      );
  }
}