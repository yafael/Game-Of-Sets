require_relative "card.rb"
require_relative "deck.rb"
require_relative "functions.rb"

puts "Welcome to The Game of Set!"
puts "Will you be playing alone or with a friend?"
puts "Enter 1 for alone"
puts "Enter 2 for with a friend"

numPlayers = gets.to_i
while (numPlayers <= 0 || numPlayers > 2)
  puts "This is not an acceptable number of players."
  puts "Try again"
  numPlayers = gets.to_i
end

deck = Deck.new
currentCards = []
for i in 0..3
  threeCards = []
  for j in 0..2
    threeCards[j] = deck.removeAny
  end
  currentCards[i] = threeCards
end

if gameIsNotOver? # while
  printCards(currentCards)
  if numPlayers <= 1
   puts "Choose three cards"
   puts "0101 would be the very first card"
   puts "0203 would be the card in the second row and third column"
   puts "0304 would be the very last card"
  else
  
  end
end

# card1 = Card.new("2","Rectangle","Striped","Red")
# card1.to_s
# card1.fileName

deck = Deck.new
# deck.to_s
# puts deck.removeAny.to_s
