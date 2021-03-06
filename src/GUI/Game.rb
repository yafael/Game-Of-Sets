require_relative '../game_model.rb'
require_relative 'GUI_Utility.rb'
require_relative '../utility.rb'
require_relative 'Main_menu.rb'

class Game

  def self.playGame(numOfPlayers, opponent)

    Shoes.app :title => "The Game of Set", :width => 1024, :height => 576 do
	background '../../images/backgroung.jpg', :width => 1024, :height => 576

    @rows = 4
    @player1Score = 0
    @player2Score = 0
    @playersTurn = 1
    @positions = []
    # array to hold Set cards
    @playerSet = []
    @cardSet = []
     # create deck and pull out initial 12 cards, saving printable names (without .jpg extension) in current_cards array
    deck = Deck.new
    current_cards = []
    for i in 0...12 do
	  card = deck.removeAny
	  current_cards.push card
    end

    # button to close game window and return to main menu
    @mainMenu = button 'Main Menu'
      @mainMenu.move(460, 530)
    @mainMenu.click {
      Main_menu.startMainMenu
      close
    }
 
    # button to exit game entirely
    @exit = button 'Exit'
      @exit.move(930,540)
      @exit.click { exit }
	
	@addThreeCards = button 'Add Three Cards'
		@addThreeCards.move(437, 475)

	
		

