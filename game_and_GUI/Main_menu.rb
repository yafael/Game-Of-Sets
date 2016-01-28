=begin
This is the main menu of the set game
=end

require_relative 'GUI_Utility.rb'
require_relative 'Game.rb'
require_relative 'Instructions.rb'
require_relative 'HighScore.rb'

class Main_menu
	Shoes.app :title => "Main Menu", :width => 1024, :height => 576 do
			background 'backgroung.jpg', :width => 1024, :height => 576
		stack :width => "100%" do
			@title = banner 'The Game of Sets', :stroke => white, :align => 'center', :font => 'Trebuchet MS', :top => 30
		end
		rotate 90
		@mainMenu = button 'Main Menu'
			@mainMenu.move(10000, 10000)
		@Arcade = button 'Arcade'
			@Arcade.move(65,300)
		@Comp = button 'vs Computer' 
			@Comp.move(250,300)			
		@Human = button 'vs Human'
			@Human.move(465,300)
		@Instr = button 'Instructions'
			@Instr.move(655,300)
		@Hsc = button 'High Scores'
			@Hsc.move(865,300)
		rotate 270
		@exit = button 'Exit'
			@exit.move(930,540)
		@exit.click { exit }
		@Arcade.click { Utility.hideButtons(@Arcade, @Comp, @Human, @Instr, @Hsc)
		  Game.playGame(1, "Self")
		}
		@Comp.click { Utility.hideButtons(@Arcade, @Comp, @Human, @Instr, @Hsc)
		  Game.playGame(1, "Computer")
		}
		@Human.click { Utility.hideButtons(@Arcade, @Comp, @Human, @Instr, @Hsc)
		  Game.playGame(2, "Human")
		}
		@Instr.click { Utility.hideButtons(@Arcade, @Comp, @Human, @Instr, @Hsc)
		  Instructions.showInstructions
		}
		@Hsc.click { Utility.hideButtons(@Arcade, @Comp, @Human, @Instr, @Hsc)
		  HighScore.showHighScores
		}
	end
end	

