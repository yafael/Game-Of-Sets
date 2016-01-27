class Utility

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

end
