class BoardCase                        # création de la class
  attr_accessor :position, :content    # permet d'accéder et de modifier les variables d'instance position et content depuis l’extérieur de la classe.

  def initialize(position)             # définition qui permet de prendre en paramètre la position de la case et met par défaut du vide " "
    @position = position
    @content = " "  
  end
end