require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

get "/" do
  @dir = Dir.glob("public/*").map do |name|
    name.gsub(/^public\//, '')
  end.sort

  @dir.reverse! if params[:sort] == "desc"
  erb :home
end