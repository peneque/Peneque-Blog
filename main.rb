require 'sinatra'
require 'data_mapper'


require_relative 'settings'
require_relative 'models.rb'
require_relative 'admin'


# normal routes:

get '/' do
	@title = 'portada'
	@posts = Post.all :order => :created_at.desc
	
	erb :index
end


get '/blog/:id' do
	@post = Post.get params[:id]
	@title = @post.title
	
	@comments = Comment.all :order => :created_at.asc
	
	erb :blog_view
end


post '/blog/:id' do
	Post.get(params[:id]).comments.create(
		:name => params['name'],
		:comment => params['comment'],
		:created_at => Time.now
	)
	
	redirect "/blog/#{params[:id]}"
end