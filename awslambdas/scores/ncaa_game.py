class NCAAGame:
    def __init__(self, json):
        print(json)
        self.homeTeam = json["home"]["names"]["short"]
        self.homeScore = json["home"]["score"]
        self.awayTeam = json["away"]["names"]["short"]
        self.awayScore = json["away"]["score"]
        self.clock = json["contestClock"]
        self.startTime = json["startTime"]

    def json(self):
        return {
            "home-team": self.homeTeam,
            "home-score": self.homeScore,
            "away-team": self.awayTeam,
            "away-score": self.awayScore,
            "clock": self.clock,
            "start-time": self.startTime
        }