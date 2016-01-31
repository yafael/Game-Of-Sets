=begin
This is the main menu of the set game
=end

require_relative 'GUI_Utility.rb'
require_relative 'Game.rb'
require_relative 'instructions.rb'
require_relative 'HighScore.rb'
require_relative 'game_model.rb'

class Main_menu
	def self.startMainMenu
	Shoes.app :title => "Main Menu", :width => 1024, :height => 576 do
			background 'backgroung.jpg', :width => 1024, :height => 576
		stack :width => "100%" do
			@title = banner 'The Game of Set', :stroke => white, :align => 'center', :font => 'Trebuchet MS', :top => 30
		end
		rotate 90
		@Arcade = button 'Solitaire'
			@Arcade.move(65,300)
		@Comp = button 'vs. Computer' 
			@Comp.move(250,300)			
		@Human = button 'vs. Human'
			@Human.move(465,300)
		@Instr = button 'Instructions'
			@Instr.move(655,300)
		@Hsc = button 'High Scores'
			@Hsc.move(865,300)
		rotate 270
		@exit = button 'Exit'
			@exit.move(930,540)
		@exit.click { exit }
		@Arcade.click { 
		  Game.playGame(1, "Self")
		  close
		}
		@Comp.click { 
		  Game.playGame(1, "Computer")
		  close
		}
		@Human.click { 
		  Game.playGame(2, "Human")
		  close
		}
		@Instr.click { 
		  Instructions.showInstructions
		  close
		}
		@Hsc.click { 
		  HighScore.showHighScores	
		  close
		}
	end
	end
end	
