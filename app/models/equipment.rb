class Equipment
  include Mongoid::Document
  embedded_in :character
end
