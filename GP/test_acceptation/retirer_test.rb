require 'test_helper'

describe GP do
  let(:bd)  { '.depot.txt' }

  describe "retirer" do
    

    context "base de donnees avec plusieurs pieces" do
      let(:lignes) { IO.readlines("#{REPERTOIRE_TESTS}/piece.txt.2") }
      let(:attendu) { ['A00001 Info: "INTEL I7"   Type : CPU',
                       'A00002 Info: "DDR4 4GB"   Type : RAM'
                      ]
      }

      

      it "supprime le cours lorsque le no de Serie existe" do
        nouveau_contenu = avec_fichier bd, lignes, :conserver do
          execute_sans_sortie_ou_erreur do
            gp( "retirer   A00001   " )
          end
        end

        nouveau_contenu.find { |l| l =~ /^A00001/ }.must_be_nil
        nouveau_contenu.size.must_equal 1
        FileUtils.rm_f bd
      end
    end
  end
end