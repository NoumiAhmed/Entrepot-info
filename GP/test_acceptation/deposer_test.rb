require 'test_helper'

describe GP do
  let(:bd)  { '.depot.txt' }
  let(:separateur)  { GP::PiecesTexte::SEPARATEUR }
  

  describe "ajouter" do
    it "ajoute dans un fichier vide" do
      nouveau_contenu = avec_fichier bd, [], :conserver do
        execute_sans_sortie_ou_erreur do
          gp( 'deposer A00001 CPU "INTEL"' )
        end
      end

      nouveau_contenu.size.must_equal 1
      nouveau_contenu.first.must_equal [:A00001, 'CPU', "INTEL" ].join(separateur)
      FileUtils.rm_f bd
    end
  end
end