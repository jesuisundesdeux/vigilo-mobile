

import 'package:flutter/widgets.dart';
import 'package:vigilo_mobile/models/Models.dart';

import 'package:http/http.dart' as http;

import 'dart:convert' as convert;


class ObservationService {
  final String baseURL;

  ObservationService(this.baseURL);

  Future<ObservationsList> getObservations() =>
      http.get(baseURL + "/get_issues.php?count=20&format=json")
          .then((response)=>ObservationsList.fromJson(convert.jsonDecode(response.body)));

  Image getImage(String token) =>
      Image.network(baseURL+"/generate_panel.php?token=$token");
}