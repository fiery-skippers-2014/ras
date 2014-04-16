get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/gallery' do
  @moments = flash[:moments]
  erb :gallery
end

post '/gallery' do # this probably wont be a post with ajax
  tag = Tag.find_by_title(params[:tag_search])
  moments = tag.photos.map {|photo| photo.url}
  flash[:moments] = moments
  redirect '/gallery'
end

get '/next_moment' do

end
