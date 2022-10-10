require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'
require 'yaml'


# When a user loads the home page, they should be redirected to a page that lists all of the users' names. Load the users from the users.yaml file (content below).
# Each of the users' names should be a link to a page for that user.
# On each user's page, display their email address. Also display their interests, with a comma appearing between each interest.
# At the bottom of each user's page, list links to all of the other users pages. Do not include the user whose page it is in this list.
# Add a layout to the application. At the bottom of every page, display a message like this: "There are 3 users with a total of 9 interests."
# Update the message printed out in #5 to determine the number of users and interests based on the content of the YAML file. Use a helper method, count_interests, to determine the total number of interests across all users.
# Add a new user to the users.yaml file. Verify that the site updates accordingly.

before do
  @working_file = YAML.load_file("./data/users.yaml")
end

helpers do
end

get "/" do
  erb :home
end