require 'pry'
require 'sinatra'
require 'sqlite3'
DATABASE = SQLite3::Database.new("database/warehouse.db")
require_relative "module.rb"
require_relative "models/db_setup"
require_relative "models/category"
require_relative "models/location"
require_relative "models/product"

DATABASE.results_as_hash = true

get "/" do
  erb :homepage
end

get "/add_product" do
  erb :add_product
end

get "/add_product_confirm" do
  x = Product.new(params)
  x.insert
  erb :add_product_confirm
end

get "/edit_product" do
  erb :edit_product
end

get "/edit_product_form" do
  @form_values = Product.where_title_is(params[:title])
  erb :edit_product_form
end

get "/edit_product_confirm" do
  x = Product.new(params)
  x.save(params)
  erb :edit_product_confirm
end

get "/delete_product" do
  erb :delete_product
end

get "/delete_product_confirm" do
  Product.delete(params["title"])
  erb :delete_product_confirm
end

get "/show_product" do
  erb :show_product
end

get "/add_genre" do
  erb :add_genre
end

get "/add_genre_confirm" do
  @x = Category.new(params)
  @x.insert
  erb :add_genre_confirm
end

get "/delete_genre" do
  @results_as_objects = Category.all
  erb :delete_genre
end

before "/delete_genre_confirm" do
  @products = Product.where_category_id_is(params[:id].to_i)
  if @products != []
    request.path_info = "/error"
  end
end

get "/delete_genre_confirm" do
  @id = params[:id]
  Category.delete(params[:id])
  erb :delete_genre_confirm
end

get "/show_genre" do
  @results_as_objects = Category.all
  @products = Product.all 
  erb :show_genre
end

get "/add_location" do
  erb :add_location
end

get "/add_location_confirm" do
  @x = Location.new(params)
  @x.insert
  erb :add_location_confirm
end

get "/delete_location" do
  @results_as_objects = Location.all
  erb :delete_location
end

before "/delete_location_confirm" do
  @products = Product.where_location_id_is(params[:id].to_i)
  if @products != []
    request.path_info = "/error"
  end
end

get "/delete_location_confirm" do
  Location.delete(params[:id])
  erb :delete_location_confirm
end

get "/show_location" do
  @results_as_objects = Location.all
  @products = Product.all 
  erb :show_location
end

get "/error" do
erb :error
end
