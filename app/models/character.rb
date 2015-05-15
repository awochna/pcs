class Character
  include Mongoid::Document
  belongs_to :user
  field :name, type: String
end
