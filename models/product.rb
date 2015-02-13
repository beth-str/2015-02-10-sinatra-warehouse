#---------------------------------------------------------
# Class: Product
# Products and all the things they can do
#
# Attributes:
# @isbn         - Integer:  the book's identifier
# @title        - String:   the book's title
# @author       - String:   the book's author
# @description  - String:   the book's description (book type)
# @cost         - Float:    the book's cost
# @price        - Float:    the book's sale price
# @quantity     - Integer:  number of copies in stock at a given warehouse
# @category_id  - Integer:  the book's genre (by number; cross-references categories table)
# @location_id  - Integer: the book's location (by number; cross-references locations table)
#
# Public Methods:
# #insert
# #save
# .all  
# .delete
#---------------------------------------------------------
class Product
  include WarehouseHelper
  extend WarehouseHelper
  
  attr_reader :id
  attr_accessor :isbn, :title, :author, :description, :cost, :price, :quantity, :category_id, :location_id

  def initialize(options)
    @id           = options["id"]
    @isbn         = options["isbn"]
    @title        = options["title"]
    @author       = options["author"]
    @description  = options["description"]
    @cost         = options["cost"]
    @price        = options["price"]
    @quantity     = options["quantity"]
    @category_id  = options["category_id"]
    @location_id  = options["location_id"]
  end

  #---------------------------------------------------------
  # Public: #insert
  # Inserts new instantiation to the database
  #
  # Parameter: None
  #
  # Returns: None
  #
  # State Changes: None
  #---------------------------------------------------------
  def insert
    DATABASE.execute("INSERT INTO products (isbn, title, author, description, cost, price, quantity, category_id, location_id) VALUES ('#{@isbn}', '#{@title}', '#{@author}', '#{@description}', '#{@cost}', '#{@price}', '#{@quantity}', '#{category_id}', '#{location_id}')")
    @id = DATABASE.last_insert_row_id
  end

  #---------------------------------------------------------
  # Public: #save
  # When changes are made to a Product object, this saves the changes to the database
  #
  # Parameter: None
  #
  # Returns: None
  #
  # State Changes: None
  #---------------------------------------------------------
  def save(params)
    DATABASE.execute("UPDATE products SET title ='#{params[:title]}', author = '#{params[:author]}', description = '#{params[:description]}', cost = #{params[:cost]}, price = #{params[:price]}, quantity = #{params[:quantity]}, category_id = #{params[:category_id]}, location_id = #{params[:location_id]} WHERE id = #{params[:id]}")
    return true
end

  #---------------------------------------------------------
  # Public: .all
  # Displays all products
  #---------------------------------------------------------
  def self.all
    results = DATABASE.execute("SELECT * FROM products")
    @results_as_objects = []
      results.each do |r|
        @results_as_objects << Product.new(r)
      end
      results_as_objects = @results_as_objects
      return results_as_objects
  end

  #---------------------------------------------------------
    # Public: .delete
    # Deletes a single product 
    #
    # Parameter: title
    #
    # Returns: None
    #
    # State Changes: Deletes product
  #---------------------------------------------------------
  def self.delete(title)
      DATABASE.execute("DELETE FROM products WHERE title = '#{title}'")
  end
end