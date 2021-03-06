# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new
user.email = 'admin@admin.com'
user.password = 'admin1234'
user.password_confirmation = 'admin1234'
user.nick = 'Admin'
user.isAdmin = true
user.isBanned = false
user.save!

user = User.new
user.email = 'test@test.pl'
user.password = 'admin1234'
user.password_confirmation = 'admin1234'
user.nick = 'Adam'
user.isAdmin = false
user.isBanned = false
user.save!
user = User.new
user.email = 'test2@test.pl'
user.password = 'admin1234'
user.password_confirmation = 'admin1234'
user.nick = 'Marek'
user.isAdmin = false
user.isBanned = false
user.save!
user = User.new
user.email = 'test3@test.com'
user.password = 'admin1234'
user.password_confirmation = 'admin1234'
user.nick = 'Jan'
user.isAdmin = true
user.isBanned = false
user.save!
user = User.new
user.email = 'nimda@nimda.com'
user.password = 'admin1234'
user.password_confirmation = 'admin1234'
user.nick = 'Jackie'
user.isAdmin = false
user.isBanned = false
user.save!
