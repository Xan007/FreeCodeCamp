#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#echo $($PSQL "TRUNCATE games, users")

echo -e "\nEnter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  if [[ ! $INSERT_USER_RESULT = "INSERT 0 1" ]]  
  then
    exit
  else
    echo "Welcome, $USERNAME! It looks like this is your first time here."

    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  fi
else
  GAMES_RESULT=$($PSQL "SELECT COUNT(*) AS games_played, MIN(number_of_tries) FROM games WHERE user_id=$USER_ID")
  echo "$GAMES_RESULT" | while IFS=" | " read GAMES_PLAYED BEST_GAME_TRIES
  do
    if [[ -z $BEST_GAME_TRIES ]]
    then
      BEST_GAME_TRIES=0
    fi

    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME_TRIES guesses."
  done
fi

SECRET_NUMBER=$(( $RANDOM%1000+1 ))
USER_TRIES=0
USER_GUESS=""

echo "Guess the secret number between 1 and 1000:"

while [[ $USER_GUESS -ne $SECRET_NUMBER ]]
do
  ((USER_TRIES++))
  read USER_GUESS

  if [[ ! $USER_GUESS =~ ^[0-9]{1,4}$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $USER_GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi
  fi
done

GAME_INSERT_RESULT=$($PSQL "INSERT INTO games(user_id, number_of_tries) VALUES($USER_ID, $USER_TRIES)")
echo "You guessed it in $USER_TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"