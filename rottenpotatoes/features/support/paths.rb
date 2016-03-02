# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    # when /^the home\s?page$/
    #   puts 'IM HERE'
    #   '/'
    when /^the home page$/
      '/movies'
      # root_path
      # redirect_to '/movies'
      
    when /^the RottenPotatoes home page$/
      '/movies'

    # when (/^the edit page for (.*)$/) do |title|
      # movie = $1.split(/\s+/)
      # puts movie[0] == "Alien"
      # puts Movie.find_by(:title=>'Alien').id
      # "/movies/#{Movie.find_by_title(title).id}"

    # when(/^the edit page for (.*)$/) do |title|
    #   edit_movie_path(Movie.find_by_title(title).id)
    # end
    

    
    when /^the edit page for (.*)$/
      # puts $1
      # puts Movie.find_by_title("Alien").id
      title = $1[1, $1.length-2]
      # Movie.find_by('title'=>title).id
      edit_movie_path(Movie.find_by_title(title).id)

  
    when /^the show page for (.*)$/
      # puts $1
      title = $1[1, $1.length-2]
      # puts title
      # Movie.find_by('title'=>title).id
      movie_path(Movie.find_by_title(title).id)
      
    when /^the details page for (.*)$/
      # puts $1
      title = $1[1, $1.length-2]
      # puts title
      # Movie.find_by('title'=>title).id
      movie_path(Movie.find_by_title(title).id)
      
    when /^the details page for (.*)$/
      # puts $1
      title = $1[1, $1.length-2]
      # puts title
      # Movie.find_by('title'=>title).id
      movie_path(Movie.find_by_title(title).id)
      
    when /^the Similar Movies page for (.*)$/
      m1 = $1[1, $1.length-2]
      # puts movie
      # puts "#{movie}"
      search_director_path(Movie.find_by_title(m1).id)
      
    when /^the RottenPotatoes home page$/
      
  

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        # $2 ? path_components = [$1, $2.split(/\s+/)[1]] : path_components = [$1]
        # path_components[0] = path_components[0].split(/\s+/)
        # if $2 != nil
          # path_components.add($2.split(/\s+/)[1])
        # end
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
