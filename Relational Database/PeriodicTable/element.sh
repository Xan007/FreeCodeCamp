#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1;")
  elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
  then
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$1';")
  else
    ELEMENT=$($PSQL "SELECT * FROM elements WHERE name='$1';")
  fi

  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT" | while IFS=" | " read ATOMIC_NUMBER SYMBOL NAME
    do
      PROPERTIES=$($PSQL "SELECT type_id, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER;")

      echo "$PROPERTIES" | while IFS=" | " read TYPE_ID ATOMIC_MASS MELTING_P BOILING_P 
      do
        TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID")
        TYPE_FORMATTED=$(echo $TYPE | sed -E 's/^ $| $//g')

        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE_FORMATTED, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_P celsius and a boiling point of $BOILING_P celsius."
      done
    done
  fi
fi