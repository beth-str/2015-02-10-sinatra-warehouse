require 'minitest/autorun'
require 'sqlite3'
require 'pry'
DATABASE = SQLite3::Database.new("data_for_testing.db")
# require_relative 'db_setup.rb'
require_relative "../module"
require_relative "../models/category"
require_relative "../models/location"
require_relative "../models/product"


class WarehouseTest < Minitest::Test

  include WarehouseHelper
  # def setup
  #   DATABASE.execute("DELETE FROM categories")
  #   DATABASE.execute("DELETE FROM locations")
  #   DATABASE.execute("DELETE FROM products")
  # end

  # assert equal(expected, actual)

  def test_product_creation
    new_product = Product.new({'isbn' => 15679, 'title' => 'A Superior Book', 'author' => 'Me', 'description' => 'trade paperback', 'cost' => 1.99, 'price' => 5.99, 'quantity' => 10, 'category_id' => 3, 'location_id' => 2})
    x = new_product.insert
    assert_kind_of(Integer, x)
    # DATABASE.execute("DELETE FROM products WHERE author = 'Me'")
  end

  def test_product_deletion
    new_product = Product.new({'isbn' => 15679, 'title' => 'A Empty Book', 'author' => 'Me', 'description' => 'trade paperback', 'cost' => 1.99, 'price' => 5.99, 'quantity' => 10, 'category_id' => 3, 'location_id' => 2})
    x = new_product.insert
    array = Product.delete(new_product.title)
    assert_equal(0, array.length)
  end


  def test_location_creation
    new_location = Location.new({'city' => "Birmingham AL"})
    x = new_location.insert
    assert_kind_of(Integer, x)
    DATABASE.execute("DELETE FROM locations WHERE city = 'Birmingham AL'")
  end

  def test_category_creation
    new_category = Category.new({'genre' => "sci fi"})
    x = new_category.insert
    assert_kind_of(Integer, x)
    DATABASE.execute("DELETE FROM categories WHERE genre = 'sci fi'")
  end

  def test_location_deletion
    new_location = Location.new({'city' => "Jacksonville FL"})
    x = new_location.insert
    array = Location.delete(x)
    assert_equal(0, array.length)
  end

  def test_category_deletion
    new_category = Category.new({'genre' => "sweetness"})
    x = new_category.insert
    array = Category.delete(x)
    assert_equal(0, array.length)
  end

  def test_location_deletion_with_existing_products
    location = Location.delete(3)
    assert_empty([], location)
  end

  def test_category_deletion_with_existing_products
    category = Category.delete(1)
    assert_empty([], category)
  end

  def test_list_all_products
    y = DATABASE.execute("SELECT * FROM products")
    assert_equal(y.length, Product.all.length)
  end

end
