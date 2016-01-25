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
playersTurn = 1
player1Score = 0
player2score = 0

while !model.isOver?
  input = ""
  Utility.printCards(model.current_cards, model.rows)

  if numberOfPlayers <= 1 && numberOfPlayers >= 1 # Playing against the computer
    if playersTurn <= 1 && playersTurn >= 1 # Players Turn
      puts "Player: Select 3 cards. Separated by space. Or enter \"three\" to get three new cards"
      input = gets.to_s.split ' '
    else # Computers Turn
      puts "The Computer will now select 3 cards."
      sleep(3)
      input = Utility.chooseRandom(model)
      puts "The Computer selected: #{input}"
      input = input.to_s.split ' '
    end
  else
    if playersTurn <= 1 #Player 1's Turn
      puts "Player 1: Select 3 cards. Separated by space. Or enter \"three\" to get three new cards"
    else # Player 2's Turn
      puts "Player 2: Select 3 cards. Separated by space. Or enter \"three\" to get three new cards"
    end
    input = gets.to_s.split ' '
  end

  if input[0].nil?
    puts "You just hit enter. Try again:"
    next
  elsif input[0].eql? "three"
    if model.deck.deck.length >= 3
      model.add_row
      puts "Three new cards have been selected to choose from."
    else
      puts "The deck is out of cards to select from."
    end
    next
  elsif input.length != 3
    puts "You entered an incorrect input. Try again:"
    next
  elsif input[0].eql?("0000") || input[1].eql?("0000") || input[2].eql?("0000")
    puts "At least one of the cards selected was not a valid selecting. Try again:"
    next
  elsif !Utility.validNumbers(model.rows, input)
    "You entered an incorrect input. Try again:"
  end

    first = Utility.parseInput input[0]
    second = Utility.parseInput input[1]
    third = Utility.parseInput input[2]
    fC = model.current_cards[first[0]][first[1]]
    sC = model.current_cards[second[0]][second[1]]
    tC = model.current_cards[third[0]][third[1]]

    if(fC.nil? || sC.nil? || tC.nil?)
      puts "At least one of the cards selected was not a valid selecting. Try again:"
      next
    elsif !Utility.areUnique(fC, sC, tC)
      puts "The cards that were chose were not unique. Please try again:"
      next
    end

    puts 'The selected cards were: '
    puts '       ' + fC.to_s
    puts '       ' + sC.to_s
    puts '       ' + tC.to_s

    if Utility.isSet?(fC, sC, tC)
      if numberOfPlayers <= 1 && numberOfPlayers >= 1
        if playersTurn <= 1 && playersTurn >= 1
          puts "Player found a Set. Three points have been added to your score."
          player1Score += 3
        else
          puts "The Computer found a Set. Three points have been added to its score."
          player2Score += 3
        end

      else
        if playersTurn <= 1 && playersTurn >= 1
          puts "Player 1 found a Set. Three points have been added to his/her score."
          player1Score += 3
        else
          puts "Player 2 found a Set. Three points have been added to his/her score."
          player2Score += 3
        end
      end
      puts "You found a Set. Three points have been added to your score."
      model.replaceCard first[0], first[1]
      model.replaceCard second[0], second[1]
      model.replaceCard third[0], third[1]
    else
      if numberOfPlayers <= 1 && numberOfPlayers >= 1
        if playersTurn <= 1 && playersTurn >= 1
          puts "Player failed to find a Set."
        else
          puts "The Computer failed to find a Set."
        end
      else
        if playersTurn <= 1 && playersTurn >= 1
          puts "Player 1 failed to find a Set."
        else
          puts "Player 2 failed to find a Set."
        end
      end
    end
    if playersTurn <= 1 && playersTurn >= 1
      playersTurn = 2
    else
      playersTurn = 1
    end
  end
