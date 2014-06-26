require "sinatra/base"


class MyApp < Sinatra::Application




  def initialize
    super
    @items = ["Channa Masala", "Chicken Tikka Masala", "Saag Paneer"]

  end

  get "/" do
      "<h1>Hello, Welcome to my restaurant!</h1>"
      "<a href='/items'>Go to items page</a>"

      erb :index, :locals => {:items => @items}
  end

  get "/items/:identifier" do
    item = params[:identifier]
    erb :items, :locals => {:item => item}
  end

  get "/items/?" do
    filter = params[:filter]
    @filtered_items = @items

    @filtered_items = @items.select {|x|x.include?(filter)} unless filter == nil


    "<a href='/items/new'>New Items>"

    erb :items
  end







end






