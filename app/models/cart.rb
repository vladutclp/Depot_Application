class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy

	def add_product(product)
		current_item = line_items.find_by(product_id: product.id) #find_by returns either an existing LineItem or nil

		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product.id, price: product.price)
		end

		current_item
	end

	def total_price
		line_items.to_a.sum {|item| item.total_price}
	end


	def decrement_line_item(line_item)
	
		if line_item.quantity >= 1
			line_item.quantity -= 1
		end

		line_item

	end


end
