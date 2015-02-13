#---------------------------------------------------------
# Class: Category
# Facilitates management of the categories (genres) assigned to our products.
#
# Attributes:
# @id     - Integer (Primary Key) in categories table (automatically assigned)
# @genre  - String: the gener name (e.g., 'thriller')
#
# Public Methods:
# #insert
# .all  
# .delete 
#---------------------------------------------------------
class Category
  # include Driver
  attr_reader :id
  attr_accessor :genre
  
  def initialize(options)
    @id = options["id"]
    @genre = options["genre"]
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
    
    DATABASE.execute("INSERT INTO categories (genre) VALUES ('#{@genre}')")
    @id = DATABASE.last_insert_row_id     # will return the value of the row id
  end

  #---------------------------------------------------------
    # Public: .all
    # Displays all genres
    #
    # Parameter: None
    #
    # Returns: None
    #
    # State Changes: None
  #---------------------------------------------------------
  def self.all
    results = DATABASE.execute("SELECT * FROM categories")
    @results_as_objects = []
      results.each do |r|     # r is a hash
          # this loops through and creates an array of objects
      @results_as_objects << Category.new(r)
      end
      results_as_objects = @results_as_objects
      return results_as_objects
  end

  #---------------------------------------------------------
    # Public: .delete
    # Deletes a single genre if no products are assigned to it
    #
    # Parameter: Integer: location_id
    #
    # Returns: None
    #
    # State Changes: Deletes genre
  #---------------------------------------------------------
  def self.delete(id_to_remove)
      DATABASE.execute("DELETE FROM categories WHERE id = #{id_to_remove}")
  end

end