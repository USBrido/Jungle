require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    user = User.create({name: "Jane Doe" ,email: "jdoe@gmail.com" , password: "12345" , password_confirmation: "12345" })

    it "validates everything" do
      expect(user).to be_valid
    end

    it "validates name" do
      user.name = nil
      expect(user).not_to be_valid
    end
    
    it "validates password comfirmaton existence" do
      user.password_confirmation = nil
      expect(user).not_to be_valid
    end

    it "validates password is equal to confmation" do
      expect(user.password).to eq(user.password_confirmation)
    end

    it "validates unique (single occurency) email" do 
      user.save
      expect(User.where(email: user.email).count).to be(1)
      user2 = User.create({name: "Jane Doe" ,email: "jdoe@gmail.com" , password: "12345" , password_confirmation: "12345" })
      expect(User.where(email: user.email).count).not_to be(2)
    end

    it "validate category" do
      user.save
      user3 = User.create({name: "Jane Doe" ,email: "jdoe@gmail.com" , password: "12345" , password_confirmation: "12345" })
      expect(User.where(user3.email).count).to be(0)
    end 

  end

  describe ".authenticate_with_credentials" do
    user = User.create({name: "John Doe" ,email: "johndoe@gmail.com" , password: "12345" , password_confirmation: "12345" })

    it "validates everything" do
      user = User.authenticate_with_credentials(user.email, user.password)
      expect(user).not_to be_nil
    end

    it "validates if password doesn't match" do
      user = User.authenticate_with_credentials(user.email, '123')
      expect(user).to be_nil
    end
    
    it "validates user existence" do
      user = User.authenticate_with_credentials("jaydoe@gmail.com", user.password)
      expect(user).to be_nil
    end

    it "validates the user if there's a wrong case in the email" do
      user = User.authenticate_with_credentials("JDOE@gmail.com", user.password)
      expect(user).not_to be_nil
    end

    it "validates password comfirmaton existence" do
      user = User.authenticate_with_credentials(" JDOE@gmail.com ", user.password)
      expect(user).not_to be_nil
    end
  end
end
