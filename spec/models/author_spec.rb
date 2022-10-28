require 'rails_helper'

RSpec.describe Author, type: :model do
    it "should have first name, last name, homepage and function to show whole name" do
        firstName = "Alan"
        lastName = "Turing"
        homepage = "https://wikipedia.org"
        author = Author.new(first_name: firstName, last_name: lastName, homepage: homepage)
        expect(author.first_name).to eq(firstName)
        expect(author.last_name).to eq(lastName)
        expect(author.homepage).to eq(homepage)
        expect(author.name).to eq(firstName + " " + lastName)
    end 
end
