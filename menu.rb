require 'pry'
require 'sinatra'
require 'sqlite3'
DATABASE = SQLite3::Database.new("database/warehouse.db")
require_relative "models/category"
require_relative "models/db_setup"
require_relative "models/location"
require_relative "models/product"
DATABASE.results_as_hash = true

get "/" do
  erb :homepage, :layout => :boilerplate
end

get "/add_product" do
  erb :add_product, :layout => :boilerplate
end

get "/add_product_confirm" do
  x = Product.new(params)
  x.insert
  erb :add_product_confirm, :layout => :boilerplate
end

get "/edit_product" do
  erb :edit_product, :layout => :boilerplate
end

get "/edit_product_confirm" do
  erb :add_product_confirm, :layout => :boilerplate
end

get "/delete_product" do
  erb :delete_product, :layout => :boilerplate
end

get "/delete_product_confirm" do
  Product.delete(params["title"])
  erb :delete_product_confirm, :layout => :boilerplate
end

get "/show_product" do
  erb :show_product, :layout => :boilerplate
end

get "/add_genre" do
  erb :add_genre, :layout => :boilerplate
end

get "/add_genre_confirm" do
  @x = Category.new(params)
  @x.insert
  erb :add_genre_confirm, :layout => :boilerplate
end

get "/delete_genre" do
  erb :delete_genre, :layout => :boilerplate
end

get "/delete_genre_confirm" do
  x = DATABASE.execute("DELETE FROM categories WHERE id = 'params[:id]'")
  erb :delete_genre_confirm, :layout => :boilerplate
end

get "/show_genre" do
  erb :show_genre, :layout => :boilerplate
end

get "/add_location" do
  erb :add_location, :layout => :boilerplate
end

get "/add_location_confirm" do
  @x = Location.new(params)
  @x.insert
  erb :add_location_confirm, :layout => :boilerplate
end

get "/delete_location" do
  erb :delete_location, :layout => :boilerplate
end

get "/delete_location_confirm" do
  x = DATABASE.execute("DELETE FROM locations WHERE id = 'params[:id]'")
  erb :delete_location_confirm, :layout => :boilerplate
end

get "/show_location" do
  erb :show_location, :layout => :boilerplate
end
