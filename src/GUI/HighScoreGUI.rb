require_relative '../HighScore.rb'
require_relative '../game_model.rb'
require_relative 'GUI_Utility.rb'
require_relative '../utility.rb'
require_relative 'Main_menu.rb'
class HighScoreGUI

  def self.showHighScores
	Shoes.app :title => "High Scores", :width => 1024, :height => 576 do
		background '../../images/backgroung.jpg', :width => 1024, :height => 576
		stack :width => "100%" do
			@title = banner 'The Champions', :stroke => white, :align => 'center', :font => 'Trebuchet MS', :top => 30
		end
		
		score = highScore.new
		printScore = score.highScores
	
		printScore.each do |data|
			 data.each do |entry|
				para "#{entry}\n"			
			end
		end
	
	# button to close game window and return to main menu
	@mainMenu = button 'Main Menu'
      	@mainMenu.move(460, 530)
    	@mainMenu.click {
      		Main_menu.startMainMenu
      	close
    	}
 
    	# button to exit game entirely
    	@exit = button 'Exit'
      	@exit.move(930,540)
      	@exit.click { exit }
			
			
		#f = File.open('highscore.txt', "r")
		#f.each_line do |line|
		#	if line == "\n"
		#		para "New line found"
		#	elsif
		#		para "#{line}\n"
		#	end			
		#end
		#f.close
	end    

  end

end
