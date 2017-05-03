
require 'test_helper'
require 'GP'
module GP

	describe Motifs::NOSERIE do

      it "matche un numero de serie simple" do
        "A12345".must_match Motifs::NOSERIE
      end

      it "ne matche pas un no de serie" do
      	"212".wont_match Motifs::NOSERIE
      end

    describe Motifs::TYPE do

      it "matche type RAM" do
        "RAM".must_match Motifs::TYPE
      end
      it "matche type CPU" do
        "CPU".must_match Motifs::TYPE
      end
      it "matche type DISK" do
        "DISK".must_match Motifs::TYPE
      end
      it "ne matche pas un TYPE" do
      	"Souris".wont_match Motifs::TYPE
      end
    
  	  end
	end
end