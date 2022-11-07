require 'rails_helper'

RSpec.describe Author, type: :model do
    before :each do
        @authors = [
            {author: Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing"), isValid: true},
            {author: Author.new(first_name: "Alan", last_name: "", homepage: "http://wikipedia.org/Alan_Turing"), isValid:false},
            {author: Author.new(first_name: "Alan", last_name: "T", homepage: "http://wikipedia.org/Alan_Turing"), isValid: false},
            {author: Author.new(first_name: "Alan", last_name: nil, homepage: "http://wikipedia.org/Alan_Turing"), isValid: false},
            {author: Author.new(first_name: nil, last_name: "Yi", homepage: nil), isValid: true}
        ]
    end
    
    it "should not except authors with last_name with under 2 letters" do
        @authors.each do |author_validation| 
            expect(author_validation[:author].valid?).to eq(author_validation[:isValid])
        end
    end
end