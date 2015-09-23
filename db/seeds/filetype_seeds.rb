filetypes = %(
AVI
MP4
MPG
DAT
VOB
MKV
FLV
WMV
RMVB
Various
).split(/\n/).select(&:present?).map(&:strip)

filetypes.each do |filetype|
  e = Filetype.where(title: filetype).first_or_create
  puts "Filetype ---> #{e.inspect}"
end
