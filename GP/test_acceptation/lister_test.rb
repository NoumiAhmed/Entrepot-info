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

    
end
end