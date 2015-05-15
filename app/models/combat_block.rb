class CombatBlock
  include Mongoid::Document
  embedded_in :character
end
