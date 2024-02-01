require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )
      expect(user).to be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      user = User.new(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'differentpassword',
        first_name: 'John',
        last_name: 'Doe'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is not valid without a password and password_confirmation' do
      user = User.new(
        email: 'test@example.com',
        first_name: 'John',
        last_name: 'Doe'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid with a non-unique email' do
      existing_user = User.create(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )

      user = User.new(
        email: 'TEST@example.com',
        password: 'newpassword',
        password_confirmation: 'newpassword',
        first_name: 'Jane',
        last_name: 'Doe'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email has already been taken")
    end

    it 'is not valid without an email, first name, and last name' do
      user = User.new
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email can't be blank", "First name can't be blank", "Last name can't be blank")
    end
  end

  describe 'Password minimum length' do
    it 'is not valid with a password less than 6 characters' do
      user = User.new(
        email: 'test@example.com',
        password: 'pass',
        password_confirmation: 'pass',
        first_name: 'John',
        last_name: 'Doe'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
