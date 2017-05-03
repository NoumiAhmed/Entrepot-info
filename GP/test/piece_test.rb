require 'test_helper'
require 'GP'

module GP
  describe Piece do
    let(:erreurs_possibles) { [ArgumentError, RuntimeError, StandardError] }
    let (:noSerie) {:A00001}
    let(:cpu) { Piece.new( noSerie, "CPU", "INTEL I7" ) }
    
    describe ".new" do
      it "cree une piece" do
        cpu.noSerie.must_equal :A00001
        cpu.type.must_equal 'CPU'
        cpu.description.must_equal 'INTEL I7'
      end

       describe "#to_s " do
      it "sorite normale de to_s" do
        cpu.to_s.must_equal 'A00001 Info: "INTEL I7"   Type : CPU'
      end
    end
      
    end
  end
end