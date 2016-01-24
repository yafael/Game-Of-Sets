require_relative 'game_model.rb'
require_relative 'utility.rb'


puts "Welcome to The Game of Set!"
puts "Will you be playing alone or with a friend?"
puts "Enter 1 for alone"
puts "Enter 2 for with a friend"

numberOfPlayers = gets.to_i
while numberOfPlayers <= 0 || numberOfPlayers > 2
  numberOfPlayers = gets.to_i
end

model = GameModel.new
while !model.isOver?
  Utility.printCards model.current_cards
  puts "Select 3 cards. Separated by space."
  input = gets.to_s.split ' '
  first = Utility.parseInput input[0]
  second = Utility.parseInput input[1]
  third = Utility.parseInput input[2]

  firstCard = model.current_cards[first[0]][first[1]]
  secondCard = model.current_cards[second[0]][second[1]]
  thirdCard = model.current_cards[third[0]][third[1]]

  #TODO: Need to check if no common cards are selected
  puts 'You selected the following cards: '
  puts '       ' + firstCard.to_s
  puts '       ' + secondCard.to_s
  puts '       ' + thirdCard.to_s

  if Utility.isSet?(firstCard, secondCard, thirdCard)
    puts "You found a Set"
    model.replaceCard first[0], first[1]
    model.replaceCard second[0], second[1]
    model.replaceCard third[0], third[1]
  else
    puts "You failed to find a set"
  end
end
