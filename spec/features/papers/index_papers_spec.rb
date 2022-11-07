require 'rails_helper'

describe "papers index page", type: :feature do

    before :each do
        @paper = Paper.new(
            title: "The Lord of the Rings",
            venue: "New Zealand",
            year: 1954,
        )
        @paper.save
    end

    it "should have a link to edit a paper page" do
        visit papers_path
        expect{
                find(:xpath, "//a[@href= '#{edit_paper_path(@paper)}']").click
            }.to change(Author, :count).by(0)
    end
end