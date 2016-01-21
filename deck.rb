require_relative "card.rb"

class Deck
  def initialize
    @numbers  = [1, 2, 3]
    @shapes  = ['Diamond', 'Squiggle', 'RoundedRectangle']
    @fills = ['Solid', 'Striped', 'Empty']
    @colors   = ['Red', 'Green', 'Purple']
    @deck = Array.new(81)
    i = 0
    @numbers.each { |number|
      @shapes.each { |shape|
        @fills.each { |fill|
          @colors.each { |color|
            @deck[i] = Card.new(number, shape, fill, color)
            i += 1
          }
        }
      }
    }
    @deck.shuffle!
  end
  def to_s
    for i in 0..81
      @deck[i].to_s
    end
  end
  def removeAny
    @deck.pop
  end
end
