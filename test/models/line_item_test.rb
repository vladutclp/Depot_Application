require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "shoul show all line items" do

  	assert_equal 4, LineItem.all.count

 

  end
end
