# TODO: [Katie 1.29.16] implement CLI functionality when cards are clicked--card clicks are functioning as of this version, but no Set-checking is performed

require_relative 'game_model.rb'
require_relative 'GUI_Utility.rb'
require_relative 'utility.rb'
require_relative 'Main_menu.rb'

class Game

  def self.playGame(numOfPlayers, opponent)
    Shoes.app :title => "The Game of Set", :width => 1024, :height => 576 do

    # button to close game window and return to main menu
    @mainMenu = button 'Main Menu'
      @mainMenu.move(800, 540)
    @mainMenu.click {
      Main_menu.startMainMenu
      close
    }
 
    # button to exit game entirely
    @exit = button 'Exit'
      @exit.move(930,540)
      @exit.click { exit }

    # create deck and pull out initial 12 cards, saving printable names (without .jpg extension) in current_cards array
   deck = Deck.new
    current_cards = []
    for i in 0...12 do
	  card = deck.removeAny
	  current_cards.push card.printCard
    end

        # current cards: card names are cardCOLROW, where col = 1 - 3 and row = 1 - 4
	stack {
		flow {
			@card11 = image "cards/#{current_cards[0]}.jpg", :width => 0.25 
				@card11.click {
				        # this alert is just to show that the image click works
					alert "The click WORKED!"
				}
			@card12 = image "cards/#{current_cards[1]}.jpg", :width => 0.25
				@card12.click {
					#addCardToSet("#{current_cards[1]}")
				}
			@card13 = image "cards/#{current_cards[2]}.jpg", :width => 0.25
				@card13.click {
					#addCardToSet("#{current_cards[2]}")
				}
			@card14 = image "cards/#{current_cards[3]}.jpg", :width => 0.25
				@card14.click {
					#addCardToSet("#{current_cards[3]}")
				}
		}

		flow {
			@card21 = image "cards/#{current_cards[4]}.jpg", :width => 0.25
				@card21.click {
					#addCardToSet("#{current_cards[4]}")
				}
			@card22 = image "cards/#{current_cards[5]}.jpg", :width => 0.25
				@card22.click {
					#addCardToSet("#{current_cards[5]}")
				}
			@card23 = image "cards/#{current_cards[6]}.jpg", :width => 0.25
				@card23.click {
					#addCardToSet("#{current_cards[6]}")
				}
			@card24 = image "cards/#{current_cards[7]}.jpg", :width => 0.25
				@card24.click {
					#addCardToSet("#{current_cards[7]}")
				}
		}
	
		flow {
			@card31 = image "cards/#{current_cards[8]}.jpg", :width => 0.25
				@card31.click {
					#addCardToSet("#{current_cards[8]}")
				}
			@card32 = image "cards/#{current_cards[9]}.jpg", :width => 0.25
				@card32.click {
					#addCardToSet("#{current_cards[9]}")
				}
			@card33 = image "cards/#{current_cards[10]}.jpg", :width => 0.25
				@card33.click {
					#addCardToSet("#{current_cards[10]}")
				}
			@card34 = image "cards/#{current_cards[11]}.jpg", :width => 0.25
				@card34.click {
					#addCardToSet("#{current_cards[11]}")
				}
		}
	}

    model = GameModel.new
    playersTurn = 1
    playersScore = [0, 0]
    cardsChosen = []
    # GUI_Utility.putThreeNewCards(model)
    while !model.isOver?
      GUI_Utility.printCards(model.current_cards, model.rows)
      model.current_cards[0][0].buttn.move(100,300)

      cardsChosen = GUI_Utility.printSelection(numOfPlayers, playersTurn, opponent)

      fC = cardsChosen[0]
      sC = cardsChosen[1]
      tC = cardsChosen[2]

      while !Utility.areUnique(fC, sC, tC)
        alert "The cards that were chose were not unique. Please try again:"
        next
	fC = cardsChosen[0]
        sC = cardsChosen[1]
        tC = cardsChosen[2]
      end

      if Utility.isSet?(fC, sC, tC)
	GUI_Utility.addScore(numOfPlayers, playersTurn, opponent, playersScore)
        model.replaceCard first[0], first[1]
        model.replaceCard second[0], second[1]
        model.replaceCard third[0], third[1]
      else
	GUI_Utility.printFailedToFindSet(numOfPlayers, playersTurn, opponent, playersScore)
      end
      if playersTurn <= 2 && playersTurn >= 2
        playersTurn = 1
      elsif opponent.eql?("Computer")
        playersTurn = 2
      end
    end

  end


  end

end
