require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'user_data_bits'
)

require './models/user'
require './models/chirp'

get '/' do
  erb :index
end

#Get all songs
get '/api/users' do
  content_type :json
  users = User.all
  users.to_json
end

#get a specific song
get '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.to_json
end

#Create a new user
post '/api/users' do
  content_type :json
  user = User.create(params[:user].to_i)
  user.to_json
end

#Update an existing user
put '/api/user/id' do
  content_type :json
  user = User.find(params[:id].to_i).update(params[:user])
  user.to_json
end

#Update an existing user
patch '/api/user/:id' do
  content_type :json
  user = User.find(params[:id].to_i).update(params[:user])
  user.to_json
end

#Delete a song
delete '/api/user/:id' do
  content_type :json
  User.delete(params[:id].to_i)
  {message: "The user has been deleted."}.to_json
end

# get \api\users\:user_id\chirps
# A specific user's chirps
get '/api/users/:user_id/chirps' do
  content_type :json
  chirps = Chirp.all(User.find(params[:user_id]).to_i)
  chirps.to_json
end

# get \api\users\:user_id\chirps\:id
# A specific user's specific chirp
get '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  chirp = Chirp.find(params[:id].to_i)
  chirp.to_json
end

# post \api\users\:user_id\chirps
# Create a Chirp for a user
post '/api/users/:user_id/chirps' do
  content_type :json
  chirp = Chirp.create(params[:user_id].to_i)
  chirp.to_json
end

# put \api\users\:user_id\chirps\:id
# Update a user's existing chirp
put '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  chirp = Chirp.update(params[:chirp].to_i)
  chirp.to_json
end
# patch \api\users\:user_id\chirps\:id
# Update a user's existing chirp
put '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  chirp = Chirp.update(params[:chirp].to_i)
  chirp.to_json
end
# delete \api\users\:user_id\chirps\:id
# Delete a user's existing chirp
delete '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  chirp = Chirp.delete(params[:id].to_i)
  {message: 'The chirp has been deleted.'}.to_json
end
