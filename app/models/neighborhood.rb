class Neighborhood < ApplicationRecord
  extend ::Geocoder::Model::ActiveRecord

  has_many :incidents

  validates_presence_of :name, :city, :state

  belongs_to :user

  geocoded_by :address
  before_save :geocode

  def address
    "#{name} #{city} #{state}"
  end
end
