require 'rails_helper'

describe "authors index page", type: :feature do

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
        first_name = "Alan"
        last_name = "Turing"
        homepage = "http://wikipedia.org/Alan_Turing"
        @alan = Author.new(
            first_name: first_name,
            last_name: last_name,
            homepage: homepage,
        )
        @alan.save
        visit authors_path
        expect(page).to have_xpath("//table//td//a[contains(@href, '#{author_path(@alan)}') and text()='#{first_name + " " + last_name}']")
        expect(page).to have_xpath("//table//td//a[contains(@href, '#{homepage}') and text()='#{homepage}']")
    end
end