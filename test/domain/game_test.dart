import 'dart:convert';

import 'package:test/test.dart';
import 'package:tourneybot/domain/game.dart';

void main() {
  test("should construct from json", () async {
    final game = Game.fromJSON(json.decode(JSON));
    expect(game.home.name, equals("Florida"));
    expect(game.homeScore, equals("75"));
    expect(game.away.name, equals("Virginia Tech"));
    expect(game.awayScore, equals("70"));
  });
}

const String JSON = """
  {
    "home-team": "Florida",
    "home-score": "75",
    "away-team": "Virginia Tech",
    "away-score": "70"
  }
""";
