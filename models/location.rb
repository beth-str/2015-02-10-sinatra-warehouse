#---------------------------------------------------------
# Class: Location
# Facilitates management of the warehouse locations (city) to store our products.
#
# Attributes:
# @id     - Integer (Primary Key) in locations table (automatically assigned)
# @city   - String: the city name and state abbreviation (e.g., 'Omaha NE')
#
# Public Methods:
# #insert
# .all  
# .delete 
#---------------------------------------------------------

class Location
  attr_reader :id
  attr_accessor :city
  
  def initialize(options)
    @id   = options["id"]
    @city = options["city"]
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
    DATABASE.execute("INSERT INTO locations (city) VALUES ('#{@city}')")
    @id = DATABASE.last_insert_row_id     # will return the value of the row id
  end
  
  #---------------------------------------------------------
  # Public: .all
  # Displays all locations
  #
  # Parameter: None
  #
  # Returns: None
  #
  # State Changes: None
  #---------------------------------------------------------
  def self.all
    results = DATABASE.execute("SELECT * FROM locations")
    @results_as_objects = []
      results.each do |r|
        @results_as_objects << Location.new(r)
      end
      results_as_objects = @results_as_objects
      return results_as_objects
  end

  #---------------------------------------------------------
  # Public: .delete
  # Deletes a single location if no products are assigned to it
  #
  # Parameter: Integer (location_id)
  #
  # Returns: None
  #
  # State Changes: Deletes location
  #---------------------------------------------------------
  def self.delete(id_to_remove)
      DATABASE.execute("DELETE FROM locations WHERE id = #{id_to_remove}")
  end

end