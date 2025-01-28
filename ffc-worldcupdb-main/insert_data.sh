#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE games, teams")


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    if [[ $WINNER != "winner" ]]
      then
        # get team name
        WINNER_NAME=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
          #if not found
          if [[ -z $WINNER_NAME ]]
            then
              #insert new team
              INSERT_WINNER_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
              #echo 
              if [[ $INSERT_WINNER_NAME == "INSERT 0 1" ]]
                then
                  echo Inserted team $WINNER
              fi
          fi
    fi


    if [[ $OPPONENT != "opponent" ]]
      then
        # get team name
        TEAM2_NAME=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
        #if not found
        if [[ -z $TEAM2_NAME ]]
          then
          #insert new team
          INSERT_OPPONENT_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
          #echo 
          if [[ $INSERT_OPPONENT_NAME == "INSERT 0 1" ]]
            then
              echo Inserted team $OPPONENT
              fi
          fi
    fi  

    if [[ YEAR != "year" ]]
      then
        #GET WINNER_ID
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
        #GET OPPONENT_ID
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        #INSERT NEW GAMES ROW
        INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
          # echo 
          if [[ $INSERT_GAME == "INSERT 0 1" ]]
            then
              echo New game added: $YEAR, $ROUND, $WINNER_ID VS $OPPONENT_ID, score $WINNER_GOALS : $OPPONENT_GOALS
          fi
    fi
done