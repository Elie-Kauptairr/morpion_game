require_relative 'board_case'

class Board 
  attr_accessor :cases

  def initialize                       # création de la def qui permet de crée les 9 cases du plateau avec leurs positions respectives 
    @cases = [ 
      BoardCase.new("A1"), BoardCase.new("A2"), BoardCase.new("A3"),
      BoardCase.new("B1"), BoardCase.new("B2"), BoardCase.new("B3"),
      BoardCase.new("C1"), BoardCase.new("C2"), BoardCase.new("C3")
    ]
  end

  def display_board                    # création de la def qui permet d'afficher le tableau sous forme de grille dans le terminal, content = contenu qui seront " " "x" "o"
    puts "   1   2   3"
    puts "A  #{@cases[0].content} | #{@cases[1].content} | #{@cases[2].content}"
    puts "  ---|---|---"
    puts "B  #{@cases[3].content} | #{@cases[4].content} | #{@cases[5].content}"
    puts "  ---|---|---"
    puts "C  #{@cases[6].content} | #{@cases[7].content} | #{@cases[8].content}"
  end
end
