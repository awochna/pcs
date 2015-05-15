require 'rails_helper'

RSpec.describe Character, type: :model do

  let(:low_level_warrior) { FactoryGirl.create(:low_level_warrior) }

  subject { low_level_warrior }

  it { is_expected.to be_valid }

  it { is_expected.to respond_to :user }
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
  it { is_expected.to respond_to :strength }
  it { is_expected.to respond_to :dexterity }
  it { is_expected.to respond_to :constitution }
  it { is_expected.to respond_to :intelligence }
  it { is_expected.to respond_to :wisdom }
  it { is_expected.to respond_to :charisma }
  it { is_expected.to respond_to :favored_class }

  describe "low level warrior" do

    describe "should be able to give a modifier" do

      specify "for strength" do
        subject.strength = 18
        subject.save
        expect(subject.strength_mod).to eq 4
      end

      specify "for dexterity" do
        subject.dexterity = 12
        subject.save
        expect(subject.dexterity_mod).to eq 1
      end

      specify "for constitution" do
        subject.constitution = 16
        subject.save
        expect(subject.constitution_mod).to eq 3
      end

      specify "for intelligence" do
        subject.intelligence = 10
        subject.save
        expect(subject.intelligence_mod).to eq 0
      end

      specify "for wisdom" do
        subject.wisdom = 8
        subject.save
        expect(subject.wisdom_mod).to eq -1
      end

      specify "for charisma" do
        subject.charisma = 14
        subject.save
        expect(subject.charisma_mod).to eq 2
      end

      specify "when attribute is an odd number" do
        subject.strength = 19
        subject.save
        expect(subject.strength_mod).to eq 4
      end
    end
  end
end
