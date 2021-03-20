import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tourneybot/domain/game.dart';
import 'package:tourneybot/domain/scoreboard.dart';
import 'package:tourneybot/team_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Today's Games",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "Today's Games"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<Game> games = [];

  Timer timer;

  @override
  void initState() {
    super.initState();
    fetchScores();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      fetchScores();
    });
  }

  @override
  void dispose() {
    super.dispose();

    timer.cancel();
  }

  void fetchScores() async {
    final scoreboard = Scoreboard();
    final fetched = await scoreboard.games();
    if (games.isEmpty) {
      setState(() {
        this.games = fetched;
      });
    } else {
      setState(() {
        final List<Game> newGames = [];
        this.games.forEach((game) {
          if (fetched.contains(game)) {
            final index = fetched.indexOf(game);
            final newGame = fetched[index];
            newGames.add(game.update(
                newGame.homeScore, newGame.awayScore, newGame.clock));
          } else {
            newGames.add(game);
          }
        });
        this.games = newGames;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                Text(
                  "Brian's Tournament Bot",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                )
              ],
            ),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          Column(children: [
            ListTile(
              leading: Icon(Icons.add, color: Theme.of(context).primaryColor),
              title: Text("My Picks",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 18.0)),
            ),
            ListTile(
              leading: Icon(Icons.add, color: Theme.of(context).primaryColor),
              title: Text("Scores",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 18.0)),
            )
          ])
        ],
      )),
      body: ListView(
        children: _scores(),
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void pickHome(final Game game) {
    final index = games.indexOf(game);
    final newPick = game.pickHome();
    setState(() {
      games.removeAt(index);
      games.insert(index, newPick);
    });
  }

  void pickAway(final Game game) {
    final index = games.indexOf(game);
    final newPick = game.pickAway();
    setState(() {
      games.removeAt(index);
      games.insert(index, newPick);
    });
  }

  List<Widget> _scores() {
    return games
        .map(
          (game) =>
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Flexible(
              flex: 3,
              child: TeamCard(
                  team: game.home,
                  score: game.homeScore,
                  onTap: () => pickHome(game)),
            ),
            Flexible(
                flex: 1,
                child: Text(game.clock.isEmpty ? game.startTime : game.clock)),
            Flexible(
              flex: 3,
              child: TeamCard(
                  team: game.away,
                  score: game.awayScore,
                  reverse: true,
                  onTap: () => pickAway(game)),
            ),
          ]),
        )
        .toList();
  }
}
