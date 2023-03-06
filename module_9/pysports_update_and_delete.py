#Title: pysports_update_and_delete.py
#Author: Mina
#Description: pysports update player and delete player.

#Connects MySQL with Python
import mysql.connector
from mysql.connector import errorcode

#Configuration data for database
config = {
    "host" : "localhost",
    "user" : input("\nUsername: "),
    "password" : input("\nPassword: "),
    "database" : input("\nDatabase: "),
    "raise_on_warnings" : True
    }

def show(cursor, title):
    
    #Inner join query
    cursor.execute("SELECT player_id, first_name, last_name, team_name FROM player INNER JOIN team ON player.team_id = team.team_id order by player_id" )
    
    #Results from the query
    players = cursor.fetchall()
    
    print("\n-- {} --".format(title))
    
    #Gather results from players
    for player in players:
        print("\nPlayer ID: {}\nFirst Name: {}\nLast Name: {}\nTeam Name: {}\n".format(player[0], player[1], player[2], player[3]))

#Shows whether connection is successful or not given the input
try:
    db = mysql.connector.connect(**config)

    #Cursor
    cursor = db.cursor()
    
    #Query to add a new player 
    add_player = ("INSERT INTO player(first_name, last_name, team_id) VALUES('Mina', 'Sedik', 1)")

    #Add new player
    cursor.execute(add_player)

    #Commit to the database
    db.commit()

    #All players (including new)
    show(cursor, "DISPLAYING PLAYERS AFTER INSERT")

    #New record 
    update_player = ("UPDATE player SET team_id = 2 WHERE first_name = 'Mina'")

    #Query update
    cursor.execute(update_player)

    #Commit to the database
    db.commit()

    #Show all records of players
    show(cursor, "DISPLAYING PLAYERS AFTER UPDATE")

    #Delete query 
    delete_player = ("DELETE FROM player WHERE first_name = 'Mina'")
      
    cursor.execute(delete_player)
     
    #Commit to the database
    db.commit() 

    #All players (after delete) 
    show(cursor, "DISPLAYING PLAYERS AFTER DELETE")
    
    input("\nPress any key to continue... ")

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("\nThe supplied username or password are invalid")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("\nThe specified database does not exist.")
    else:
        print(err)
    
finally:
    db.close()