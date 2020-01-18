require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@cart = Cart.new
  	@book1 = products(:ruby)
  	@book2 = products(:rails)
  end


  test "should add unique products" do
  	@cart.add_product(@book1).save!
  	@cart.add_product(@book2).save!

  	assert_equal 2, @cart.line_items.count

  	assert_equal (@cart.total_price).to_f, (@book1.price + @book2.price).to_f
  end

  test "should not add duplicate products" do
  	
  	5.times do 
  		@cart.add_product(@book1).save!
  	end

  	assert_equal 5, @cart.line_items.find_by(product_id: @book1.id).quantity

  	assert_equal 1, @cart.line_items.count
  	assert_equal (@cart.total_price).to_f, (5*@book1.price).to_f
  end

end
