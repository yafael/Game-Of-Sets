require_relative 'game_model.rb'

class GUI_Utility

  def self.hideButtons(arc, comp, humn, instr, hsc)
    arc.hide
    comp.hide
    humn.hide
    instr.hide
    hsc.hide
  end

  def self.showButtons(arc, comp, humn, instr, hsc)
    arc.show
    comp.show
    humn.show
    instr.show
    hsc.show
  end

  def self.printCards(current_cards, rows)
    card_buttons = []
    for i in 0..2
      for j in 0..rows-1
	current_cards[i][j].buttn.move(100,300)
      end
    end
  end

  def self.printSelection(numOfPlayers, playersTurn, opponent)
    # Implement this
    # "Player: Select 3 cards. Separated by space. Or enter \"three\" to get three new cards"
    # "The Computer will now select 3 cards."
    # "Player 1: Select 3 cards. Separated by space. Or enter \"three\" to get three new cards"
    # "Player 2: Select 3 cards. Separated by space. Or enter \"three\" to get three new cards"
  end

  def self.putThreeNewCards(model)
    model.add_row
    # printCards should now show three more cards
  end

  def self.addScore(numOfPlayers, playersTurn, opponent, playersScore)
    # "Player found a Set. Three points have been added to your score."
    # "The Computer found a Set. Three points have been added to its score."
    # "Player 1 found a Set. Three points have been added to his/her score."
    # "Player 2 found a Set. Three points have been added to his/her score."
  end

  def self.printFailedToFindSet(numOfPlayers, playersTurn, opponent, playersScore)
    # "Player failed to find a Set."
    # "The Computer failed to find a Set."
    # "Player 1 failed to find a Set."
    # "Player 2 failed to find a Set."
  end

  def self.showMainMenuButton(mainMenu)
    mainMenu.move(465, 125)
  end

  def self.hideMainMenuButton(mainMenu)
    mainMenu.move(10000, 10000)
  end

end
