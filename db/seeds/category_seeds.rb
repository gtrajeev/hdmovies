categories = %(
Feature Film
Short Film
Documentary
TV Series
TV Show
Cartoon
).split(/\n/).select(&:present?).map(&:strip)

categories.each do |category|
  e = Category.where(title: category).first_or_create
  puts "Category ---> #{e.inspect}"
end
