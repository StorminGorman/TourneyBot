import unittest
from ncaa_scores import NCAAScores

class TestNCAAScores(unittest.TestCase):

    def test_basic(self):
        scores = NCAAScores()
        games = scores.games()
        for game in games :
            print("-------")
            print(game.homeTeam + ' ' + game.homeScore)
            print(game.awayTeam + ' ' + game.awayScore)

if __name__ == '__main__':
    unittest.main()