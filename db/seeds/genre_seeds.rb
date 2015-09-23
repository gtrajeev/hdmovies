genres = %(
Action
Adventure
Animation
Comedy
Family
Drama
Horror
Musical
Romance
Sport
War
Biography
Crime
Fantasy
History
Mystery
Sci-Fi
Thriller
).split(/\n/).select(&:present?).map(&:strip)

genres.each do | genre|
  e = Genre.where(title: genre).first_or_create
  puts "Genre ---> #{e.inspect}"
end
