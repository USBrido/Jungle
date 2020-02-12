require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "validates everything" do
      pets = Category.create
      mat = pets.products.create({
        name: "JOhn Doe",
        description: "Description",
        quantity: 10,
        price: 64.99
      })
      expect(mat).to be_valid
      end
    it "validates name" do
      pets = Category.create
      mat = pets.products.create({
        name: nil,
        description: "Description",
        quantity: 10,
        price: 64.99
      })
      expect(mat).to_not be_valid
      end
    it "validates price" do
      pets = Category.create
      mat = pets.products.create({
        name:  'Men\'s Classy shirt',
        description: "Descrip",
        quantity: 10,
        price: nil
      })
      expect(mat).to_not be_valid
    end
    it "validates quantity" do 
      pets = Category.create
      mat = pets.products.create({
        name:  'Men\'s Classy shirt',
        description: "Descrip",
        quantity: nil,
        price: 64.99
      })
      expect(mat).to_not be_valid
    end
    it "validate category" do
      pets = Category.create
      mat = pets.products.create({
        name:  'Men\'s Classy shirt',
        description: "Descrip",
        quantity: 10,
        price: 64.99
      })
        mat.category =nil
    expect(mat).to_not be_valid
    end  
  end
end



