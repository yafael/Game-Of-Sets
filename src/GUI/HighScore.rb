class HighScore

  attr_reader :highscores

  def initialize
    @highscores = []
    if !File.exist? ('highScores.txt')
      #If file doesn't exist, create one and add five dummy scores.
      File.open('highScores.txt', 'w+') {|f| 5.times {f.write("UNKNOWN\n0\n")}}
      5.times {@highscores.push ['UNKNOWN', 0]}
    else
      #If file exists, load high scores from file
      File.open ('highScores.txt') do |f|
        5.times do
          name, score = f.readline().delete("\n"), f.readline().delete("\n").to_i
          @highscores.push [name, score]
        end
      end
    end
  end


  # Adds a given score to high scores if score is in top 5 high-scores.
  # Also writes highScores to file
  # +name+:: Name of user
  # +score+:: Score of user
  def add_score (name, score)
    i = 0

    #Insert high score at appropriate location0
    while i < 5 && score < @highscores[i][1]
      i+=1
    end

    @highscores.insert i, [name, score]

    #Reformat the array so only first five high scores are stored
    @highscores.delete_at (@highscores.length - 1)

    #Write updated list to file
    File.open('highScores.txt', 'w+') {|f|
      (0..4).each {|i| f.write(@highscores[i][0].to_s + "\n" + @highscores[i][1].to_s + "\n")}
    }

  end

end
