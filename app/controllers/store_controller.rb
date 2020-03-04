class StoreController < ApplicationController
  skip_before_action :authorize
  ''' The cart was added in the sider. To see it we have to create first in the store_controller index method'''
  include CurrentCart
  before_action :set_cart


  def index


  	@products = Product.order(:title)
  	#Shows how many times the store maine page has been accessed
  	if session[:counter].nil?
  		session[:counter] = 0
  	else
  		session[:counter] = session[:counter] + 1
  	end
  end
  
end
