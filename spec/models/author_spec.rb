require 'rails_helper'

RSpec.describe Author, type: :model do
    it "should have first name, last name, homepage and function to show whole name" do
        before :each do
            @author = Author.new(
                first_name: "Alan",
                last_name: "Turing",
                homepage: "http://wikipedia.org/Alan_Turing")
        end
        
        expect(author.first_name).to eq(firstName)
        expect(author.last_name).to eq(lastName)
        expect(author.homepage).to eq(homepage)
        expect(author.name).to eq(firstName + " " + lastName)
    end 
end
