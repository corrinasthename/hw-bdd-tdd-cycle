Feature: search for movies by director
 
  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter
 
Background: movies in database
 
  Given the following movies exist:
  | title                   | rating | director     | release_date  |
  | Star Wars               | PG     | George Lucas |   1977-05-25  |
  | Blade Runner            | PG     | Ridley Scott |   1982-06-25  |
  | Alien                   | R      |              |   1979-05-25  |
  | THX-1138                | R      | George Lucas |   1971-03-11  |
  | Aladdin                 | G      |              |  25-Nov-1992  |
  | The Terminator          | R      |              |  26-Oct-1984  |
  | When Harry Met Sally    | R      |              |  21-Jul-1989  |
  | The Help                | PG-13  |              |  10-Aug-2011  |
  | Chocolat                | PG-13  |              |  5-Jan-2001   |
  | Amelie                  | R      |              |  25-Apr-2001  |
  | 2001: A Space Odyssey   | G      |              |  6-Apr-1968   |
  | The Incredibles         | PG     |              |  5-Nov-2004   |
  | Raiders of the Lost Ark | PG     |              |  12-Jun-1981  |
  | Chicken Run             | G      |              |  21-Jun-2000  |

Scenario: add director to existing movie
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Ridley Scott"
 
Scenario: find movie with same director
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"
 
Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Alien"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should either be on the home page or the RottenPotatoes home page
  And   I should see "Alien" has no director info
  
Scenario: movie with unique director
  Given I am on the details page for "Blade Runner"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Blade Runner"
  Then  I should see "Ridley Scott"
  And   I should not see "George Lucas"

Scenario: delete a movie
  Given I am on the details page for "Blade Runner"
  And I press "Delete" 
  Then I should see "Movie 'Blade Runner' deleted"
  Then I press "Refresh"
  Then I should not see "Blade Runner"
  
Scenario: restrict to movies with 'PG' or 'R' ratings
  # enter step(s) to check the 'PG' and 'R' checkboxes
  Given I am on the RottenPotatoes home page
  When I check the following ratings: PG,R

  # enter step(s) to uncheck all other checkboxes
  When I uncheck the following ratings: G,PG-13,NC-17

  # enter step to "submit" the search form on the homepage
  And I press "Refresh"

  # enter step(s) to ensure that PG and R movies are visible
  Then I should see "The Incredibles"
  And I should see "Raiders of the Lost Ark"
  And I should see "The Terminator"
  And I should see "When Harry Met Sally"
  And I should see "Amelie"

  # enter step(s) to ensure that other movies are not visible
  Then I should not see "Aladdin"
  And I should not see "The Help"
  And I should not see "Chocolat"
  And I should not see "2001: A Space Odyssey"
  And I should not see "Chicken Run"

Scenario: all ratings selected
  # see assignment
  Given I am on the RottenPotatoes home page
  Then I should see all the movies
  

Scenario: sort movies alphabetically
  Given I am on the RottenPotatoes home page
  When I follow "Movie Title"
  Then I should see "2001: A Space Odyssey" before "Aladdin"
  And I should see "Chicken Run" before "The Terminator"
  And I should see "Raiders of the Lost Ark" before "The Help"
  # your steps here

Scenario: sort movies in increasing order of release date
  Given I am on the RottenPotatoes home page
  When I follow "Release Date"
  # your steps here
  Then I should see "2001: A Space Odyssey" before "The Terminator"
  And I should see "Chicken Run" before "Amelie"
  And I should see "When Harry Met Sally" before "Aladdin"