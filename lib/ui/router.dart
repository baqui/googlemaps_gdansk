import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:googlemaps_gdansk/ui/scenes/lang/lang.dart';
import 'package:googlemaps_gdansk/ui/scenes/map/map.dart';
import 'package:googlemaps_gdansk/ui/scenes/history_details/history_details.dart';
import 'package:googlemaps_gdansk/ui/scenes/onboarding/onboarding.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'lang':
        return MaterialPageRoute(builder: (_) => LangView());
      case 'onboarding':
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case 'map':
        return MaterialPageRoute(builder: (_) => MapView());
      case 'history_details':
        String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => HistoryDetails(id: id));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
