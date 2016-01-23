class Card

  #Declare getter methods.
  attr_reader :color
  attr_reader :fillType
  attr_reader :shapeType
  attr_reader :numberOfSymbols
  attr_reader :fileName

  # Constructor. Initializes card object
  # Params:
  # +colr+:: Color of the card. Can be 'red', 'green', 'purple'
  # +fillType+:: Fill type of card. Can be 'Diamond', 'Squiggle', 'RoundedRectangle'
  # +shpType+:: Shape type of the card. Can be 'Solid', 'Striped', 'Empty'
  # +numSymbs+:: Number of symbols on the card. Can be 1, 2 or 3.
  def initialize(colr, fllType, shpType, numSymbs)
    @color = colr
    @fillType = fllType
    @shapeType = shpType
    @numberOfSymbols = numSymbs
    @fileName = "#{colr}_#{fllType}_#{shpType}_#{numSymbs}.fileExt"
  end

  # Overridden to_s (toString) method for Card object type.
  # Returns string version of the object.
  def to_s
    "#{@color}, #{@fillType}, #{@shapeType}, #{@numberOfSymbols}"
  end


  # Returns string version to print a card to game console. The printed string is NOT the one returned by to_s.
  def printCard
    "#{@color[0]}#{@fillType[0]}#{@shapeType[0]}#{@numberOfSymbols}"
  end

  def equal?(c2)
    @color <=> c2.color && @fillType <=> c2.fillType && @shapeType <=> c2.shapeType && @numberOfSymbols <=> c2.numberOfSymbols
  end

end
