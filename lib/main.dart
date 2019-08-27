import 'package:flutter/material.dart';
import 'package:googlemaps_gdansk/locator.dart';
import 'package:googlemaps_gdansk/ui/router.dart';
import 'package:googlemaps_gdansk/core/services/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';

void main() async {
  await i18n.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Googlemaps Gdansk',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          dialogBackgroundColor: Colors.red
        ),
        initialRoute: 'lang',
        onGenerateRoute: Router.generateRoute,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: i18n.supportedLocales(),
      );
  }
}