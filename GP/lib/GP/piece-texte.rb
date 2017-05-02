module GP


# Module qui specifi les details du format
#  textuel pour la base de donnees,
#
#
#
  module PiecesTexte
# Separateur pour les champs d'un enregistrement specifiant une piece.
#
  SEPARATEUR = '|'
  SEP = SEPARATEUR

# methode pour creer un objet piece a partir d'une ligne lue dans le
# depot de donnees.
#
  def self.creer_piece( ligne )
    noSerie, type, description = ligne.chomp.split(SEP)
    Piece.new( noSerie.to_sym, type, description )
  end

# Methode pour sauvegarder un objet piece dans le depot de donnees.
#
  def self.sauver_piece( fich, piece )

   fich.puts [piece.noSerie, piece.type, piece.description].join(PiecesTexte::SEP)
  end

 end
end
