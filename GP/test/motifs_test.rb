
require 'test_helper'
require 'GP'
module GP

	describe Motifs::NOSERIE do
      it "matche un numero de serie simple" do
        "12345".must_match Motifs::NOSERIE
      end
  end

end