require_relative "deck.rb"

class Utility


  # Static method checks if given three cards form a valid set
  # +cardOne+:: First card that might form a set
  # +cardTwo+:: Second card that might form a set
  # +cardThree+:: Third card that might form a set.
  def self.isSet? (cardOne, cardTwo, cardThree)
    checkColor?(cardOne, cardTwo, cardThree) && checkFill?(cardOne, cardTwo, cardThree) &&
        checkSymbol?(cardOne, cardTwo, cardThree) && checkNumber?(cardOne, cardTwo, cardThree)
  end

  private
  # Static method checks if colors in given three cards form a valid set configuration
  # +cardOne+:: First card that might form a set
  # +cardTwo+:: Second card that might form a set
  # +cardThree+:: Third card that might form a set.
  def self.checkColor? (one, two, three)
    (one.color == two.color && two.color == three.color) ||
        (one.color != two.color && one.color != three.color && two.color != three.color)
  end

  # Static method checks if fill in given three cards form a valid set configuration
  # +cardOne+:: First card that might form a set
  # +cardTwo+:: Second card that might form a set
  # +cardThree+:: Third card that might form a set.
  def self.checkFill? (one, two, three)
    (one.fillType == two.fillType && two.fillType == three.fillType) ||
        (one.fillType != two.fillType && one.fillType != three.fillType && two.fillType != three.fillType)
  end

  # Static method checks if symbol in given three cards form a valid set configuration
  # +cardOne+:: First card that might form a set
  # +cardTwo+:: Second card that might form a set
  # +cardThree+:: Third card that might form a set.
  def self.checkSymbol? (one, two, three)
    (one.shapeType == two.shapeType && two.shapeType == three.shapeType) ||
        (one.shapeType != two.shapeType && one.shapeType != three.shapeType && two.shapeType != three.shapeType)
  end

  # Static method checks if number of symbols in given three cards form a valid set configuration
  # +cardOne+:: First card that might form a set
  # +cardTwo+:: Second card that might form a set
  # +cardThree+:: Third card that might form a set.
  def self.checkNumber? (one, two, three)
    (one.numberOfSymbols == two.numberOfSymbols && two.numberOfSymbols == three.numberOfSymbols) ||
        (one.numberOfSymbols != two.numberOfSymbols && one.numberOfSymbols != three.numberOfSymbols &&
            two.numberOfSymbols != three.numberOfSymbols)
  end

end
