get '/' do

  erb :index
end

get '/gallery' do
  @moments
  erb :gallery
end

post '/gallery' do # this probably wont be a post with ajax
  moments = check_primaries(params[:tag_search])
  persist(moments)
  redirect '/gallery'
end

get '/next_moment' do

end
