require 'rails_helper'

RSpec.feature "Users", type: :feature do

  let(:user) { FactoryGirl.create(:user) }

  subject { page }

  describe "log in" do

    before do
      visit '/'
      click_link 'Sign in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end

    specify "without characters" do
      expect(page).to have_content "You don't have any characters yet!"
    end
  end
end
