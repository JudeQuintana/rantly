require 'rails_helper'
require 'capybara/rails'

feature 'anon user' do
  scenario 'anon user can see homepage' do
    visit '/'

    expect(page).to have_content("Rantly Let it all out")
    expect(page).to have_content("Jeff")
  end

  scenario 'anon user can register' do
    visit '/'

    find('#join-link').click
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
    expect(page).to have_content("Bio")
    expect(page).to have_content("Daily")
    expect(page).to have_content("Weekly")
    expect(page).to have_content("Monthly")

    fill_in 'Username', with: "Jude"
    fill_in 'Password', with: "Jude"
    fill_in 'First name', with: "Jude"
    fill_in 'Last name', with: "Quintana"
    fill_in 'Bio', with: "is the illest turned iller"
    choose 'user_rant_freq_daily'

    click_on "Register"

    expect(page).to have_content("Thanks for registering!")
  end

end