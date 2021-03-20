import unittest
import json
from ncaa_game import NCAAGame

class TestNCAAGame(unittest.TestCase):

    def test_basic(self):
        game = NCAAGame(json.loads(self.JSON))
        self.assertEqual(game.homeTeam, 'Florida')
        self.assertEqual(game.homeScore, '75')
        self.assertEqual(game.awayTeam, 'Virginia Tech')
        self.assertEqual(game.awayScore, '70')


    JSON = """
{
        "gameID": "49ec36b2-0029-400e-aeaf-15a87f8ad863",
        "away": {
          "score": "70",
          "names": {
            "char6": "VT",
            "short": "Virginia Tech",
            "seo": "virginia-tech",
            "full": "Virginia Polytechnic Institute and State University"
          },
          "winner": false,
          "seed": "10",
          "description": "(15-6)",
          "rank": "25",
          "conferences": [
            {
              "conferenceName": "ACC",
              "conferenceSeo": "acc"
            },
            {
              "conferenceName": "Top 25",
              "conferenceSeo": "top-25"
            }
          ]
        },
        "finalMessage": "FINAL (OT)",
        "bracketRound": "FIRST ROUND",
        "title": "Florida Virginia Tech",
        "url": "/game/5774514",
        "network": "CBS",
        "home": {
          "score": "75",
          "names": {
            "char6": "FLA",
            "short": "Florida",
            "seo": "florida",
            "full": "University of Florida"
          },
          "winner": true,
          "seed": "7",
          "description": "(14-9)",
          "rank": "",
          "conferences": [
            {
              "conferenceName": "SEC",
              "conferenceSeo": "sec"
            }
          ]
        },
        "liveVideoEnabled": true,
        "startTime": "12:15PM ET",
        "startTimeEpoch": "1616170500",
        "bracketId": "223",
        "gameState": "final",
        "startDate": "03-19-2021",
        "currentPeriod": "FINAL (OT)",
        "videoState": "final",
        "bracketRegion": "SOUTH",
        "contestClock": "0:00"
      }
"""

    # def test_isupper(self):
    #     self.assertTrue('FOO'.isupper())
    #     self.assertFalse('Foo'.isupper())

    # def test_split(self):
    #     s = 'hello world'
    #     self.assertEqual(s.split(), ['hello', 'world'])
    #     # check that s.split fails when the separator is not a string
    #     with self.assertRaises(TypeError):
    #         s.split(2)

if __name__ == '__main__':
    unittest.main()

JSON = """
{
        "gameID": "49ec36b2-0029-400e-aeaf-15a87f8ad863",
        "away": {
          "score": "70",
          "names": {
            "char6": "VT",
            "short": "Virginia Tech",
            "seo": "virginia-tech",
            "full": "Virginia Polytechnic Institute and State University"
          },
          "winner": false,
          "seed": "10",
          "description": "(15-6)",
          "rank": "25",
          "conferences": [
            {
              "conferenceName": "ACC",
              "conferenceSeo": "acc"
            },
            {
              "conferenceName": "Top 25",
              "conferenceSeo": "top-25"
            }
          ]
        },
        "finalMessage": "FINAL (OT)",
        "bracketRound": "FIRST ROUND",
        "title": "Florida Virginia Tech",
        "url": "/game/5774514",
        "network": "CBS",
        "home": {
          "score": "75",
          "names": {
            "char6": "FLA",
            "short": "Florida",
            "seo": "florida",
            "full": "University of Florida"
          },
          "winner": true,
          "seed": "7",
          "description": "(14-9)",
          "rank": "",
          "conferences": [
            {
              "conferenceName": "SEC",
              "conferenceSeo": "sec"
            }
          ]
        },
        "liveVideoEnabled": true,
        "startTime": "12:15PM ET",
        "startTimeEpoch": "1616170500",
        "bracketId": "223",
        "gameState": "final",
        "startDate": "03-19-2021",
        "currentPeriod": "FINAL (OT)",
        "videoState": "final",
        "bracketRegion": "SOUTH",
        "contestClock": "0:00"
      }
    }
"""