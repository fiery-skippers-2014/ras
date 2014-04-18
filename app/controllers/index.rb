get '/' do
  erb :index
end

get '/gallery' do # this probably wont be a post with ajax
  session[:tag] = params[:tag_search]
  @moments = check_primaries(params[:tag_search]).shuffle
  erb :gallery
end

get '/moments' do
  @moments = check_primaries(session[:tag]).shuffle
  erb :_moments, layout: false
end
