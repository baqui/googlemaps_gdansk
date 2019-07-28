import 'dart:convert';

import 'package:googlemaps_gdansk/core/models/point.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const endpoint = 'http://my-json-server.typicode.com/baqui/time_counter_data';

  var client = new http.Client();

  Future<List<Point>> getPointsList(String login) async {
    var points = List<Point>();
    // Get points
    var response = await client.get('$endpoint/points');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var project in parsed) {
      points.add(Point.fromJson(project));
    }

    return points;
  }
}
