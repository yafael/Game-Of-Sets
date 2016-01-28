# TODO: [Katie 1.27.16] allow the user to click cards AFTER clicking the Set button; allow for adding a fourth row of cards; allow cards to refresh when selected

require_relative "card.rb"
require_relative "deck.rb"
require_relative "functions.rb"

class Game

  def self.playGame(numOfPlayers, opponent)

  Shoes.app(title: "The Game of Set", width: 1024, height: 768) { 

	# create deck and pull out initial 12 cards, saving printable names (without .jpg extension) in current_cards array
   	deck = Deck.new
    	current_cards = []
    	for i in 0...12 do
	      card = deck.removeAny
	      current_cards.push card.printCard
      	end
	
	# method to return a boolean value indicating whether or not the cards are a valid Set
	def checkSet?(set)
		checkColor = !!( (set[0][0] != set[1][0] && set[0][0] != set[2][0] && set[1][0] != set[2][0] ) || ( set[0][0] == set[1][0] &&  set[0][0] == set[2][0] ) )
		checkFill = !!( (set[0][1] != set[1][1] && set[0][1] != set[2][1] && set[1][1] != set[2][1] ) || ( set[0][1] == set[1][1] &&  set[0][1] == set[2][1] ) )
		checkShape = !!( (set[0][2] != set[1][2] && set[0][2] != set[2][2] && set[1][2] != set[2][2] ) || ( set[0][2] == set[1][2] &&  set[0][2] == set[2][2] ) )
		checkNum = !!( (set[0][3] != set[1][3] && set[0][3] != set[2][3] && set[1][3] != set[2][3] ) || ( set[0][3] == set[1][3] &&  set[0][3] == set[2][3] ) )
		setCorrect = !!(checkColor && checkFill && checkShape && checkNum)
	end

	# method to fill up the set array with the chosen cards
	def addCardToSet(cardName)
		set.push cardName
		i += 1
		if i == 3
			setCorrect = checkSet?(set)
			# clear out the set array so it can be used again
			set.pop
			set.pop
			set.pop
			i = 0
		end
	end

	player1Score = 0
	player2Score = 0
	set = []
	i = 0
	setCorrect = false

	# card names are cardCOLROW, where col = 1 - 3 and row = 1 - 4
	stack {
		flow {
			@card11 = image "cards/#{current_cards[0]}.jpg", :width => 0.25 
				@card11.click {
					addCardToSet("#{current_cards[0]}")
				}
			@card12 = image "cards/#{current_cards[1]}.jpg", :width => 0.25
				@card12.click {
					addCardToSet("#{current_cards[1]}")
				}
			@card13 = image "cards/#{current_cards[2]}.jpg", :width => 0.25
				@card13.click {
					addCardToSet("#{current_cards[2]}")
				}
			@card14 = image "cards/#{current_cards[3]}.jpg", :width => 0.25
				@card14.click {
					addCardToSet("#{current_cards[3]}")
				}
		}

		flow {
			@card21 = image "cards/#{current_cards[4]}.jpg", :width => 0.25
				@card21.click {
					addCardToSet("#{current_cards[4]}")
				}
			@card22 = image "cards/#{current_cards[5]}.jpg", :width => 0.25
				@card22.click {
					addCardToSet("#{current_cards[5]}")
				}
			@card23 = image "cards/#{current_cards[6]}.jpg", :width => 0.25
				@card23.click {
					addCardToSet("#{current_cards[6]}")
				}
			@card24 = image "cards/#{current_cards[7]}.jpg", :width => 0.25
				@card24.click {
					addCardToSet("#{current_cards[7]}")
				}
		}
	
		flow {
			@card31 = image "cards/#{current_cards[8]}.jpg", :width => 0.25
				@card31.click {
					addCardToSet("#{current_cards[8]}")
				}
			@card32 = image "cards/#{current_cards[9]}.jpg", :width => 0.25
				@card32.click {
					addCardToSet("#{current_cards[9]}")
				}
			@card33 = image "cards/#{current_cards[10]}.jpg", :width => 0.25
				@card33.click {
					addCardToSet("#{current_cards[10]}")
				}
			@card34 = image "cards/#{current_cards[11]}.jpg", :width => 0.25
				@card34.click {
					addCardToSet("#{current_cards[11]}")
				}
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
  end

end
