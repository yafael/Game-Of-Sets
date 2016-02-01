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
	
	@counter = 1		
	@Solitare = []
	@vsComputer = []
	@vsHuman = []
			
		f = File.open('highscore.txt', "r")
		f.each_line do |line|
			if line != "\n"
				if @counter <= 1 && @counter >= 1
					@Solitare.push line
				elsif @counter <= 2 && @counter >= 2
					@vsComputer.push line
				else
					@vsHuman.push line
				end
			else
				@counter += 1
			end		
		end
		f.close

	@f = flow {
		stack :width => '20%' do
			para "Computer", :align => 'center'
			@Solitare.each do |entry|
				para entry, :align => 'center'
			end
		end
		stack :width => '20%' do end
		stack :width => '20%' do
			para "vs Computer", :align => 'center'
			@vsComputer.each do |entry|
				para entry, :align => 'center'
			end			
		end
		stack :width => '20%' do end
		stack :width => '20%' do
			para "vs Human", :align => 'center'
			@vsHuman.each do |entry|
				para entry, :align => 'center'
			end			
		end
	}
	@f.move(0,150)
	end  
  end

end
