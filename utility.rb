require_relative "card.rb"

class Utility


  def self.checkValidity (cardOne, cardTwo, cardThree)
    checkColor(cardOne, cardTwo, cardThree) && checkFill(cardOne, cardTwo, cardThree) &&
        checkSymbol(cardOne, cardTwo, cardThree) && checkNumber(cardOne, cardTwo, cardThree)
  end

  private
  def checkColor (one, two, three)
    (one.color == two.color && two.color == three.color) ||
        (one.color != two.color && one.color != three.color && two.color != three.color)
  end

  def checkFill (one, two, three)
    (one.fillType == two.fillType && two.fillType == three.fillType) ||
        (one.fillType != two.fillType && one.fillType != three.fillType && two.fillType != three.fillType)
  end

  def checkSymbol (one, two, three)
    (one.shapeType == two.shapeType && two.shapeType == three.shapeType) ||
        (one.shapeType != two.shapeType && one.shapeType != three.shapeType && two.shapeType != three.shapeType)
  end

  def checkNumber (one, two, three)
    (one.numberOfSymbols == two.numberOfSymbols && two.numberOfSymbols == three.numberOfSymbols) ||
        (one.numberOfSymbols != two.numberOfSymbols && one.numberOfSymbols != three.numberOfSymbols &&
            two.numberOfSymbols != three.numberOfSymbols)
  end

end