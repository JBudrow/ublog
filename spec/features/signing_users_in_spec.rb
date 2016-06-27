require "rails_helper"

RSpec.feature "Users sign-in" do

  before do
    @tycho = User.create!(email: "tycho@example.com", password: "password")
  end

  scenario "with valid credentials" do
    visit "/"

    click_link "Sign in"
    fill_in "Email", with: @tycho.email
    fill_in "Password", with: @tycho.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@tycho.email}")
  end
end
