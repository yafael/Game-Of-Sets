=begin
This is the main menu of the set game
=end
	
class Main_menu	
	Shoes.app :title => "Main Menu", :width => 1024, :height => 576 do
		background 'https://cloud.githubusercontent.com/assets/8756717/12506966/b3118b38-c0c0-11e5-8cd2-be1efa88c4bc.jpg', :width => 1024, :height => 576
		
		stack :width => "100%" do
			@title = banner 'The Game of Sets', :stroke => white, :align => 'center', :font => 'Trebuchet MS', :top => 80
		end
		rotate 90
		@Arcade = subtitle 'Arcade', :stroke => white
			@Arcade.move(128,300)
		@Comp = subtitle 'vs Computer', :stroke => white
			@Comp.move(260,300)			
		@Human = subtitle 'vs Human', :stroke => white
			@Human.move(398,210)
		@Instr = subtitle 'Instructions', :stroke => white
			@Instr.move(534,170)
		@Hsc = subtitle 'High Scores', :stroke => white
			@Hsc.move(670,110)
		rotate 270
		@exit = button 'Exit'
			@exit.move(930,540)

		@exit.click do
			exit
		end
	end
end

