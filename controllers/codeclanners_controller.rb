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

# update
# post '/students/:id' do
#     student = Student.new(params)
#     student.update()
#     redirect to '/students/' + params['id']
# end
