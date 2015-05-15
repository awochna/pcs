class Character
  include Mongoid::Document
  belongs_to :user
  field :name, type: String
  field :nickname, type: String
  field :experience, type: Integer
  field :level, type: Integer
  field :character_class, type: String
  field :race, type: String
  field :alignment, type: String
  field :deity, type: String
  field :size, type: String
  field :age, type: String
  field :gender, type: String
  field :height, type: String
  field :weight, type: String
  field :eyes, type: String
  field :hair, type: String
  field :strength, type: Integer
  field :dexterity, type: Integer
  field :constitution, type: Integer
  field :intelligence, type: Integer
  field :wisdom, type: Integer
  field :charisma, type: Integer
  field :favored_class, type: String

  def strength_mod
    strength_over_avg = self.strength - 10
    strength_over_avg / 2
  end

  def dexterity_mod
    dexterity_over_avg = self.dexterity - 10
    dexterity_over_avg / 2
  end

  def constitution_mod
    constitution_over_avg = self.constitution - 10
    constitution_over_avg / 2
  end

  def intelligence_mod
    intelligence_over_avg = self.intelligence - 10
    intelligence_over_avg / 2
  end

  def wisdom_mod
    wisdom_over_avg = self.wisdom - 10
    wisdom_over_avg / 2
  end

  def charisma_mod
    charisma_over_avg = self.charisma - 10
    charisma_over_avg / 2
  end
end
