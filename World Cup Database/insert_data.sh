#! /bin/bash


if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    #Inserting all teams into teams Database
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

    #Checking if the winner of the match already exists
    if [[ -z $WINNER_ID ]]
    then
      INSERT_TEAM_RES=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RES == "INSERT 0 1" ]]
      then
          echo Inserted into teams, $WINNER
      fi
    #Checking if the opponent of the match already exists
    elif [[ -z $OPPONENT_ID ]]
    then
      INSERT_TEAM_RES=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RES == "INSERT 0 1" ]]
      then
          echo Inserted into teams, $OPPONENT
      fi
    fi
  fi
done


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    
    INSERT_GAME_RES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RES == "INSERT 0 1" ]]
    then
      echo Inserted into games, $YEAR $ROUND: $WINNER'(W)' vs. $OPPONENT '=> ('$WINNER_GOALS - $OPPONENT_GOALS')'
    fi
  fi
done