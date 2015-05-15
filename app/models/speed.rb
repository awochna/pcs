class Speed
  include Mongoid::Document
  embedded_in :character
end
