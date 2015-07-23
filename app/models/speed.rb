class Speed
  include Mongoid::Document
  embedded_in :character
  field :distance, type: Integer
  field :run_multiplier, type: Integer

  def max_distance
    self.distance * self.run_multiplier
  end
end
