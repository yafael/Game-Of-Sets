class Card
  def initialize(colr, fllType, shpType, numSymbs)
    @color = colr
    @fillType = fllType
    @shapeType = shpType
    @numberOfSymbols = numSymbs
    @fileName = "#{colr}_#{fllType}_#{shpType}_#{numSymbs}.fileExt"
  end
  def to_s
    puts "#{@color}, #{@fillType}, #{@shapeType}, #{@numberOfSymbols}"
  end
  def fileName
    puts @fileName
  end
  def printCard
    "#{@color[0]}#{@fillType[0]}#{@shapeType[0]}#{@numberOfSymbols[0]}"
  end
end
