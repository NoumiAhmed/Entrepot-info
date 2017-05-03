gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'
require 'open3'

# Add test libraries you want to use here, e.g. mocha

class Object
	# Pour desactiver temporairement une suite de tests.
  def _describe( test )
    puts "--- On saute les tests pour \"#{test}\" ---"
  end

  # Pour desactiver temporairement un test.
  def _it( test )
    puts "--- On saute les tests pour \"#{test}\" ---"
  end

  

	# # Des alias pour style RSpec
  alias_method :context, :describe
  alias_method :_context, :_describe
  #Add global extensions to the test case class here
  
end
