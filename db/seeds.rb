# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(:email => 'test@example.com', :username => 'test', :password =>
            'password', :password_confirmation => 'password')
Template.create("name"=>"confession bear", "url"=>"http://i.imgur.com/uGNb9El.jpg")
Template.create("name"=>"how about no", "url"=>"http://i.imgur.com/VLlma7X.jpg")
Template.create("name"=>"unpopular opinion", "url"=>"http://i.imgur.com/F1SkTlb.jpg")
Template.create("name"=>"facepalm picard", "url"=>"http://i.imgur.com/ST9hCiw.jpg")
Template.create("name"=>"scumbag steve", "url"=>"http://i.imgur.com/b9IWEug.jpg")
Template.create("name"=>"one does not simply", "url"=>"http://i.imgur.com/iVMRSqL.jpg")
Template.create("name"=>"aliens", "url"=>"http://i.imgur.com/7TSUOHb.jpg")
Template.create("name"=>"first world problems", "url"=>"http://i.imgur.com/nhl48TV.jpg")
Template.create("name"=>"classy", "url"=>"https://media.giphy.com/media/HDYjeDYrZBU5y/giphy.gif")
Template.create("name"=>"who does that", "url"=>"https://media.giphy.com/media/3oriO7RNRqh47AempG/source.gif")
Template.create("name"=>"scumbag steve", "url"=>"http://i.imgur.com/b9IWEug.jpg")
