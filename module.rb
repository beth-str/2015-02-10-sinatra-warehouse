#---------------------------------------------------------
# Module: WarehouseHelper
# Class Methods for Products - moved into module
#
# Public Methods:
# edit_object  
# where_title_is
# where_id_is
# where_category_id_is
# where_location_id_is 
#---------------------------------------------------------


module WarehouseHelper

  #---------------------------------------------------------
    # Public: edit_object
    # for Product Class
    # Resets the values of an edited object and adds id back in. 
    #
    # Parameter: params (from web form)
    #
    # Returns: An object with all new fields
  #---------------------------------------------------------
  def edit_object(params)
    params.each do |field, value|
      thaw_field = field.dup.insert(0, "@")
      self.instance_variable_set(thaw_field, value) if value != ""
    end
  end


  #---------------------------------------------------------
    # Public: .where_title_is
    # for Product Class
    # Searches the Product class for a single title. 
    #
    # Parameter: title
    #
    # Returns: Single Product object with matching title (passed as argument)
  #---------------------------------------------------------
  def where_title_is(title)
    results = DATABASE.execute("SELECT * FROM products WHERE title = '#{title}'")  
      results_as_objects = Product.new(results[0]) 
   
    return results_as_objects
  end

      # Public: .where_id_is
      # Searches the Product class for a single id.
      #
      # Parameter: id
      #
      # Returns: Single Product object with matching id (passed as argument)
    #---------------------------------------------------------
    def where_id_is(id)
      x = DATABASE.execute("SELECT * FROM products WHERE id = #{id}")
      results = Product.new(params)
      return results
    end

  #---------------------------------------------------------
    # Public: .where_category_id_is
    # for Product Class
    # 
    # Searches for all products assigned to a specific category (genre) 
    #
    # Parameter: id (category_id)
    #
    # Returns: An array of hashes (only used to determine empty array or array of something)
  #---------------------------------------------------------

  def where_category_id_is(id)
      @products = DATABASE.execute("SELECT title FROM products INNER JOIN categories ON Products.category_id = Categories.id WHERE category_id = #{id}")
  end

  #---------------------------------------------------------
    # Public: .where_location_id_is
    # for Product Class
    # 
    # Searches for all products assigned to a specific location (city) 
    #
    # Parameter: id (location_id)
    #
    # Returns: An array of hashes (only used to determine empty array or array of something)
  #---------------------------------------------------------
    def where_location_id_is(id)
      @products = DATABASE.execute("SELECT title FROM products INNER JOIN locations ON Products.location_id = Locations.id WHERE location_id = #{id}")
    end
end