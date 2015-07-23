module Skilled
  extend ActiveSupport::Concern

  SKILLS = { acrobatics: :dexterity,
             appraise: :intelligence,
             bluff: :charisma,
             climb: :strength,
             diplomacy: :charisma,
             disguise: :charisma,
             escape_artist: :dexterity,
             fly: :dexterity,
             heal: :wisdom,
             intimidate: :charisma,
             perception: :wisdom,
             ride: :dexterity,
             sense_motive: :wisdom,
             stealth: :dexterity,
             survival: :wisdom,
             swim: :strength,
             track: :wisdom,
             disable_device: :dexterity,
             handle_animal: :charisma,
             linguistics: :intelligence,
             sleight_of_hand: :dexterity,
             spellcraft: :intelligence,
             use_magic_device: :charisma }

  included do
    SKILLS.each do |skill, modifier|
      field "#{skill}_rank", type: Integer
    end
  end

  SKILLS.each do |skill, modifier|
    define_method(skill) do
      self.send("#{skill}_rank") + self.send("#{modifier}_mod")
    end
  end
end
