require "sinatra"
# require 'activesupport'
require 'sqlite3'
# DATABASE = SQLite3::Database.new("warehouse.db")
require_relative "2015-02-05-warehouse/category"
require_relative "2015-02-05-warehouse/db_setup"
require_relative "2015-02-05-warehouse/location"
require_relative "2015-02-05-warehouse/product"


# require_relative "module"
# include 'WarehouseHelper'



get "/" do
  erb :homepage, :layout => :boilerplate
end

get "/add_product" do
  erb :add_product, :layout => :boilerplate
end

get "/add_product_confirm" do
  
  erb :add_product_confirm, :layout => :boilerplate
end

get "/edit_product" do
  erb :edit_product, :layout => :boilerplate
end

get "/delete_product" do
  erb :delete_product, :layout => :boilerplate
end

get "/show_product" do
  erb :show_product, :layout => :boilerplate
end

get "/add_genre" do
  erb :add_genre, :layout => :boilerplate
end

get "/delete_genre" do
  erb :delete_genre, :layout => :boilerplate
end

get "/add_location" do
  erb :add_location, :layout => :boilerplate
end

get "/delete_location" do
  erb :delete_location, :layout => :boilerplate
end

get "/confirmation" do
  erb :confirmation, :layout => :boilerplate
  @title = params[:title]
end





#
# get "/result" do
#   @result = (params[:amount].to_f.round(2) / params[:gallons].to_f.round(2))
#
#   erb :result, :layout => :boilerplate
# end