require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:all) do
      @category = Category.create(:name => 'testC')
    end

    describe 'valid product' do
      it 'should create a product' do
        @product = Product.create(:name => 'Testaroo', :price => 20, :quantity => 3, :category => @category)

        expect(@category.products).to include @product
      end
    end

    describe 'product missing a name' do
      it 'should return empty name error message' do
        @product = Product.create(:name => nil, :price => 20, :quantity => 3, :category => @category)

        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    describe 'product missing a quantity' do
      it 'should return empty quantity error message' do
        @product = Product.create(:name => 'Testaroo', :price => 20, :quantity => nil, :category => @category)

        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    describe 'product missing a price' do
      it 'should return empty price error message' do
        @product = Product.create(:name => 'Testaroo', :price => nil, :quantity => 1, :category => @category)

        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end

    describe 'product missing a category' do
      it 'should return empty category error message' do
        @product = Product.create(:name => 'Testaroo', :price => 20, :quantity => 1, :category => nil)

        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end

  end
end
