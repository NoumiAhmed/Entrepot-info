require_relative 'test_helper'

describe GP do

	describe "lister" do

	it "liste un fichier vide" do
      avec_fichier '.depot.txt'do
        execute_sans_sortie_ou_erreur do
          gp( 'lister' )
        end
      end
    end

    it "liste tout les pieces" do
      lignes = IO.readlines("#{REPERTOIRE_TESTS}/piece.txt.2")
      attendu = ['A00001 Info: "INTEL I7"   Type : CPU',
                 'A00002 Info: "DDR4 4GB"   Type : RAM'
                ]

      avec_fichier '.depot.txt', lignes do
        genere_sortie( attendu ) do
          gp( 'lister' )
        end
      end
    end
end
end