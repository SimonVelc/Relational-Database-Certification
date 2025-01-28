#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --no-align --tuples-only  -c"

 # Generate a random number between 1 and 1000
SECRET_NUMBER=$((RANDOM % 1000 + 1)) 

#counter
GUESS_COUNT=0

#read name
echo "Enter your username:"
read NAME

#get username
USERNAME=$($PSQL "SELECT username FROM info WHERE username='$NAME'")



#if username does not exist
if [[ -z $USERNAME ]]
then
  GAMES_PLAYED=0
  BEST_GAME=0
  INSERTED_USERNAME=$($PSQL "INSERT INTO info(username, games_played) VALUES('$NAME','$GAMES_PLAYED')")
  echo "Welcome, $NAME! It looks like this is your first time here."
else
    #get data of username
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games_info INNER JOIN info USING(player_id)  WHERE username='$NAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM games_info INNER JOIN info USING(player_id)  WHERE username='$NAME'")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

#get player_id
PLAYER_ID=$($PSQL "SELECT player_id FROM info WHERE username='$NAME'")

echo "Guess the secret number between 1 and 1000:"

while [[ $GUESS != $SECRET_NUMBER ]]; do
read GUESS
    # Check if the input is a positive integer
    if [[ $GUESS =~ ^[0-9]+$ ]]; then  
        ((GUESS_COUNT++))

        if [[ $GUESS -lt $SECRET_NUMBER ]] 
        then
            echo "It's higher than that, guess again:"
        elif [[ $GUESS -gt $SECRET_NUMBER ]] 
        then
            echo "It's lower than that, guess again:"
        else
            echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
            break
        fi
    else
        echo "That is not an integer, guess again:"
    fi
done

#UPDATE GAMES PLAYED
((GAMES_PLAYED++))

#insert data to games_info
NEW_GAMES_INFO=$($PSQL "INSERT INTO games_info(player_id, guesses) VALUES('$PLAYER_ID', '$GUESS_COUNT')")

#update info
NEW_INFO=$($PSQL "UPDATE info SET games_played='$GAMES_PLAYED' WHERE username='$NAME'")

#update best_game
if [[ $BEST_GAME -eq 0 || $BEST_GAME -gt $GUESS_COUNT ]]
then
  NEW_BEST_GAME=$($PSQL "UPDATE info SET best_game='$GUESS_COUNT' WHERE username='$NAME'") 
fi
