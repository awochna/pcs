module Movable
  extend ActiveSupport::Concern

  included do
    embeds_one :land_speed, class_name: "Speed"
    embeds_one :swim_speed, class_name: "Speed"
    embeds_one :flight_speed, class_name: "Speed"
  end

  def can_run?
    self.land_speed.distance != 0
  end

  def can_swim?
    self.swim_speed.distance != 0
  end

  def can_fly?
    self.flight_speed.distance != 0
  end
end
