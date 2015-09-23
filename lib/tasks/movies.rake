require 'csv'
require 'pry'

namespace :movies do
  # rake movies:populate[file_name] --trace
  # name  filetype  language  release_year  category
  desc 'To populate DB from first excel sheet'
  task :populate, [:file_name] => [:environment] do |t, args|
    if args.file_name.blank?
      puts "Please specify a file to import"
    else
      ActiveRecord::Base.logger = Logger.new(STDOUT)
      csv_body = File.read("#{Rails.root}/data/#{args.file_name}").encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
      csv = CSV.new(csv_body, :headers => true, :header_converters => :symbol)
      fname_array = args.file_name.split('_')
      st_location = fname_array[0].upcase
      Movie.transaction do 
        csv.to_a.each_with_index do |c, i|
          attrs = c.to_hash
          if attrs[:name].present?
            ftype = attrs.delete(:filetype)
            if ftype.present?
              ft = Filetype.where("lower(title) = ?", ftype).first_or_create(:title=>ftype)
              attrs[:filetype_id] = ft.id
            end
            cat = attrs.delete(:category)
            if cat.present?
              category = Category.where("lower(title) = ?", cat).first_or_create(:title=>cat)
              
            else
              category = Category.where("lower(title) = ?", "feature film").first_or_create(:title=>"Feature Film")
            end
            attrs[:category_id] = category.id
            lan = attrs.delete(:language)
            if lan.present?
              language = Language.where("lower(title) = ?", lan).first_or_create(:title=>lan)
              attrs[:language_id] = language.id
            end
            attrs[:st_device] = st_location
            # binding.pry
            mv = Movie.create(attrs)
          end
        end
      end
    end
  end

  # rake movies:populate_st_device --trace 
  desc 'To populate storage device for movies'
  task populate_st_device: :environment do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    Movie.transaction do 
      Movie.find_each do |m|
        m.update_attribute(:st_device, 'HD1')
      end
    end
  end
end