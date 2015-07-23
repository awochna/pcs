require 'rails_helper'

RSpec.describe Character, type: :model do

  let(:low_level_warrior) { FactoryGirl.create(:low_level_warrior) }

  subject { low_level_warrior }

  it { is_expected.to be_valid }

  # Owning model
  it { is_expected.to respond_to :user }

  # Fluff
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :nickname }
  it { is_expected.to respond_to :experience }
  it { is_expected.to respond_to :level }
  it { is_expected.to respond_to :character_class }
  it { is_expected.to respond_to :race }
  it { is_expected.to respond_to :alignment }
  it { is_expected.to respond_to :deity }
  it { is_expected.to respond_to :size }
  it { is_expected.to respond_to :age }
  it { is_expected.to respond_to :gender }
  it { is_expected.to respond_to :height }
  it { is_expected.to respond_to :weight }
  it { is_expected.to respond_to :eyes }
  it { is_expected.to respond_to :hair }
  it { is_expected.to respond_to :favored_class }
  it { is_expected.to respond_to :hitpoints }

  # Base stat block
  it { is_expected.to respond_to :strength }
  it { is_expected.to respond_to :dexterity }
  it { is_expected.to respond_to :constitution }
  it { is_expected.to respond_to :intelligence }
  it { is_expected.to respond_to :wisdom }
  it { is_expected.to respond_to :charisma }
  it { is_expected.to respond_to :fortitude }
  it { is_expected.to respond_to :reflex }
  it { is_expected.to respond_to :will }
  
  # Movable speeds
  it { is_expected.to respond_to :land_speed }
  it { is_expected.to respond_to :flight_speed }
  it { is_expected.to respond_to :swim_speed }

  # Skills
  skills = %w[ acrobatics appraise bluff climb diplomacy disguise
                     escape_artist fly heal intimidate perception ride
                     sense_motive stealth survival swim track disable_device
                     handle_animal linguistics sleight_of_hand spellcraft
                     use_magic_device ]

  skills.each do |skill|
    it { is_expected.to respond_to skill }
    it { is_expected.to respond_to "#{skill}_rank" }
  end

  # Other embedded models
  it { is_expected.to respond_to :combat_block }
  it { is_expected.to respond_to :equipments }
  it { is_expected.to respond_to :inventory }
  it { is_expected.to respond_to :effects }
  it { is_expected.to respond_to :conditions }

  describe "low level warrior" do

    describe "should be able to give a modifier" do

      specify "for strength" do
        subject.strength = 18
        expect(subject.strength_mod).to eq 4
      end

      specify "for dexterity" do
        subject.dexterity = 12
        expect(subject.dexterity_mod).to eq 1
      end

      specify "for constitution" do
        subject.constitution = 16
        expect(subject.constitution_mod).to eq 3
      end

      specify "for intelligence" do
        subject.intelligence = 10
        expect(subject.intelligence_mod).to eq 0
      end

      specify "for wisdom" do
        subject.wisdom = 8
        expect(subject.wisdom_mod).to eq -1
      end

      specify "for charisma" do
        subject.charisma = 14
        expect(subject.charisma_mod).to eq 2
      end

      specify "when attribute is an odd number" do
        subject.strength = 19
        expect(subject.strength_mod).to eq 4
      end
    end

    describe "has calculable saving throws" do

      specify "for fortitude" do
        subject.constitution = 16
        subject.fortitude = 2
        expect(subject.calculated_fortitude).to eq 5
      end

      specify "for reflex" do
        subject.dexterity = 12
        subject.reflex = 2
        expect(subject.calculated_reflex).to eq 3
      end

      specify "for will" do
        subject.wisdom = 8
        subject.will = 1
        expect(subject.calculated_will).to eq 0
      end
    end

    specify "has calculable perception" do
      subject.perception_rank = 1
      subject.wisdom = 12
      expect(subject.perception).to eq 2
    end
  end
end
