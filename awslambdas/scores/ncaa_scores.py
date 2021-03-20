import json
import requests
from ncaa_game import NCAAGame
from datetime import date

class NCAAScores:
    def games(self):
        today = date.today()
        dayStamp = today.strftime("%Y/%m/%d")
        print(dayStamp)
        url = "https://data.ncaa.com/casablanca/scoreboard/basketball-men/d1/" + dayStamp + "/scoreboard.json"
        print(url)
        response = requests.get(url)
        scoreboard = json.loads(response.text)
        games = []
        for game in scoreboard["games"]:
            games.append(NCAAGame(game["game"]))
        return games