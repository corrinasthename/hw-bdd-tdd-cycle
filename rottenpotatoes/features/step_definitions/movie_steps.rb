Given (/the following movies exist/) do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    m = Movie.new
    m.title = movie[:title]
    m.rating = movie[:rating]
    m.description = movie[:description]
    m.release_date = movie[:release_date]
    m.director = movie[:director]
    m.save
    # puts m.title
    # Movie.create(:title => movie[:title], :rating => movie[:rating], :description => movie[:description], :release_date => movie[:release_date], :director => movie[:director])
  end
end


Then /^the director of (.*) should be (.*)/ do |movie, director|
  steps %Q{
    When I go to the show page for "#{movie[1, movie.length-2]}"
    Then I should see "#{director[1, director.length-2]}"
  }
end