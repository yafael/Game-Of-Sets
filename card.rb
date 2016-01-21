class Card
  def initialize(numSymbs, symbType, shadeType, colr)
    @numberOfSymbols = numSymbs
    @symbolType = symbType
    @shadingType = shadeType
    @color = colr
    # @fileName = numSymbs[0] + "_" + symbType[0,4] + "_" + shadeType[0,3] + "_" + colr[0,3]
  end
  def to_s
    puts "#{@numberOfSymbols}, #{@symbolType}, #{@shadingType}, #{@color}"
  end
  def fileName
    # puts @fileName
  end
end
