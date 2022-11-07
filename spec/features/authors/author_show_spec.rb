require 'rails_helper'

describe "authors show page", type: :feature do    
  it "should display a Author page for Alan Turing" do
    first_name = "Alan"
    last_name = "Turing"
    homepage = "http://wikipedia.org/Alan_Turing"
    @alan = Author.new(
        first_name: first_name,
        last_name: last_name,
        homepage: homepage,
    )
    @alan.save
    visit author_path(@alan)
    expect(page).to have_text("first name:")
    expect(page).to have_text(first_name	)
    expect(page).to have_text("last name:")
    expect(page).to have_text(last_name)
    expect(page).to have_text("homepage:")
    expect(page).to have_text(homepage)
  end
end