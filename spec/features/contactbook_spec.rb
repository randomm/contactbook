require 'rails_helper'

describe "Fuzubook" do
  before :each do
    User.create username:"kek", password:"Kek1", password_confirmation:"Kek1"
    User.create username:"asd", password:"Asd1", password_confirmation:"Asd1"
    visit root_path
    sign_in("kek", "Kek1")
  end
  it "signin page is reachable from main page, and it works" do
    expect(page).to have_content("Contacts")
    expect(page).to have_content("kek")
  end

  it "has the functionality to add contacts, when signed in" do
    add_new_user("contact1", "123", "kek@kek.com")
    expect(page).to have_content("contact1")
    expect(page).to have_content("123")
    expect(page).to have_content("kek@kek.com")
    add_new_user("contact2", "123", "kek@kek.com")
    expect(page).to have_content("contact2")
  end

  it "cannot view other users" do
    visit user_path(User.second)
    save_and_open_page
    expect(page).to have_content("Not permitted")
  end

end

def add_new_user(name, phone, email)
  click_link("Add a new contact")
  fill_in("contact_name", with:name)
  fill_in("contact_number", with:phone)
  fill_in("contact_email", with:email)
  click_button("Create Contact")
end

def sign_in(user, pass)
  click_link("Sign in")
  fill_in('username', with:user)
  fill_in('password', with:pass)
  click_button("Log in")
end