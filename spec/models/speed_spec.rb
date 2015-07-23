require 'rails_helper'

RSpec.describe Speed, type: :model do
  let(:character) { FactoryGirl.create(:low_level_warrior) }

  describe "Character's land speed" do

    subject { character.land_speed }

    it { is_expected.to respond_to :distance }
    it { is_expected.to respond_to :run_multiplier }
    it { is_expected.to respond_to :max_distance }

    it "should know that it's max distance per turn" do
      expected_distance = subject.distance * subject.run_multiplier
      expect(subject.max_distance).to eq expected_distance
    end
  end

  describe "character's non-existent flight speed" do

    subject { character }

    it { is_expected.to respond_to :can_run? }
    it { is_expected.to respond_to :can_swim? }
    it { is_expected.to respond_to :can_fly? }

    it "should know it cannot fly" do
      expect(character.can_fly?).to be false
    end

    it "should know it can run" do
      expect(character.can_run?).to be true
    end

    it "should know it can swim" do
      expect(character.can_swim?).to be true
    end
  end
end

