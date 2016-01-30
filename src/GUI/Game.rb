require_relative 'game_model.rb'
require_relative 'GUI_Utility.rb'
require_relative 'utility.rb'
require_relative 'Main_menu.rb'

class Game

  def self.playGame(numOfPlayers, opponent)
    Shoes.app :title => "The Game of Set", :width => 1024, :height => 576 do

    @rows = 4

    # button to close game window and return to main menu
    @mainMenu = button 'Main Menu'
      @mainMenu.move(800, 540)
    @mainMenu.click {
      Main_menu.startMainMenu
    }
 
    # button to exit game entirely
    @exit = button 'Exit'
      @exit.move(930,540)
      @exit.click { exit }

	@addThreeCards = button 'Add Three Cards'
		@addThreeCards.move(400, 540)
	@removeThreeCards = button 'Remove Three Cards'
		@removeThreeCards.move(600, 540)

# method to fill up the set array with the chosen cards
	def addCardToSet(playerSet, cardName)
		playerSet.push cardName
		if playerSet.length == 3
			self.checkSet(playerSet)
		end
	end

	# method to call Utility method to deterine whether or not the cards are a valid Set, and provide an alert either way
	def checkSet(playerSet)
		if Utility.isSet?(playerSet[0], playerSet[1], playerSet[2])
			alert "SET FOUND!"
			# clear out the set array so it can be used again
			playerSet.clear
		else 
			alert "That's not a Set."
			# clear out the set array so it can be used again
			playerSet.clear
		end
	end

    # array to hold Set cards
    playerSet = []

    # create deck and pull out initial 12 cards, saving printable names (without .jpg extension) in current_cards array
   deck = Deck.new
    current_cards = []
    for i in 0...12 do
	  card = deck.removeAny
	  current_cards.push card
    end
	
	# 12 cards: oW = 10% iW = 20% cW = 204
	# 15 cards: oW = 10% iW = 16% cW = 170
	# 18 cards: oW = 5% iW = 15% cW = 170
	@outerWidth = '10%'
	@innerWidth = '20%'
	@cardWidth = 204 # 4 - 256, 5 - 204.8

        # card names are cardCOLROW, where col = 1 - 3 and row = 1 - 4
	flow {
		flow :width => @outerWidth do 
		end
		@f1 = flow :width => @innerWidth do
			@card1 = image "cards/#{current_cards[0].printCard}.jpg", :width => @cardWidth
				@card1.click {
					#addCardToSet("#{current_cards[0][0]}")
					# @card1.path = "cards/#{current_cards[1].printCard}.jpg"
				}
			@card2 = image "cards/#{current_cards[1].printCard}.jpg", :width => @cardWidth
				@card2.click {
					#addCardToSet("#{current_cards[0][1]}")
				}
			@card3 = image "cards/#{current_cards[2].printCard}.jpg", :width => @cardWidth
				@card3.click {
					# addCardToSet("#{current_cards[0][2]}")
				}
		end
		@f2 = flow :width => @innerWidth do
			@card4 = image "cards/#{current_cards[3].printCard}.jpg", :width => @cardWidth
				@card4.click {
					# addCardToSet("#{current_cards[1][0]}")
				}
			@card5 = image "cards/#{current_cards[4].printCard}.jpg", :width => @cardWidth
				@card5.click {
					# addCardToSet("#{current_cards[1][1]}")
				}
			@card6 = image "cards/#{current_cards[5].printCard}.jpg", :width => @cardWidth
				@card6.click {
					# addCardToSet("#{current_cards[1][2]}")
				}
		end
		@f3 = flow :width => @innerWidth do
			@card7 = image "cards/#{current_cards[6].printCard}.jpg", :width => @cardWidth
				@card7.click {
					# addCardToSet("#{current_cards[2][0]}")
				}
			@card8 = image "cards/#{current_cards[7].printCard}.jpg", :width => @cardWidth
				@card8.click {
					# addCardToSet("#{current_cards[2][1]}")
				}
			@card9 = image "cards/#{current_cards[8].printCard}.jpg", :width => @cardWidth
				@card9.click {
					# addCardToSet("#{current_cards[2][2]}")
				}
		end
		@f4 = flow :width => @innerWidth do
			@card10 = image "cards/#{current_cards[9].printCard}.jpg", :width => @cardWidth
				@card10.click {
					# addCardToSet("#{current_cards[3][0]}")
				}
			@card11 = image "cards/#{current_cards[10].printCard}.jpg", :width => @cardWidth
				@card11.click {
					# addCardToSet("#{current_cards[3][1]}")
				}
			@card12 = image "cards/#{current_cards[11].printCard}.jpg", :width => @cardWidth
				@card12.click {
					# addCardToSet("#{current_cards[3][2]}")
				}
		end
		@f5 = flow :width => @innerWidth do
			@card13 = image "cards/#{Deck.new.removeAny.printCard}.jpg", :width => @cardWidth
				@card13.click {
					# addCardToSet("#{current_cards[3][0]}")
				}
			@card14 = image "cards/#{Deck.new.removeAny.printCard}.jpg", :width => @cardWidth
				@card14.click {
					# addCardToSet("#{current_cards[3][1]}")
				}
			@card15 = image "cards/#{Deck.new.removeAny.printCard}.jpg", :width => @cardWidth
				@card15.click {
					# addCardToSet("#{current_cards[3][2]}")
				}
		end
		@f6 = flow :width => @innerWidth do
			@card16 = image "cards/#{Deck.new.removeAny.printCard}.jpg", :width => @cardWidth
				@card16.click {
					# addCardToSet("#{current_cards[3][0]}")
				}
			@card17 = image "cards/#{Deck.new.removeAny.printCard}.jpg", :width => @cardWidth
				@card17.click {
					# addCardToSet("#{current_cards[3][1]}")
				}
			@card18 = image "cards/#{Deck.new.removeAny.printCard}.jpg", :width => @cardWidth
				@card18.click {
					# addCardToSet("#{current_cards[3][2]}")
				}
		end
		flow :width => @outerWidth do 
		end
	}	
	@addThreeCards.click {
		if @rows <= 4 && @rows >= 4
			@f1.style(:width => '16%')
			@f2.style(:width => '16%')
			@f3.style(:width => '16%')
			@f4.style(:width => '16%')
			@f5.style(:width => '16%')
			Utility.changeThreeCardsWidth(@card1, @card2, @card3, 170)
			Utility.changeThreeCardsWidth(@card4, @card5, @card6, 170)
			Utility.changeThreeCardsWidth(@card7, @card8, @card9, 170)
			Utility.changeThreeCardsWidth(@card10, @card11, @card12, 170)
			Utility.changeThreeCardsWidth(@card13, @card14, @card15, 170)
			Utility.showThreeCards(@card13, @card14, @card15)
		end
	}
	@removeThreeCards.click {
		
	}
	Utility.hideThreeCards(@card13, @card14, @card15)
	Utility.hideThreeCards(@card16, @card17, @card18)
	if(numOfPlayers >= 2 && numOfPlayers <= 2)
		flow {
			stack :width => '20%' do
				@player21coreText = para "Player 1 Score: #{player1Score}", :align => 'center'
			end
			stack :width => '60%' do 
				@playersTurnStr = para "Player 1's turn: Please choose three cards.", :align => 'center'
			end
			stack :width => '20%' do
				@player2ScoreText = para "Player 2 Score: #{player2Score}", :align => 'center'
			end
		}
	elsif(opponent.eql?("Computer"))
		flow {
			stack :width => '20%' do
				@player21coreText = para "Player 1 Score: #{player1Score}", :align => 'center'
			end
			stack :width => '60%' do 
			end
			stack :width => '20%' do
				@player2ScoreText = para "Computer's Score: #{player2Score}", :align => 'center'
			end
		}
	else
		flow {
			stack :width => '100%' do
				@player21coreText = para "Player 1 Score: #{player1Score}", :align => 'center'
			end
		}
	end
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
Game.playGame(1, "Self")
