require_relative 'deck.rb'

class GameModel

  attr_reader :current_cards
  attr_reader :rows

  MIN_CARDS = 3

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
  end

  def replaceCard (row, column)
    @current_cards[row][column] = @deck.removeAny
  end

  def putAdditionalThree
    @current_cards.push [@deck.removeAny, @deck.removeAny, @deck.removeAny]
  end

  def isOver?
    @deck.cardsRemaining < MIN_CARDS
  end

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
