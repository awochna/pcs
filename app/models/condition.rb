class Condition
  include Mongoid::Document
  embedded_in :character
end
