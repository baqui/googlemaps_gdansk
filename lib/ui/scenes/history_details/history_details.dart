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
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(point.after)
                              ),
                              Positioned(
                                top: 14.0,
                                right: 14.0,
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(40.0)
                                  ),
                                  child: Icon( Icons.photo_album, color: Colors.white, size: 40.0 )
                                ),
                              )
                            ],
                          )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                        child: Column(
                        children: <Widget>[
                            Text(i18n.text(point.name), style: 
                              TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat-Black")
                            ),
                            UIHelper.verticalSpaceMedium(),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  height: 1.25
                                ),
                                children: <TextSpan>[
                                  TextSpan(text: "       "),
                                  TextSpan(text: i18n.text(point.description))
                                ]
                              )
                            ),
                            UIHelper.verticalSpaceLarge()
                          ],
                        )
                      )
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