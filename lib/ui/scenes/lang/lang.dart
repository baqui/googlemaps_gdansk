import 'package:flutter/material.dart';
import 'package:googlemaps_gdansk/ui/styles/ui_helpers.dart';
import 'package:googlemaps_gdansk/core/services/i18n.dart';

class LangView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center( child: Text(i18n.text('test123'))),
            UIHelper.verticalSpaceMedium(),
            FlatButton(
              color: Colors.red,
              child: Text('PL', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                print(i18n.currentLanguage);
                await i18n.setNewLanguage('pl');
                print(i18n.currentLanguage);
                Navigator.pushNamed(context, 'onboarding');
              },
            ),
            UIHelper.verticalSpaceMedium(),
            FlatButton(
              color: Colors.black,
              child: Text('EN', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await i18n.setNewLanguage('en');
                Navigator.pushNamed(context, 'onboarding');
              },
            )
          ],
        )
      )
    );
  }
}