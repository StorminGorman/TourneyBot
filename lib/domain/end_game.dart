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
  Game pickAway() => origin.pickAway();
  @override
  Game pickHome() => origin.pickHome();

  @override
  String get startTime => origin.startTime;
}
