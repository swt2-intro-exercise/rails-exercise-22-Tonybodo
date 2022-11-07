require 'rails_helper'

describe "authors index page", type: :feature do

    before :each do
        @alan = Author.new(
            first_name: "Alan",
            last_name: "Turing",
            homepage: "http://wikipedia.org/Alan_Turing",
        )
        @alan.save
    end

    it "should exist at /author and render without errors" do
        visit authors_path
    end

    it "should have a table with Name and Homepage as headers" do
        visit authors_path
        expect(page).to have_xpath("//table//th[text()='Name']")
        expect(page).to have_xpath("//table//th[text()='Homepage']")
    end 

    it "should have a link to add new authors" do
        visit authors_path
        expect(page).to have_link "New", href: new_author_path
    end

    it "should show authors with link to author's detail pages" do
        visit authors_path
        expect(page).to have_xpath("//table//td//a[contains(@href, '#{author_path(@alan)}') and text()='#{@alan.first_name + " " + @alan.last_name}']")
        expect(page).to have_xpath("//table//td//a[contains(@href, '#{@alan.homepage}') and text()='#{@alan.homepage}']")
    end

    it "should have a link to edit an author page" do
        visit authors_path
        expect{
                find(:xpath, "//table//td//a[contains(@href, '#{edit_author_path(@alan)}') and text()='Edit']").click
            }.to change(Author, :count).by(0)
    end

    it "should have a link to delete an author" do
        visit authors_path
        expect{
                find(:xpath, "//table//td//a[contains(@href, '#{author_path(@alan)}') and text()='Delete']").click
            }.to change(Author, :count).by(-1)
    end
end