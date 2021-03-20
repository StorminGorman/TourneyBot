import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourneybot/domain/team.dart';

class TeamCard extends StatelessWidget {
  final Team team;
  final String score;
  final VoidCallback onTap;
  final bool reverse;

  const TeamCard(
      {Key key, this.team, this.score = "", this.onTap, this.reverse = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Card(
        color: team.winner ? Colors.green : Colors.white,
        margin: EdgeInsets.all(15),
        // child: Container(
        //     width: 200,
        // height: 75,
        // padding: EdgeInsets.all(10),
        child: Container(
          height: 75,
          padding: EdgeInsets.all(10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _children()),
        ),
      ),
    );
  }

  List<Widget> _children() {
    final nameWidget = Text(
      "${team.name}",
      style: TextStyle(color: team.winner ? Colors.white : Colors.black),
    );
    final scoreWidget = Text(
      "$score",
      style: TextStyle(color: team.winner ? Colors.white : Colors.black),
    );

    if (reverse) {
      return [scoreWidget, nameWidget];
    } else {
      return [nameWidget, scoreWidget];
    }
  }
}
