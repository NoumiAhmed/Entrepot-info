module GestionDepot

	class Pieces
	
		attr_reader :type, :description, :noSerie
		def initialize(type, description, noSerie)
			@type = type
			@description = description
			@noSerie = noSerie
		end

		def to_s()
			return format("%s \"%-7s\" Type : %s", 
							noSerie,
							description,
							type)
		end


	end
end