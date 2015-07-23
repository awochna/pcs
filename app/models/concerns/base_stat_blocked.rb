module BaseStatBlocked
  extend ActiveSupport::Concern

  included do
    field :strength, type: Integer
    field :dexterity, type: Integer
    field :constitution, type: Integer
    field :intelligence, type: Integer
    field :wisdom, type: Integer
    field :charisma, type: Integer
  end

  %w[strength dexterity constitution intelligence wisdom charisma].each do |stat|
    define_method("#{stat}_mod") do
      stat_over_avg = self.send(stat) - 10
      stat_over_avg / 2
    end
  end

  def calculated_fortitude
    self.fortitude + constitution_mod
  end

  def calculated_reflex
    self.reflex + dexterity_mod
  end

  def calculated_will
    self.will + wisdom_mod
  end
end
