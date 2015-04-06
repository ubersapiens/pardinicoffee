class Client < ActiveRecord::Base
  enum coffee_method_used: [:espresso, :filter]
  enum coffee_grind: [:coarse, :medium, :fine]
end
