class Player                           # création de la class
  attr_accessor :name, :symbol         # permet d'accéder et de modifier les variables name et symbol depuis l'extérieur de la classe 

  def initialize(name, symbol)         # définition qui initialise le nom et le symbole 
    @name = name 
    @symbol = symbol
  end
end