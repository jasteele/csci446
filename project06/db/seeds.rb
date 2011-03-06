#delete all the previous stuff just in case...
User.delete_all
Role.delete_all
Game.delete_all
#create the two roles for this app
Role.create(:name => "admin")
Role.create(:name => "member")
#create the two default admin and member users
User.create(:username => "administrator", 
			:password => "password", 
			:password_confirmation => "password", 
			:email => "admin@gamez.com", 
			:role_id => 1,
			:fname => "Admini",
			:lname => "Strator")
User.create(:username => "member", 
			:password => "password", 
			:password_confirmation => "password", 
			:email => "member@gmail.com", 
			:role_id => 2,
			:fname => "Mem",
			:lname => "Ber")
#create some test games to help test the app on
Game.create(:title => "Awesome game of Awesome", :rating => "lame", :user_id => 1)
Game.create(:title => "COD", :rating => "amazing", :user_id => 2)