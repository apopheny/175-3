require 'tilt/erubis'
require "sinatra"
require "sinatra/reloader"

before do
  @contents = File.readlines './data/toc.txt'
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map do |pgph|
      "<p>#{pgph}</p>"
    end.join
  end
end

not_found do
  redirect("/")
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i

  redirect "/" unless (1..@contents.size).include?(number)
  @chapter = File.read("./data/chp#{number}.txt")
  @title = "Chapter #{number}: #{@contents[number - 1]}"
  
  erb :chapter
end

get "/search" do
  @text_query = params[:query]

  @search_results = (1..@contents.size).select do |chap_num|
    File.read("./data/chp#{chap_num}.txt").include?(@text_query) if @text_query
  end
  
  erb(:search)
end