require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/attack.rb')
require_relative('../models/codeclanner.rb')
require_relative('../models/wizard.rb')
require_relative('../models/action.rb')

get '/attacks' do
  @attacks = Attack.all
  @actions = Action.all
  erb ( :"attacks/index" )
end

get '/attacks/new' do
  @attacks = Attack.all
  @wizards = Wizard.all
  erb (:"attacks/new")
end

post '/attacks' do
  attack = Attack.new(params)
  attack.save
  redirect to ("/attacks")
end

# post '/attacks/:id/:delete' do
#   Attack.destroy(params[:id])
#   redirect to ("/attacks")
# end

post '/attacks/:id/delete' do
    attack = Attack.find(params['id'])
    attack.delete()
    redirect to '/attacks'
end
