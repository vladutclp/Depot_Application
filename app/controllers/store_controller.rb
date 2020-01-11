class StoreController < ApplicationController



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
