#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE games, teams")

CREATE_TEAM () {
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$1';")

  if [[ -z $TEAM_ID ]]
  then
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$1')")

    if [[ $INSERT_TEAM_RESULT = "INSERT 0 1" ]]
    then
      echo Added $1 to teams
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$1';")
    fi
  fi

  return $TEAM_ID
}

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  if [[ $YEAR != year ]]
  then
    echo $($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    echo $($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")

    #CREATE_TEAM $WINNER
    #WINNER_ID=$?

    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    
    #CREATE_TEAM $OPPONENT
    #OPPONENT_ID=$?

    echo $($PSQL"INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $W_GOALS, $O_GOALS)")
  fi
done