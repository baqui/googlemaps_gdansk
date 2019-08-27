import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:async';
import 'dart:math' as math;

class CustomDialog extends StatefulWidget {
  final String before, after;

  CustomDialog({
    @required this.before,
    @required this.after
  });

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  String orientation = 'horizontal';
  double _sliderValue = 0.0;
  

  @override
  void initState() {
    _getOrientation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      color: Colors.black.withOpacity(0.6),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            child: Stack(
                  alignment: Alignment.center,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      width: orientation == "vertical" ? width : height,
                      height: orientation == "vertical" ? height : width,
                      child: Opacity(
                        opacity: 1.0,
                        child: Transform.rotate(
                          angle: orientation == "vertical" ? 0 : math.pi / 2,
                          child: Image.asset(widget.after),
                        )
                      ),
                    ),
                    Positioned(
                      width: orientation == "vertical" ? width : height,
                      height: orientation == "vertical" ? height : width,
                      child: Opacity(
                        opacity: _sliderValue,
                        child: Transform.rotate(
                          angle: orientation == "vertical" ? 0 : math.pi / 2,
                          child: Image.asset(widget.before),
                        )
                      ),
                    )
                  ],
                )
          ),
          Positioned(
            top: 10.0,
            right: 20.0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(40.0)
                ),
                child: Icon( Icons.close, color: Colors.white, size: 40.0 )
              ),
            ),
          ),
          Positioned(
            bottom: 25.0,
            left: 10.0,
            width: width - 20,
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: Slider(
                  value: _sliderValue,
                  min: 0.0,
                  max: 1.0,
                  activeColor: Colors.blueAccent,
                  onChanged: (newValue) => setState((){ _sliderValue = newValue; })
                )
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<Null> _getOrientation () {
    Image.asset(widget.before).image.resolve(ImageConfiguration()).addListener(ImageStreamListener((ImageInfo image, bool synchronousCall) {
      setState((){
        orientation = image.image.height > image.image.width ? 'vertical' : 'horizontal';
      });
    }));

    return null;
  }
}