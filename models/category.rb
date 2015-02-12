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
    # @id = options["id"]
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
    x = DATABASE.execute("SELECT * FROM categories")
    x.each do |x|
        puts "#{x[0]}: #{x[1]}"
      end
  end
  
  
  def display
   attributes = []
   query_components_array = []

   instance_variables.each do |i|
     attributes << i.to_s.delete("@")
   end

   attributes.each do |a|
     value = self.send(a)
     if value.is_a?(Float)
       front_spacer = " " * (12 - a.length)
       back_spacer = " " * (49 - ("#{self.send(a)}".length))
       puts "#{a}:" + "#{front_spacer}" + "#{back_spacer}" + "$#{self.send(a)}"
     else
       front_spacer = " " * (12 - a.length)
       back_spacer = " " * (50 - ("#{self.send(a)}".length))
       puts "#{a}:" + "#{front_spacer}" + "#{back_spacer}" + "#{self.send(a)}"
     end
   end
   puts "=" * 63
   return
  end
  

  #---------------------------------------------------------
    # Public: .delete
    # Deletes a single genre if no products are assigned to it
    #
    # Parameter: location_id
    #
    # Returns: None
    #
    # State Changes: Deletes genre
  #---------------------------------------------------------
  def self.delete(id_to_remove)
    #taking one record in the db and deleting it
    x = DATABASE.execute("SELECT category_id FROM products WHERE category_id = #{id_to_remove}")
    if x.length == 0
      DATABASE.execute("DELETE FROM categories WHERE id = #{id_to_remove}")
    else
      DATABASE.execute("SELECT * FROM products WHERE category_id = #{id_to_remove}")
    end
  end
  
end