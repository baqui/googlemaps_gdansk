import 'package:flutter/material.dart';
import 'package:googlemaps_gdansk/ui/styles/ui_helpers.dart';
import 'package:googlemaps_gdansk/core/services/i18n.dart';
import 'package:googlemaps_gdansk/core/services/data.dart';
import 'package:googlemaps_gdansk/ui/widgets/before_after_dialog.dart';

class HistoryDetails extends StatefulWidget {

  final String id;
  const HistoryDetails({this.id});

  @override
  State<HistoryDetails> createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {

  //refresh state to see language change
  void refreshView() => setState((){});



  @override
  Widget build(BuildContext context) {

    HistoryPoint point = historyPoints[widget.id];

    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.text(point.name)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                UIHelper.verticalSpaceMedium(),
                Container(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => CustomDialog(
                              before: point.before,
                              after: point.after
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(point.before)
                        ),
                      ),
                      UIHelper.verticalSpaceMedium(),
                      Text(point.year),
                      UIHelper.verticalSpaceMedium(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(point.after)
                      ),
                      UIHelper.verticalSpaceMedium(),
                      Text(i18n.text(point.name)),
                      UIHelper.verticalSpaceMedium(),
                      Text(i18n.text(point.description)),
                      UIHelper.verticalSpaceLarge()
                    ],
                  )
                )
              ],
            )
          )
      )
    );
  }
}