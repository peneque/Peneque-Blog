# base de datos:

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Post
	include DataMapper::Resource
	
	property :id, Serial
	property :title, String, :required => true
	property :body, Text, :required => true
	property :created_at, DateTime
	property :updated_at, DateTime
	
	has n, :comments
end

class Comment
	include DataMapper::Resource
	
	property :id, Serial
	property :name, String
	property :comment, Text
	property :created_at, DateTime
	
	belongs_to :post
end

DataMapper.finalize