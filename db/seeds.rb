# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "#{Rails.root}/db/seeds/language_seeds.rb"
require "#{Rails.root}/db/seeds/category_seeds.rb"
require "#{Rails.root}/db/seeds/filetype_seeds.rb"
require "#{Rails.root}/db/seeds/genre_seeds.rb"
require "#{Rails.root}/db/seeds/rating_seeds.rb"
