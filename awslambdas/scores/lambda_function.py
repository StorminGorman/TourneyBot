from ncaa_scores import NCAAScores

def lambda_handler(event, context):
    games = NCAAScores().games()
    gameList = []
    for game in games:
        gameList.append(game.json())
    return gameList
