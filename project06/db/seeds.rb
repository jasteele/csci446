# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
User.delete_all
Role.delete_all
Game.delete_all
admin = Role.create(:name => "admin")
member = Role.create(:name => "member")
User.create(:username => "administrator", :password => "password", :password_confirmation => "password", :email => "admin@gamez.com", :role_id => admin)
User.create(:username => "member", :password => "password", :password_confirmation => "password", :email => "member@gmail.com", :role_id => member)
Game.create(:title => "test", :rating => "lame", :user_id => 1)
Game.create(:title => "test2", :rating => "amazing", :user_id => 2)