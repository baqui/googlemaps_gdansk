import 'package:flutter/material.dart';
import 'data.dart';
import 'Page_indicator.dart';
import 'package:googlemaps_gdansk/ui/styles/ui_helpers.dart';
import 'package:googlemaps_gdansk/core/services/i18n.dart';


class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => new _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> with TickerProviderStateMixin {
  PageController _controller; // controller to swipe onboarding pages
  int currentPage = 0; // initial page controller page
  bool lastPage = false;

  AnimationController animationController;
  Animation<double> _scaleAnimation; // animated FAB - scale

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: currentPage,
    );
    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    // animated FAB - scale
    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF485563), Color(0xFF29323C)],
            tileMode: TileMode.clamp,
            begin: Alignment.topCenter,
            stops: [0.0, 1.0],
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  if (currentPage == pageList.length - 1) {
                    lastPage = true;
                    animationController.forward();
                  } else {
                    lastPage = false;
                    animationController.reset();
                  }
                });
              },
              itemBuilder: (context, index) {

                PageModel page = pageList[index];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Placeholder(),
                    UIHelper.verticalSpaceMedium(),
                    Container(
                      height: 100.0,
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              i18n.text(page.title),
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 28.0,
                                fontFamily: "Montserrat-Black",
                                letterSpacing: 1.0)
                            ),
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Center(
                            child: Text(
                              i18n.text(page.body),
                              style: TextStyle(
                                color: Color(0xFF9B9B9B),
                                fontSize: 18.0,
                                fontFamily: "Montserrat-Black",
                                letterSpacing: 1.0)
                            )
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 55.0,
              child: Container(
                width: 160.0,
                child: PageIndicator(currentPage, pageList.length)),
            ),
            Positioned(
              right: 30.0,
              bottom: 30.0,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: lastPage ? 
                  FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'map');
                    },
                  )
                  : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}