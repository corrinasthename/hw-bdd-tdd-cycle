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


Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  first_index = page.body.index(e1)
  second_index = page.body.index(e2)
  if !(first_index < second_index)
    fail "Wrong order"
  end
  # fail "Unimplemented"
end


# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  ratings = rating_list.split(',')
  if !(uncheck == "un")
    ratings.each do |rating|
      check("ratings[#{rating}]")
    end
  else
    ratings.each do |rating|
      uncheck("ratings[#{rating}]")
    end
  end
  # fail "Unimplemented"
end


Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  count = Movie.count
  # num_movies = 0
  all_movies = Movie.all
  all_movies.each do |movie|
    steps %Q{
      Then I should see "#{movie[:title]}"
    }
  end
  # if !(count.should == 10)
  #   fail "Not all movies shown."
  # end
  # fail "Unimplemented"
end

Then /I should see (.*) has no director info/ do |title|
  steps %Q{
    Then the director of #{title} should be ""
  }
end