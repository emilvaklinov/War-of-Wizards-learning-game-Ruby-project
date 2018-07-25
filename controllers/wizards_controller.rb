require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/wizard.rb')
require_relative('../models/biography.rb')
get '/wizards' do
  @wizards = Wizard.all()
  erb (:"wizards/index")
end

get '/wizards/:id' do
  @wizard = Wizard.find(params['id'].to_i)
  erb( :"wizards/new" )
end
