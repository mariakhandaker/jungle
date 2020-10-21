require 'rails_helper'

RSpec.describe "Product", type: :model do
  describe 'Validations' do
    it 'should save 4 fields successfully' do
      category = Category.new(name: "Dog toys")
      product = Product.new(name: "chew toy", price_cents: 400, quantity: 1, category: category)
      expect(product).to be_valid
      product.errors.full_messages
    end

    it 'should error if no name' do
      category = Category.new(name: "Dog toys")
      product = Product.new(name: "", price_cents: 600, quantity: 3, category: category)
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should error if no price set' do
      category = Category.new(name: "Dog toys")
      product = Product.new(name: "kong", price_cents: nil, quantity: 10, category: category)
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should error if nil quantity' do
      category = Category.new(name: "Dog toys")
      product = Product.new(name: "squirrel plush", price_cents: 700, quantity: nil, category: category)
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should error if no category' do
      category = Category.new(name: "Dog toys")
      product = Product.new(name: "tennis ball", price_cents: 100, quantity: 3, category: nil)
      product.save
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
