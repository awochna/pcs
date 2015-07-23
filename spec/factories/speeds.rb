FactoryGirl.define do
  factory :land_speed, class: Speed do
    distance 30
    run_multiplier 3
  end

  factory :swim_speed, class: Speed do
    distance 20
    run_multiplier 2
  end

  factory :flight_speed, class: Speed do
    distance 60
    run_multiplier 4
  end

  factory :no_flight_speed, class: Speed do
    distance 0
    run_multiplier 0
  end
end
