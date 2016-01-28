require_relative 'deck.rb'

class GameModel

  attr_reader :current_cards
  attr_reader :rows
  attr_reader :deck

  MIN_CARDS = 3

  #Initializes the object.
  def initialize
    @deck = Deck.new
    @current_cards = []
    @rows = 4
    for i in 0..3
      threeCards = []
      for j in 0..2
        threeCards.push @deck.removeAny
      end
      @current_cards.push threeCards
    end

    @player1Score = 0;
    @player2Score = 0;
  end

  #Replaces a card at index (row, column) with another card from DECK.
  # +row+:: Row where card is located.
  # +column+:: Column where card is located.
  def replaceCard (row, column)
    @current_cards[row][column] = @deck.removeAny
  end

  def isOver?
    @deck.cardsRemaining < MIN_CARDS
  end

  #Returns string version of the model.
  def to_s
    @current_cards.to_s
  end

  def add_row
    @rows += 1
    newRow = []
    for i in 0..3
      newRow[i] = @deck.removeAny
    end
    @current_cards.push newRow
  end
end
