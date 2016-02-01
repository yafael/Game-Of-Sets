class Instructions
	def self.showInstructions
	Shoes.app :title => "High Scores", :width => 1024, :height => 576 do
		@mainMenu = button 'Main Menu'
      		@mainMenu.move(460, 530)
    		@mainMenu.click {
      			Main_menu.startMainMenu
			close
    		}
		stack(:width  => 1024, :height => 576, :scroll => false) do
			background '../../images/backgroung.jpg', :width => 1024, :height => 576

			stack :width => "100%" do
				@title = title 'Instructions: The Game of Sets', :stroke => white, :align => 'center', :font => 'Trebuchet MS', :top => 20

			@slot1 = stack do
				@intro = para em(('* Set is a real-time card game consisting of 81 unique cards varying in four features: number (1,2,3), symbol(diamond, squiggle, oval), shading(solid, striped, open), color(red, green, purple) '))
				@intro.style(stroke: white)
				@intro.move(0,80)
				end

			@slot2 = stack do
				@details = para('A set consists of three cards which satisfies all of the following conditions:'+"\n\t\t" +'  *They all have same number or they all have different number'+"\n\t\t" +'*They all have same symbol or they all have different symbol'+"\n\t\t" +' *They all have same shading or they all have different shading'+"\n\t\t" +' *They all have same color or they all have different color')
				@details.style(stroke: white)
				@details.move(0, 150)						
			end
			
			@slot3 = stack do
				@instr = para('Game consists of 3 modes: Arcade (Get as many sets in 5 minutes), vs Computer (Play against a computer), vs Human (play against your friend)' + "\n\n" + 'If you find a set, click on the the three cards')
				@instr.style(stroke: white)
				@instr.move(0,300)
			end
			end

		end
	end
	end
end
