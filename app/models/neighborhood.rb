class Neighborhood < ApplicationRecord
  has_many :incidents

    validates_presence_of :name, :city, :state
end
