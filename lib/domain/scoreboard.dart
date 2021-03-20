import 'dart:convert';

import 'package:http/http.dart';
import 'package:tourneybot/domain/game.dart';

const String SCORES_ENDPOINT =
    "https://m4wzzlyuch.execute-api.us-west-2.amazonaws.com/production";

class Scoreboard {
  final Client client = Client();

  Future<List<Game>> games() async {
    final url = Uri.parse(SCORES_ENDPOINT);
    final response = await client.get(url);
    final scoresJson = json.decode(response.body) as List<dynamic>;
    return scoresJson.map((score) => Game.fromJSON(score)).toList();
  }
}
