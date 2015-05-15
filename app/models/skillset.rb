class Skillset
  include Mongoid::Document
  embedded_in :character

  field :perception, type: Integer
end
