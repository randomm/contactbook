require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    User.create username:"kek", password:"Kek1", password_confirmation:"Kek1"
    User.create username:"asd", password:"Asd1", password_confirmation:"Asd1"

  end
  it "recognizes the current user" do
    current_user = User.first
    expect(User.second.is_current_user(current_user)).to eq false
    expect(User.first.is_current_user(current_user)).to eq true
  end
end
