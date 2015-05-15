class Inventory
  include Mongoid::Document
  embedded_in :character
end
