require 'rails_helper'

RSpec.feature "Characters", type: :feature do
  let!(:low_level_warrior) { FactoryGirl.create(:low_level_warrior) }
  let!(:user) { low_level_warrior.user }

  subject(:character) { low_level_warrior }
  subject { page }

  describe "log in" do

    before do
      visit '/'
      click_link 'Sign in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'
    end

    context "as user who has a character" do
       
      it { is_expected.to have_content character.name }

      context "viewing that character" do

        before { click_link character.name }

        it { is_expected.to have_content "Name: #{character.name}" }
        it { is_expected.to have_content "Class: #{character.character_class}" }
        it { is_expected.to have_content "Level: #{character.level}" }
      end
    end

    specify "as a user to create a new character" do
      click_link "Make a new character"
      fill_in "Name", with: "Mandee"
      click_button "Create character"
      expect(Character.last.name).to eq "Mandee"
      expect(page).to have_content "Name: Mandee"
    end
  end
end
