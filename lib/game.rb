require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :player1, :player2, :board, :current_player

  def initialize
    puts "Nom du Joueur 1 :"
    print "> "
    name1 = gets.chomp
    @player1 = Player.new(name1, "x")

    puts "Nom du Joueur 2 :"
    print "> "
    name2 = gets.chomp
    @player2 = Player.new(name2, "o")

    @board = Board.new
    @current_player = @player1
  end

  def play
    until game_over?
      play_turn
    end
    @board.display_board
    puts "La partie est terminée !"
  end

  def play_turn
    @board.display_board
    puts "#{@current_player.name}, à toi de jouer ! Choisis une case :"
    print "> "
    choice = gets.chomp

    chosen_case = @board.cases.find { |board_case| board_case.position == choice }
    
    if chosen_case && chosen_case.content == " "
      chosen_case.content = @current_player.symbol
      switch_player
    else
      puts "Choix invalide. Réessaie."
    end
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
    puts "C'est maintenant le tour de #{@current_player.name}."
  end

  def game_over?
    # Combinaisons gagnantes : chaque combinaison est un ensemble d'indices du tableau `@cases`
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ]

    # Vérifier si une combinaison gagnante est remplie
    winning_combinations.each do |combination|
      if @board.cases[combination[0]].content == @current_player.symbol &&
        @board.cases[combination[1]].content == @current_player.symbol &&
        @board.cases[combination[2]].content == @current_player.symbol
        puts "Félicitations #{@current_player.name}, tu as gagné !"
        return true
      end
    end

    # Vérifier le match nul
    if @board.cases.all? { |board_case| board_case.content != " " }
      puts "Match nul ! Personne ne gagne."
      return true
    end

    false
  end
end
