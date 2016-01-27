require_relative 'game_model.rb'
require_relative 'utility.rb'

#Welcome the players.
puts "Welcome to The Game of Set!"
puts "Will you be playing alone or with a friend?"
puts "Enter 1 for alone"
puts "Enter 2 for with a friend"

#Get numberOfPlayers and check for validity of the input.
numberOfPlayers = gets.to_i
while numberOfPlayers <= 0 || numberOfPlayers > 2
  numberOfPlayers = gets.to_i
end

#Create game using game model
model = GameModel.new
while !model.isOver?
  Utility.printCards(model.current_cards, model.rows)
  puts "Select 3 cards. Separated by space. Or enter \"three\" to get three new cards"
  input = gets.to_s.split ' '
  if input[0].eql? "three"
    model.add_row
  else
    first = Utility.parseInput input[0]
    second = Utility.parseInput input[1]
    third = Utility.parseInput input[2]

    #Get access to cards.
    fC = model.current_cards[first[0]][first[1]]
    sC = model.current_cards[second[0]][second[1]]
    tC = model.current_cards[third[0]][third[1]]

    #Check if selection was unique cards.
    if !Utility.areUnique(fC, sC, tC)
      puts "The cards you chose were not unique. Please try again:"
      next
    end

    #Output the actual values of the cards.
    puts 'You selected the following cards: '
    puts '       ' + fC.to_s
    puts '       ' + sC.to_s
    puts '       ' + tC.to_s

    #Check if selected cards form a set.
    if Utility.isSet?(fC, sC, tC)
      puts "You found a Set"
      model.replaceCard first[0], first[1]
      model.replaceCard second[0], second[1]
      model.replaceCard third[0], third[1]
    else
      puts "You failed to find a set"
    end

    #TODO: Add scoring systme and a time tracking file.
  end
end
