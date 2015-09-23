languages = %(
English
Hindi
Malayalam
Tamil
Telugu
Various
).split(/\n/).select(&:present?).map(&:strip)

languages.each do |language|
  e = Language.where(title: language).first_or_create
  puts "Language ---> #{e.inspect}"
end
