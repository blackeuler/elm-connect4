# Connect Four Specification

## Introduction

Connect 4 is a 2 player  The game is played with alternating turns between players. The player who starts the game is left to implementation. To play a player can choose one of the 7 columns to place their `token` onto.  When a player places a `token` on a particular column it is placed on the **last** avaiable row in that column that is not already occupied by another `token`. Once a column is completely filled players can no longer place disk on that column.

### Players
* Each player has a unique color for their token.
* Player 1 has the color red for their token.
* Player 2 has the color blue for their token.
### Cell
* A cell is usually a square that contains an empty circle slot.
* A token is a circular disk that is either Red or Blue depending on the player playing.
### Game Board 

* A Game Board consists of 6 rows and 7 columns of `cells`. 

### Win Condition
A player has won the game when one of the 3 conditions has been met:
 1. A player has 4 of their tokens in succession in a column of the `game board`.
 2. A player has 4 of their tokens in succession in a row of the `game board`.
 3. A player has 4 of their tokens in succession in a diagonal of the `game board`.
### Tie
The game is considered tied when all cells in the board have been filled.
### User Interface

1. Show a title of the game `Connect 4`
2. Show a empty board under the title
3. Allow Clicking above a column to be the mechanism of placing a token.
4. Disallow illegal moves, such as placing a token in a full column
5. Stop allowing moves when the game is over.
6. Display a Message to indicate the player who has won. 