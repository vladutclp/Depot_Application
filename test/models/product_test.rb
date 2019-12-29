require 'test_helper'

class ProductTest < ActiveSupport::TestCase

	fixtures :products

	test 'product attributes must not be empty' do
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:image_url].any?
		assert product.errors[:price].any?		
	end

	test 'price must be positive' do
		product = Product.new(title: 	   'My Book Title',
							  description: 'yyy',
							  image_url:   'asd.jpg')

		product.price = -1
		assert product.invalid?
		assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

		product.price = 0
		assert product.invalid?
		assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

		product.price = 1
		assert product.valid?
	end		

	def new_product(image_url)
		product = Product.new(title: 	   'My Book Title',
							  description: 'yyy',
							  image_url:   image_url,
							  price: 	   1)
	end


	test "image url" do
		ok =  %w{ fred.gif fred.png freg.jpg FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
		bad = %w{ fred.doc fred.gif/more fred.gif.more }

		ok.each do |image_url|
			assert new_product(image_url).valid?, "#{image_url} shouldn't be valid"
		end

		bad.each do |image_url|
			assert new_product(image_url).invalid?, "#{image_url} shouldn't be invalid"
		end
	end		

	test 'product is not valid without an unique name' do
		product = Product.new(title: 		products(:ruby).title,
							 description: 	'y',
							 image_url: 	"fred.gif",
							 price: 		1)
		assert product.invalid?
		assert_equal ['has already been taken'], product.errors[:title]
	end

	test 'length of title must be at least 10 characters' do
		product = Product.new(title: 		'zzz',
							 description: 	'y',
							 image_url: 	"fred.gif",
							 price: 		1)		
		assert product.invalid?
		assert_equal ['is too short (minimum is 10 characters)'], product.errors[:title]
	end

end


