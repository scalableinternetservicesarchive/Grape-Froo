# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
begin
user = User.create!(:email => 'test@example.com', :username => 'test', :password =>
            'password', :password_confirmation => 'password', :id => 1)
t1 = Template.create!("name"=>"confession bear", "image" => URI.escape("http://i.imgur.com/uGNb9El.jpg"), :user => user, :id => 1)
Template.create!("name" => "how about no", "image" => URI.escape("http://i.imgur.com/VLlma7X.jpg"), :user => user, :id => 2)
Template.create!("name" => "unpopular opinion", "image" => URI.escape("http://i.imgur.com/F1SkTlb.jpg"), :user => user, :id => 3)
Template.create!("name" => "facepalm picard", "image" => URI.escape("http://i.imgur.com/ST9hCiw.jpg"), :user => user, :id => 4)
Template.create!("name" => "scumbag steve", "image" => URI.escape("http://i.imgur.com/b9IWEug.jpg"), :user => user, :id => 5)
Template.create!("name" => "one does not simply", "image" => URI.escape("http://i.imgur.com/iVMRSqL.jpg"), :user => user, :id => 6)
Template.create!("name" => "aliens", "image" => URI.escape("http://i.imgur.com/7TSUOHb.jpg"), :user => user, :id => 7)
Template.create!("name" => "first world problems", "image" => URI.escape("http://i.imgur.com/nhl48TV.jpg"), :user => user, :id => 8)
Template.create!("name" => "classy", "image" => URI.escape("https://media.giphy.com/media/HDYjeDYrZBU5y/giphy.gif"), :user => user, :id => 9)
Template.create!("name" => "who does that", "image" => URI.escape("https://media.giphy.com/media/3oriO7RNRqh47AempG/source.gif"), :user => user, :id => 10)
250.times do |i|
	m = Meme.new("top_caption" => "test1", "bottom_caption" => "test2", :template => t1, :user => user, :id => i)
	m.image = Memeutil.memeify(t1.image.url, m.top_caption, m.bottom_caption)
	m.save
end
rescue Exception
	puts "Seeds aborted due to duplicate"
end