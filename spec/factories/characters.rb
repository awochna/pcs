FactoryGirl.define do
  factory :low_level_warrior, class: :character do
    user 
    name "Vorloth"
    experience 1
    level 1
    character_class "Warrior"
    race "Human"
    alignment "Chaotic Good"
    size "Medium"
    age "20"
    gender "Male"
    height "6'3\""
    weight "200"
    strength 18
    dexterity 12
    constitution 16
    intelligence 10
    wisdom 9
    charisma 12
    favored_class "Warrior"
  end

end
