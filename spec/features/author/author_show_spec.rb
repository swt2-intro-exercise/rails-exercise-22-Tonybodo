require 'rails_helper'

describe "authors show page", type: :feature do    
  it "should display a Author page for Alan Turing" do
    @alan = Author.new(
      first_name: "Alan",
      last_name: "Turing",
      homepage: "http://wikipedia.org/Alan_Turing",
    )
    @alan.save
    #expect{
    #  @alan = Author.create(
    #    first_name: "Alan",
    #    last_name: "Turing",
    #homepage: "http://wikipedia.org/Alan_Turing"
    #  )
    #}.to change(Author, :count).by(1)
    
    visit author_path(@alan)
    expect(page).to have_text("first name:")
    expect(page).to have_text("Alan")
    expect(page).to have_text("last name:")
    expect(page).to have_text("Turing")
    expect(page).to have_text("homepage:")
    expect(page).to have_text("http://wikipedia.org/Alan_Turing")
  end
end