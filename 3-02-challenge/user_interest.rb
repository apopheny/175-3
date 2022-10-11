require 'tilt/erubis'
require 'sinatra'
require 'sinatra/reloader'
require 'yaml'

before do
  @working_file = YAML.load_file("./data/users.yaml")
end

helpers do
  def count_interests
    @interest_count = 0
    @working_file.each do |name, data|
      @interest_count += data[:interests].size
    end
    @interest_count
  end
end

get "/" do
  erb :home
end

get "/:name" do
  @name = params[:name]
  @user_data = @working_file[@name.to_sym]
  
  erb :user
end