class Character
  include Mongoid::Document
  include BaseStatBlocked
  include Skilled
  include Movable
  belongs_to :user
  embeds_one :combat_block
  embeds_one :inventory
  embeds_many :equipments
  embeds_many :effects
  embeds_many :conditions
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
  field :favored_class, type: String
  field :hitpoints, type: Integer
  field :fortitude, type: Integer
  field :reflex, type: Integer
  field :will, type: Integer
end