# method to fill up the set array with the chosen cards
	def addCardToSet(playerSet, cardName, cardSet, card, positions, pos, current_cards, deck)
		playerSet.push cardName
		cardSet.push card
		positions.push pos
		if playerSet.length == 3
			# check for unique cards and Set; report results
			if Utility.areUnique(playerSet[0], playerSet[1], playerSet[2]) && Utility.isSet?(playerSet[0], playerSet[1], playerSet[2])
				alert 'Congratulations! You found a Set!'
				# update appropriate player score (!!!!NEED TO ADD 2-PLAYER SCORE UPDATING)
				@player1Score += 1
				@player21coreText.replace "Player 1 Score: #{@player1Score}", :align => 'center'
				self.updateCards(current_cards, cardSet, positions, deck)
			else
				alert 'Sorry, that is not a Set. Try again!'
			end
		playerSet.clear
		cardSet.clear
		positions.clear
		end
	end
	
	# 12 cards: oW = 10% iW = 20% cW = 200
	# 15 cards: oW = 10% iW = 16% cW = 160
	# 18 cards: oW = 5% iW = 15% cW = 150
	@outerWidth = '10%'
	@innerWidth = '20%'
	@cardWidth = 200

        # this is the basic card layout; card variable names are cardCOLROW, where col = 1 - 3 and row = 1 - 4
	flow {
		@f01 = flow :width => @outerWidth do 
		end
		@f1 = flow :width => @innerWidth do
			@card1 = image "../../images/cards/#{current_cards[0].printCard}.jpg", :width => @cardWidth		
				@card1.click {
					@card1.rotate 5
					self.addCardToSet(@playerSet, current_cards[0], @cardSet, @card1, @positions, 0, current_cards, deck) 
					# self.changeTurn(@playersTurn, opponent)
				}
			@card2 = image "../../images/cards/#{current_cards[1].printCard}.jpg", :width => @cardWidth	
				@card2.click {
					@card2.rotate 5
					self.addCardToSet(@playerSet, current_cards[1], @cardSet, @card2, @positions, 1, current_cards, deck)
				}
			@card3 = image "../../images/cards/#{current_cards[2].printCard}.jpg", :width => @cardWidth
				@card3.click {
					@card3.rotate 5
					self.addCardToSet(@playerSet, current_cards[2], @cardSet, @card3, @positions, 2, current_cards, deck)
				}
		end
		@f2 = flow :width => @innerWidth do
			@card4 = image "../../images/cards/#{current_cards[3].printCard}.jpg", :width => @cardWidth
				@card4.click {
					@card4.rotate 5
					self.addCardToSet(@playerSet, current_cards[3], @cardSet, @card4, @positions, 3, current_cards, deck)
				}
			@card5 = image "../../images/cards/#{current_cards[4].printCard}.jpg", :width => @cardWidth
				@card5.click {
					@card5.rotate 5
					self.addCardToSet(@playerSet, current_cards[4], @cardSet, @card5, @positions, 4, current_cards, deck)
				}
			@card6 = image "../../images/cards/#{current_cards[5].printCard}.jpg", :width => @cardWidth
				@card6.click {
					@card6.rotate 5
					self.addCardToSet(@playerSet, current_cards[5], @cardSet, @card6, @positions, 5, current_cards, deck)
				}
		end
		@f3 = flow :width => @innerWidth do
			
			@card7 = image "../../images/cards/#{current_cards[6].printCard}.jpg", :width => @cardWidth
				@card7.click {
					@card7.rotate 5
					self.addCardToSet(@playerSet, current_cards[6], @cardSet, @card7, @positions, 6, current_cards, deck)
				}

			@card8 = image "../../images/cards/#{current_cards[7].printCard}.jpg", :width => @cardWidth
				@card8.click {
					@card8.rotate 5
					self.addCardToSet(@playerSet, current_cards[7], @cardSet, @card8, @positions, 7, current_cards, deck)
				}
			@card9 = image "../../images/cards/#{current_cards[8].printCard}.jpg", :width => @cardWidth
				@card9.click {
					@card9.rotate 5
					self.addCardToSet(@playerSet, current_cards[8], @cardSet, @card9, @positions, 8, current_cards, deck)
				}
		end
		@f4 = flow :width => @innerWidth do
			@card10 = image "../../images/cards/#{current_cards[9].printCard}.jpg", :width => @cardWidth
				@card10.click {
					@card10.rotate 5
					self.addCardToSet(@playerSet, current_cards[9], @cardSet, @card10, @positions, 9, current_cards, deck)
				}
			@card11 = image "../../images/cards/#{current_cards[10].printCard}.jpg", :width => @cardWidth
				@card11.click {
					@card11.rotate 5
					self.addCardToSet(@playerSet, current_cards[10], @cardSet, @card11, @positions, 10, current_cards, deck)
				}
			@card12 = image "../../images/cards/#{current_cards[11].printCard}.jpg", :width => @cardWidth
				@card12.click {
					@card12.rotate 5
					self.addCardToSet(@playerSet, current_cards[11], @cardSet, @card12, @positions, 11, current_cards, deck)
				}
		end
		@f5 = flow :width => @innerWidth do
			@card13 = image "../../images/cards/#{Deck.new.removeAny.printCard}.jpg", :width => @cardWidth
				@card13.click {
					@card13.rotate 5
					self.addCardToSet(@playerSet, current_cards[12], @cardSet, @card13, @positions, 12, current_cards, deck)
				}
			@card14 = image "../../images/cards/#{Deck.new.removeAny.printCard}.jpg", :width => @cardWidth
				@card14.click {
					@card14.rotate 5
					self.addCardToSet(@playerSet, current_cards[13], @cardSet, @card14, @positions, 13, current_cards, deck)
				}
			@card15 = image "../../images/cards/#{Deck.new.removeAny.printCard}.jpg", :width => @cardWidth
				@card15.click {
					@card15.rotate 5
					self.addCardToSet(@playerSet, current_cards[14], @cardSet, @card15, @positions, 14, current_cards, deck)
				}
		end
		@f6 = flow :width => @innerWidth do
			@card16 = image "../../images/cards/#{Deck.new.removeAny.printCard}.jpg", :width => @cardWidth
				@card16.click {
					@card16.rotate 5
					self.addCardToSet(@playerSet, current_cards[15], @cardSet, @card16, @positions, 15, current_cards, deck)
				}
			@card17 = image "../../images/cards/#{Deck.new.removeAny.printCard}.jpg", :width => @cardWidth
				@card17.click {
					@card17.rotate 5
					self.addCardToSet(@playerSet, current_cards[16], @cardSet, @card17, @positions, 16, current_cards, deck)
				}
			@card18 = image "../../images/cards/#{Deck.new.removeAny.printCard}.jpg", :width => @cardWidth
				@card18.click {
					@card18.rotate 5
					self.addCardToSet(@playerSet, current_cards[17], @cardSet, @card18, @positions, 17, current_cards, deck)
				}
		end
		@f02 = flow :width => @outerWidth do 
		end
	}	
	
	@addThreeCards.click {
		if @rows <= 4 && @rows >= 4
			Utility.changeThreeCardsWidth(@card1, @card2, @card3, 160)
			Utility.changeThreeCardsWidth(@card4, @card5, @card6, 160)
			Utility.changeThreeCardsWidth(@card7, @card8, @card9, 160)
			Utility.changeThreeCardsWidth(@card10, @card11, @card12, 160)
			Utility.showThreeCards(@card13, @card14, @card15)
			Utility.showThreeCards(@card16, @card17, @card18)
			Utility.changeThreeCardsWidth(@card13, @card14, @card15, 160)
			Utility.changeThreeCardsWidth(@card16, @card17, @card18, 160)
			Utility.hideThreeCards(@card16, @card17, @card18)
			Utility.changeFiveFlowWidth(@f1, @f2, @f3, @f4, @f5)
			Utility.changeThreePaths(@card13, @card14, @card15, deck, current_cards, @rows)
			@rows += 1
		elsif @rows <= 5 && @rows >= 5
			@f01.style(:width => '5%')
			@f02.style(:width => '5%')
			Utility.changeThreeCardsWidth(@card1, @card2, @card3, 150)
			Utility.changeThreeCardsWidth(@card4, @card5, @card6, 150)
			Utility.changeThreeCardsWidth(@card7, @card8, @card9, 150)
			Utility.changeThreeCardsWidth(@card10, @card11, @card12, 150)
			Utility.changeThreeCardsWidth(@card13, @card14, @card15, 150)
			Utility.changeThreeCardsWidth(@card16, @card17, @card18, 150)
			Utility.showThreeCards(@card16, @card17, @card18)
			Utility.changeSixFlowWidth(@f1, @f2, @f3, @f4, @f5, @f6)
			Utility.changeThreePaths(@card16, @card17, @card18, deck, current_cards, @rows)
			@rows += 1
			@addThreeCards.hide
		end
	}
	Utility.hideThreeCards(@card13, @card14, @card15)
	Utility.hideThreeCards(@card16, @card17, @card18)
	if(numOfPlayers <= 2 && numOfPlayers >= 2)
		flow {
			stack :width => '20%' do
				@player21coreText = para "Player 1 Score: #{@player1Score}", :align => 'center'
			end
			stack :width => '60%' do 
				# @playersTurnStr = para "Player 1's turn: Please choose three cards.", :align => 'center'
			end
			stack :width => '20%' do
				@player2ScoreText = para "Player 2 Score: #{@player2Score}", :align => 'center'
			end
		}
	elsif(opponent.eql?("Computer"))
		flow {
			stack :width => '20%' do
				@player21coreText = para "Player 1 Score: #{@player1Score}", :align => 'center'
			end
			stack :width => '60%' do 
				# @playersTurnStr = para "Player 1's turn: Please choose three cards.", :align => 'center'
			end
			stack :width => '20%' do
				@player2ScoreText = para "Computer's Score: #{@player2Score}", :align => 'center'
			end
		}
	# this is the single player solitaire version
	else
		flow {
			stack :width => '100%' do
				@player21coreText = para "Player 1 Score: #{@player1Score}", :align => 'center'
				@playersTurnStr = para "Please choose three cards that form a Set!", :align => 'center'
			end
		}
	end

	def updateCards(current_cards, cardSet, positions, deck)
		@image1 = cardSet.pop
		@image2 = cardSet.pop
		@image3 = cardSet.pop
		if deck.cardsRemaining >= 3
			Utility.changeThreePaths2(@image1, @image2, @image3, deck, current_cards, positions)
		else
			@image1.path = "cards/#{Deck.new.removeAny.printCard}.jpg"
			@image2.path = "cards/#{Deck.new.removeAny.printCard}.jpg"
			@image3.path = "cards/#{Deck.new.removeAny.printCard}.jpg"
			@image1.hide
			@image2.hide
			@image3.hide
		end
	end

# ideally we don't want to have any turns because it's a speed game; we should figure out which player found the Set and update their score accordingly
=begin
	def changeTurn(num, comp)
		if num <= 1 && num >= 1
			if comp.eql?("Computer")
				@playersTurnStr.text = "The Computer will now choose three cards."
			else
				@playersTurnStr.text = "Player 2's turn: Please choose three cards."
			end
			@playersTurn = 2
		else
			@playersTurnStr.text = "Player 1's turn: Please choose three cards."
			@playersTurn = 1
		end
	end
=end

  end
  end

end
