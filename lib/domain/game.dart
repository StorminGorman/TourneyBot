import 'package:tourneybot/domain/end_game.dart';
import 'package:tourneybot/domain/team.dart';

class Game {
  final Team home;
  final Team away;

  final String homeScore;
  final String awayScore;

  final String clock;
  final String startTime;

  Game(this.home, this.homeScore, this.away, this.awayScore,
      {this.clock = "", this.startTime = ""});

  factory Game.fromJSON(final Map<String, dynamic> json) {
    final homeName = json["home-team"];
    final homeScore = json["home-score"];
    final awayName = json["away-team"];
    final awayScore = json["away-score"];

    final clock = json["clock"] ?? "";
    final startTime = json["start-time"] ?? "";

    final game = Game(Team(homeName), homeScore, Team(awayName), awayScore,
        clock: clock, startTime: startTime);

    if (clock == "0:00") {
      return EndGame(game);
    } else {
      return game;
    }
  }

  Game pickHome() => Game(home.pick(), homeScore, away.unpick(), awayScore,
      clock: clock, startTime: startTime);
  Game pickAway() => Game(home.unpick(), homeScore, away.pick(), awayScore,
      clock: clock, startTime: startTime);

  String toString() => "${home.name} ${homeScore} vs ${awayScore} ${away.name}";
}
