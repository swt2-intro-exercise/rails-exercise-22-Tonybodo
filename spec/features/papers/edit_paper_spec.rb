require 'rails_helper'

describe "paper edit page", type: :feature do  

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
                year: 2022
            )
            @paper.save
        end

        it "should render without error" do
            visit edit_paper_path(@paper)
        end

        it "should have a multiple select element for the authors of the paper" do
            visit edit_paper_path(@paper)
            expect(page).to have_xpath("//select//option[text()='#{@alan.name}' and @value='#{@alan.id}']")
        end
    end
end