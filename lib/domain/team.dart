class Team {
  final String name;
  final bool winner;

  Team(this.name, {this.winner = false});

  Team pick() => Team(this.name, winner: true);
  Team unpick() => Team(this.name, winner: false);
}
