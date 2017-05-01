module GestionDepot


#Objet (singleton) qui encapsule le depot de donnees pour les pieces.
#Ne definit donc que des methodes de classe, sans methode d'instances.
#
#sert de respository (au sens du DDD de Eric Evans ).

class BaseDeDonnees

 #Initialise un depot de donnees.
 #
 # @param [String] depot nom du fichiet pour le depot
 # @param [Bool] detruire si le fichier existe deja, on le detruit  si detruire = true, sinon erreur
 #
 # @ensure (le fichier n'existe pas || detruire) => le fichier existe et est vide
 #

  def self.init( depot, detruire)
    if File.exist? depot
     if detruire
      FileUtils.rm_f depot # on detruit le depot existant si --detruire est specifie.
     else
      fail "le fichier '#{depot}' existe.
	    si vous voulez le detruire, utilisez 'init --detruire'."
     end
    end
   FileUtils.touch depot
  end

#charger en memoire le contenu d'un depot.
#
# @param [String] depot nom du fichier
#
#  @ensure si le fichier existe et est du bon format, alors la 
#  collection des cours est chargee en memoire
#
#
  def self.charger( depot )
     fail "Le fichier '#{depot}' n'existe pas" unless File.exist? depot
  
  @depot = depot

  @les_pieces = IO
   .readlines( depot )
   .map { |ligne| GP::PiecesTexte.creer_pieces(ligne)}

  end

# sauve sur disque, dans le depot indique lors du chargement, la
# collection de cours presentement en memoire.
#
#  @ensure un fichier existe avec la collection de cours et une
# 
# copie de sauvegarde du fichier a ete faite. chargee en memoire
#
  def self.sauver

   FileUtils.cp @depot, "#{@depot}.bak" #copie de sauvegarde.

   File.open( @depot, "w" ) do |fich|
    @les_pieces.each do |p|
      GP::PiecesTexte.sauver_pieces(fich, p)
    end
   end
  end

# Ajoute une piece dans la collection des pieces.
#
#  @param [Symbole] noSerie
#  @param [String] type
#  @param [String] description
#
#  @ensure Une piece a ete cree et ajoutee dans le depot si les
#  diveres conditions decrites dans Piece.new etaient satisfaites
#
  def self.deposer( noSerie, type, description)
   @les_pieces << Piece.new( noSerie, type, description)
  end

# Retirer une piece de la collection des pieces.
#
#  @param [Piece] piece
#
#  @ensure la piece n'est plus presente dans le depot
#
  def self.retirer( piece )
   retire = @les_pieces.delete piece
 
   DBC.assert retire, "Dans retirer: la piece #{piece} n'existait pas"
  end


# retourne la liste des pieces de la collection.
#
#  @return [array<pieces>]
#  
  def self.les_pieces
   @les_pieces
  end

# retourne la piece avec le numero de serie indique
#
#  @param [String] noSerie
#
#  @return [Piece]
#
  def self.( noSerie )
    piece = @les_pieces.select {  |p| /^#{noSerie}$/ =~ p.noSerie }

  fail "plusieurs pieces avec le meme numero de serie #{noSerie.inspect}" if piece.size > 1

  piece.first

  end

 end
end 

