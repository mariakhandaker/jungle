require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validate' do

    it 'should save all fields' do
      test_user = User.new(name: 'Maria', email: 'mariakhandaker@gmail.com', password: 'password', password_confirmation: 'password')
      expect(test_user).to be_valid
    end

    it 'should error if no user name' do
      test_user = User.new(name: nil, email: 'maria_1994@msn.com', password: 'password', password_confirmation: 'password')
      test_user.save
      expect(test_user.errors.full_messages).to include("Name can't be blank")
    end

    it 'should error without email' do
      test_user = User.new(name: 'Lacey Pants', email: nil, password: 'password', password_confirmation: 'password')
      test_user.save
      expect(test_user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should error if no password' do
      test_user = User.new(name: 'Lacey Pants', email: 'laceyisadog@msn.com', password: nil, password_confirmation: 'password')
      test_user.save
      expect(test_user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should error if password is not entered in password confirmation' do
      test_user = User.new(name: 'Sabina mom', email: 'ssultana387@gmail.com', password: 'password', password_confirmation: nil)
      test_user.save
      expect(test_user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'should error if password does not match password confirmation' do
      test_user = User.new(name: 'Anima', email: 'anima1991@hotmail.com', password: 'password', password_confirmation: 'swordpass')
      test_user.save
      expect(test_user.errors.messages[:password_confirmation]).to include("doesn't match Password")
    end

    it 'should produce error if email already exists in database' do
      test_user = User.new(name: 'Lacey Pants', email: 'laceyisadog@gmail.com', password: 'password', password_confirmation: 'password')
      test_user.save
      test_user_two = User.new(name: 'Lacey Evil twin', email: 'laceyisadog@gmail.com', password: 'password', password_confirmation: 'password')
      test_user_two.save
      expect(test_user.errors.messages).to include("email already exists")
    end

  end
  describe 'authenticate_with_credentials'  do
    before(:each) do
      @test_user = User.new(name: "Maria Khandaker", email: "mariakhandaker@gmail.com", password: "Lacey3Treats", password_confirmation: "Lacey3Treats")
      @test_user.save
    end

    it 'should login successfully with valid credentials' do
      @logged_in_test = User.authenticate_with_credentials(@test_user.email, @test_user.password)
      expect(@logged_in_test.email).to eq(@test_user.email)
    end

    it 'should account for extra spaces' do
      @logged_in_test = User.authenticate_with_credentials(" #{@test_user.email} ", @test_user.password)
      expect(@logged_in_test.email).to eq(@test_user.email)
    end

    it 'should be case sensitive' do
      @logged_in_test = User.authenticate_with_credentials("marIaKhandakeR@gmail.com", @test_user.password)
      expect(@logged_in_test.email).to eq(@test_user.email)
    end
  end
end
