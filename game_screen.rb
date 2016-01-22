# TODO: [Katie 1.22.16] this program currently displays the 2-player board when run as an app through Shoes; if we want to check Set validity in this program, we need to add click functionality for all 12 cards (currently only the first row has it) and allow the user to click cards AFTER clicking the Set button 

Shoes.app(title: "The Game of Set", width: 1024, height: 768) { 


	player1Score = 0
	player2Score = 0
	set = []
	i = 0
	setCorrect = false
		
	# method to return a boolean value indicating whether or not the cards are a valid Set
	def checkSet?(set)
		checkColor = !!( (set[0][0] != set[1][0] && set[0][0] != set[2][0] && set[1][0] != set[2][0] ) || ( set[0][0] == set[1][0] &&  set[0][0] == set[2][0] && set[1][0] == set[2][0] ) )
		checkFill = !!( (set[0][1] != set[1][1] && set[0][1] != set[2][1] && set[1][1] != set[2][1] ) || ( set[0][1] == set[1][1] &&  set[0][1] == set[2][1] && set[1][1] == set[2][1] ) )
		checkShape = !!( (set[0][2] != set[1][2] && set[0][2] != set[2][2] && set[1][2] != set[2][2] ) || ( set[0][2] == set[1][2] &&  set[0][2] == set[2][2] && set[1][2] == set[2][2] ) )
		checkNum = !!( (set[0][3] != set[1][3] && set[0][3] != set[2][3] && set[1][3] != set[2][3] ) || ( set[0][3] == set[1][3] &&  set[0][3] == set[2][3] && set[1][3] == set[2][3] ) )
		setCorrect = checkColor && checkFill && checkShape && checkNum
	end

	# method to fill up the set array with the chosen cards
	def addCardToSet(cardName)
		set.push cardName
		i += 1
		if i == 3
			checkSet?(set)
			i = 0
		end
	end

	# card names are cardCOLROW, where col = 1 - 3 and row = 1 - 4
	stack {
		flow {
			@card11 = image "cards/RSD1.jpg", :width => 0.25 
				@card11.click {
					addCardToSet("RSD1")
				}
			@card12 = image "cards/RSD2.jpg", :width => 0.25
				@card12.click {
					addCardToSet("RSD2")
				}
			@card13 = image "cards/RSD3.jpg", :width => 0.25
				@card13.click {
					addCardToSet("RSD3")
				}
			@card14 = image "cards/RSS1.jpg", :width => 0.25
				@card14.click {
					addCardToSet("RSS1")
				}
		}

		flow {
			@card21 = image "cards/PSD1.jpg", :width => 0.25
			@card22 = image "cards/PSD2.jpg", :width => 0.25
			@card23 = image "cards/PSD3.jpg", :width => 0.25
			@card24 = image "cards/PSS1.jpg", :width => 0.25
		}
	
		flow {
			@card31 = image "cards/GSD1.jpg", :width => 0.25
			@card32 = image "cards/GSD2.jpg", :width => 0.25
			@card33 = image "cards/GSD3.jpg", :width => 0.25
			@card34 = image "cards/GSS1.jpg", :width => 0.25
		}
	}

	stack {	
		flow {
	# when the button is clicked for either player, that player should click the three cards that make a set, and the point total should increment if the Set was correct
	@setButtonPlayer1 = button "Player 1 found a Set!"
		@setButtonPlayer1.click {
			alert "Click the three cards in your Set!"
			if setCorrect
			alert "Congratulations! You found a Set!"
			player1Score += 1
			@player1ScoreText.replace "Player 1 Score: #{player1Score}\n"
			else 
				alert "Sorry, that's not a Set!"
			end
		}

	@setButtonPlayer2 = button "Player 2 found a Set!"
		@setButtonPlayer2.click {
			alert "Click the three cards in your Set!"
			if setCorrect 
			alert "Congratulations! You found a Set!"
			player2Score += 1
			@player2ScoreText.replace "Player 2 Score: #{player2Score}"
			else 
				alert "Sorry, that's not a Set!"
			end
		}
		}
	@player1ScoreText = para "Player 1 Score: #{player1Score}\n"
	@player2ScoreText = para "Player 2 Score: #{player2Score}"
	}
}
