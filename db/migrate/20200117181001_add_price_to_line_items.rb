class AddPriceToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :price, :decimal

    LineItem.all.each do |line_item|
    	line_item.price = line_item.product.price if line_item
    end
  end


end
