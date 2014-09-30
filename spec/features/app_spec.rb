require 'rails_helper'
require 'capybara/rails'

feature 'anon user' do
  scenario 'anon user can see homepage' do
    visit '/'

    expect(page).to have_content("Rantly Let it all out")
    expect(page).to have_content("Quote")
  end

end