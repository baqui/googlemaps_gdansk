import 'package:flutter/material.dart';
import 'package:googlemaps_gdansk/ui/styles/ui_helpers.dart';
import 'package:googlemaps_gdansk/core/services/i18n.dart';

class LangView extends StatefulWidget {
  @override
  State<LangView> createState() => _LangViewState();
}

class _LangViewState extends State<LangView> {

  //refresh state to see language change
  void refreshView() => setState((){});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF485563), Color(0xFF29323C)],
            tileMode: TileMode.clamp,
            begin: Alignment.topCenter,
            stops: [0.0, 1.0],
            end: Alignment.bottomCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UIHelper.verticalSpaceMedium(),
            GestureDetector(
              onTap: () async {
                await i18n.setNewLanguage('pl');
                refreshView();
                Navigator.pushNamed(context, 'onboarding');
              },
              child: Image.asset('assets/flag-pl.png')
            ),
            UIHelper.verticalSpaceMedium(),
            GestureDetector(
              onTap: () async {
                await i18n.setNewLanguage('en');
                refreshView();
                Navigator.pushNamed(context, 'onboarding');
              },
              child: Image.asset('assets/flag-en.png')
            ),
          ],
        )
      )
    );
  }
}