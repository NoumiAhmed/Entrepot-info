module GP

	class Piece
	
		attr_reader :type, :description, :noSerie
		def initialize(noSerie, type, description)
			DBC.require( noSerie.kind_of?(Symbol) )
			@type = type
			@description = description
			@noSerie = noSerie
		end

		def to_s()
			return format("%s Info: \"%s\"   Type : %s", 
							noSerie,
							description,
							type)
		end


	end
end
