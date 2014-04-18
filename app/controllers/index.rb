get '/' do
  erb :index
end

get '/gallery' do # this probably wont be a post with ajax
  @moments = check_primaries(params[:tag_search])
  erb :gallery
end

