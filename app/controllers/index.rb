get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/gallery' do
  erb :gallery
end

post '/gallery' do # this probably wont be a post with ajax
  # search for moments
  redirect '/galerry'
end