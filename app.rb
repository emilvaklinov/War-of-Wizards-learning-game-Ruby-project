require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/wizards_controller')
require_relative('controllers/codeclanners_controller')
require_relative('controllers/attacks_controller')
# also_reload('./models/*')

get '/' do
  erb( :index )
end
