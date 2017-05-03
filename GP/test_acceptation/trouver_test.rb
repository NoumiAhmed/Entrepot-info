describe GP do
  describe "trouver" do
  	context "base de donnees avec plusieurs pieces" do
      let(:lignes) { IO.readlines("#{REPERTOIRE_TESTS}/piece.txt.2") }
      let(:attendu) { ['A00001 Info: "INTEL I7"   Type : CPU']}

       it "trouve une piece avec un numero de serie " do
        avec_fichier '.depot.txt', lignes do
          genere_sortie( attendu ) do
            gp( 'trouver A00001' )
          end
        end
      end
  end
 end
end