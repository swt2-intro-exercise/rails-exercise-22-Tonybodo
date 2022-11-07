require 'rails_helper'

describe "New author page", type: :feature do
   it "should exist at 'new_author_path' and render withour error" do
     # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
     # http://localhost:3000/
     visit new_author_path
   end

   it "should have a text input fields for an author's first name, last name and homepage" do
    visit new_author_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
   end

   it "should be able to save authors in the database" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[last_name]', with: 'Turing'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click 
  end

  it "should throw an error, when no last name is submitted" do
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'Alan'
    page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Alan_Turing'
    find('input[type="submit"]').click
    
    error_msg_1 = "Last name can't be blank"
    error_msg_2 = "Last name is too short (minimum is 2 characters)"
    expect(page).to have_text(error_msg_1)
    expect(page).to have_text(error_msg_2)
  end
end
