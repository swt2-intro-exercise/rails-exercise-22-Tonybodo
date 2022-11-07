require 'rails_helper'

describe "papers index page", type: :feature do

    context "no URL parameter given" do

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
                }.to change(Paper, :count).by(0)
        end

        it "should have a link to delete a paper page" do
            visit papers_path
            expect{
                    find(:xpath, "//a[@data-turbo-method='delete' and @href='#{paper_path(@paper)}']").click
                }.to change(Paper, :count).by(-1)
        end
    end

    context "given a year as URL parameter" do

        before :each do
            @paper = FactoryBot.create :paper
            @paper.save
            @paper1 = Paper.new(
                title: 'The Lord of the Rings',
                venue: 'New Zealand',
                year: 1954
            )
            @paper1.save
        end

        it "should filter based on the url parameter" do
            visit papers_path(year: 1954)
            expect(page).not_to have_text(@paper.title)
            expect(page).not_to have_text(@paper.venue)
            expect(page).not_to have_text(@paper.year)
            expect(page).to have_text(@paper1.title)
            expect(page).to have_text(@paper1.venue)
            expect(page).to have_text(@paper1.year)
        end
    end
end