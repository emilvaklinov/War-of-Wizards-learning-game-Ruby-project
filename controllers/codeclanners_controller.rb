require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative('../models/codeclanner.rb')


get '/codeclanners' do
  @codeclanners = Codeclanner.all()
  erb (:"codeclanners/index")
end

# Add new
get '/codeclanners/new' do
  @codeclanners = Codeclanner.all
  erb (:"codeclanners/new")
end

get '/codeclanners/about' do
  @codeclanners = Codeclanner.all
  erb (:"codeclanners/about")
end

get '/testimonials/testimonials' do
  @codeclanners = Codeclanner.all
  erb (:"testimonials/testimonials")
end

get '/codeclanners/:id' do
  @codeclanner = Codeclanner.find(params['id'].to_i)
  erb( :"codeclanners/show" )
end

# create
post '/codeclanners' do
    @codeclanner = Codeclanner.new(params)
    @codeclanner.save
    # erb (:"codeclanners/new")
    redirect to '/codeclanners'
end

# Edit
get '/codeclanners/:id/edit' do
  # @codeclanner = Codeclanner.all()
  @codeclanner = Codeclanner.find(params['id'].to_i)
  erb(:"codeclanners/edit")
end


# Update
post '/codeclanners/:id' do
  codeclanner = Codeclanner.new(params)
  codeclanner.update()
  redirect to '/codeclanners/' + params['id']

end


# Delete
post '/codeclanners/:id/delete' do
  codeclanner = Codeclanner.find(params['id'])
  codeclanner.delete()
  redirect to '/codeclanners'
end
