#!/bin/bash -x
echo "Welcome to Snake And Ladder Simulator"

#!Initialize variables & constants
playerPosition=0
diceRoll=0
NO_PLAY=0
LADDER=1
SNAKE=2
declare -A gamePlay

#!Function To set playerPosition according to playing Options like NO_Play or Snake or Ladder
function setPlayerMoves() {

	dieValue=$((RANDOM % 6 + 1))
	playingOptions=$((RANDOM % 3))
	((diceRoll++))

	#! Increment player Position according to $playingOptions
	case $playingOptions in
		$NO_PLAY)
			playerPosition=$playerPosition
			;;
		$LADDER)
			playerPosition=$((playerPosition + dieValue))
			;;
		$SNAKE)
			playerPosition=$((playerPosition - dieValue))
			;;
	esac
		#!Reset player Position if position is not between 0 to 100
		resetPosition
		gamePlay[DiceRoll:$diceRoll]=$playerPosition

}
function exactWinPosition() {
	while [ $playerPosition -ne 100 ]
	do
		setPlayerMoves
	done
}

function resetPosition() {
	if [ $playerPosition -lt 0 ]
	then
		playerPosition=0
	elif [ $playerPosition -gt 100 ]
	then
		playerPosition=$((playerPosition - daiValue))
	fi
}
#!Start game
exactWinPosition
