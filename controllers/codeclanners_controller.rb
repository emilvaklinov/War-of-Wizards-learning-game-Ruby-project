require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/codeclanner.rb')


get '/codeclanners' do
  @codeclanners = Codeclanner.all()
  erb (:"codeclanners/index")
end

get '/codeclanners/:id' do
  @codeclanner = Codeclanner.find(params['id'].to_i)
  erb( :"codeclanners/new" )
end

# create
post '/codeclanners' do
    @codeclanner = Codeclanner.new(params)
    @codeclanner.save
    erb (:create)
end
