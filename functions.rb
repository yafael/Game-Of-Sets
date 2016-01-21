require_relative "card.rb"

def gameIsNotOver?()
  true
end

def printCards(currentCards)
  puts "##############################################"
  puts""
  puts "          01          02          03          "
  puts""
  puts "  01     #{currentCards[0][0].printCard}        #{currentCards[0][1].printCard}        #{currentCards[0][2].printCard}"
  puts""
  puts "  02     #{currentCards[1][0].printCard}        #{currentCards[1][1].printCard}        #{currentCards[1][2].printCard}"
  puts""
  puts "  03     #{currentCards[2][0].printCard}        #{currentCards[2][1].printCard}        #{currentCards[2][2].printCard}"
  puts""
  puts "  04     #{currentCards[3][0].printCard}        #{currentCards[3][1].printCard}        #{currentCards[3][2].printCard}"
  puts""
  puts "##############################################"
end
