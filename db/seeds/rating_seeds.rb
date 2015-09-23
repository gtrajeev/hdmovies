ratings = []
ratings << {title:"Awkward", star:0.5}
ratings << {title:"Poor", star:1}
ratings << {title:"Below Average", star:1.5}
ratings << {title:"Average", star:2}
ratings << {title:"Above Average", star:2.5}
ratings << {title:"Good", star:3}
ratings << {title:"very Good", star:3.5}
ratings << {title:"Excellent", star:4}
ratings << {title:"Must Watch", star:4.5}
ratings << {title:"Exceptional", star:5}

Rating.transaction do
  ratings.each do |rating|
    r = Rating.where(title: rating[:title]).first_or_create(star: rating[:star])
    puts "Rating: #{r.inspect}"
  end
end
