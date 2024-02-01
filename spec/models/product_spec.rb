require_relative '../../app/models/product'


# RSpec.describe Product, type: :model do
#   describe 'Validations' do
#     let(:category) { Category.create(name: 'Test Category') }

#     it 'saves successfully with all four fields set' do
#       product = Product.new(
#         name: 'Test Product',
#         price_cents: 1000,
#         quantity: 10,
#         category: category,
#         image: Rack::Test::UploadedFile.new('path/to/test_image.jpg', 'image/jpg')
#       )
#       expect(product.save).to be true
#     end

#     it 'validates presence of name' do
#       product = Product.new(
#         price_cents: 500,
#         quantity: 5,
#         category: category,
#         image: Rack::Test::UploadedFile.new('path/to/test_image.jpg', 'image/jpg')
#       )
#       product.save
#       expect(product.errors.full_messages).to include("Name can't be blank")
#     end

#     it 'validates presence of price' do
#       product = Product.new(
#         name: 'Test Product',
#         quantity: 5,
#         category: category,
#         image: Rack::Test::UploadedFile.new('path/to/test_image.jpg', 'image/jpg')
#       )
#       product.save
#       expect(product.errors.full_messages).to include("Price can't be blank")
#     end

#     it 'validates presence of quantity' do
#       product = Product.new(
#         name: 'Test Product',
#         price_cents: 500,
#         category: category,
#         image: Rack::Test::UploadedFile.new('path/to/test_image.jpg', 'image/jpg')
#       )
#       product.save
#       expect(product.errors.full_messages).to include("Quantity can't be blank")
#     end

#     it 'validates presence of category' do
#       product = Product.new(
#         name: 'Test Product',
#         price_cents: 500,
#         quantity: 5,
#         image: Rack::Test::UploadedFile.new('path/to/test_image.jpg', 'image/jpg')
#       )
#       product.save
#       expect(product.errors.full_messages).to include("Category can't be blank")
#     end
#   end
# end

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.create(name: 'Test Category') }

    it 'is valid with all required fields' do
      product = Product.new(
        name: 'Test Product',
        price_cents: 1000,
        quantity: 10,
        category: category
      )
      expect(product).to be_valid
    end

    it 'is invalid without a name' do
      product = Product.new(
        price_cents: 500,
        quantity: 5,
        category: category
      )
      product.valid?
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is invalid without a price' do
      product = Product.new(
        name: 'Test Product',
        quantity: 5,
        category: category
      )
      product.valid?
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is invalid without a quantity' do
      product = Product.new(
        name: 'Test Product',
        price_cents: 500,
        category: category
      )
      product.valid?
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is invalid without a category' do
      product = Product.new(
        name: 'Test Product',
        price_cents: 500,
        quantity: 5
      )
      product.valid?
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

    # Add more tests for other validations if needed

  end
end