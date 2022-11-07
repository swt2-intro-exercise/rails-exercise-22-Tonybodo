require 'rails_helper'

describe "Edit author page", type: :feature do
    before :each do
        first_name = "Alan"
        last_name = "Turing"
        homepage = "http://wikipedia.org/Alan_Turing"
        @alan = Author.new(
            first_name: first_name,
            last_name: last_name,
            homepage: homepage,
        )
        @alan.save
    end

    it "should exist at 'edit_author_path' and render withour error" do
        visit edit_author_path(@alan)
    end

    it "should edit the author in the database, when change is submitted" do
        visit edit_author_path(@alan)
        fill_in 'author[homepage]',	with: "http://wikipedia.org/computer_scientists/Alan_Turing"
        expect{
            find('input[type="submit"]').click
        }.to change(Author, :count).by(0)
        @alan.reload
        expect(@alan.homepage).to eq("http://wikipedia.org/computer_scientists/Alan_Turing")
    end
end