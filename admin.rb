# panel de administración:

get '/admin/blog_create' do
	erb :'admin/blog_create', :layout => :'admin/layout'
end


post '/admin/blog_create' do
	post = Post.new
	post.attributes = {
		:title => params[:title],
		:body => params[:body],
		:created_at => Time.now,
		:updated_at => Time.now
	}
	post.save
	
	redirect '/'
end