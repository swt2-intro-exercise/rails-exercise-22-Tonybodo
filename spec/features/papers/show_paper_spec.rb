require 'rails_helper'

describe "paper show page", type: :feature do  
    context "given a paper with an author" do

        before :each do
            @alan = Author.new(
                first_name: "Alan",
                last_name: "Turing",
                homepage: "http://wikipedia.org/Alan_Turing",
            )
            @alan.save
            @paper = Paper.new(
                title: 'The Lord of the Rings',
                venue: 'New Zealand',
                year: 2022,
                authors: [@alan]
            )
            @paper.save
        end

        it "should display the full name of the author's of the paper" do
            visit paper_path(@paper)
            expect(page).to have_text(@alan.name)
        end
    end
end