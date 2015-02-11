require 'sinatra'
require 'sqlite3'
require_relative "2015-02-05-warehouse/category"
require_relative "2015-02-05-warehouse/db_setup"
require_relative "2015-02-05-warehouse/location"
require_relative "2015-02-05-warehouse/product"

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

get "/show_product_confirm" do
  erb :show_product_confirm, :layout => :boilerplate
end

get "/add_genre" do
  erb :add_genre, :layout => :boilerplate
end

get "/add_genre_confirm" do
  erb :add_genre_confirm, :layout => :boilerplate
end

get "/delete_genre" do
  erb :delete_genre, :layout => :boilerplate
end

get "/delete_genre_confirm" do
  Category.delete(params["id"])
  erb :delete_genre_confirm, :layout => :boilerplate
end

get "/add_location" do
  erb :add_location, :layout => :boilerplate
end

get "/add_location_confirm" do
  erb :add_location_confirm, :layout => :boilerplate
end

get "/delete_location" do
  erb :delete_location, :layout => :boilerplate
end

get "/delete_location_confirm" do
  Location.delete(params["id"])
  erb :delete_location_confirm, :layout => :boilerplate
end

#
# get "/result" do
#   @result = (params[:amount].to_f.round(2) / params[:gallons].to_f.round(2))
#
#   erb :result, :layout => :boilerplate
# end