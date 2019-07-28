import 'package:flutter/material.dart';
import 'package:googlemaps_gdansk/ui/styles/ui_helpers.dart';

class LangView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center( child: Text('Lang')),
            UIHelper.verticalSpaceMedium(),
            FlatButton(
              color: Colors.black,
              child: Text('go next', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, 'onboarding');
              },
            )
          ],
        )
      )
    );
  }
}