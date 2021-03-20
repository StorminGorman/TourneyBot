import 'package:tourneybot/domain/game.dart';
import 'package:tourneybot/domain/team.dart';

class EndGame implements Game {
  final Game origin;

  EndGame(final Game game)
      : origin = int.parse(game.homeScore) > int.parse(game.awayScore)
            ? Game(game.home.pick(), game.homeScore, game.away.unpick(),
                game.awayScore, clock: "Final", startTime: game.startTime)
            : Game(game.home.unpick(), game.homeScore, game.away.pick(),
                game.awayScore,
                clock: "Final", startTime: game.startTime);

  @override
  Team get away => origin.away;

  @override
  String get awayScore => origin.awayScore;

  @override
  String get clock => origin.clock;

  @override
  Team get home => origin.home;

  @override
  String get homeScore => origin.homeScore;

  @override
  Game pickAway() => this; // no picking after game is over!
  @override
  Game pickHome() => this; // no picking after game is over!

  @override
  String get startTime => origin.startTime;

  @override
  String toString() => origin.toString();

  Game update(
      final String homeScore, final String awayScore, final String clock) {
    return EndGame(origin.update(homeScore, awayScore, clock));
  }

  @override
  bool operator ==(Object other) {
    if (other is Game) {
      return this.toString() == other.toString();
    }
    return false;
  }

  @override
  int get hashCode => toString().hashCode;
}
