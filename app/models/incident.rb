class Incident < ApplicationRecord
  extend ::Geocoder::Model::ActiveRecord

belongs_to :neighborhood

  validates_presence_of :date, :description, :address

  geocoded_by :address
  before_save :geocode

  def image_url
    case description
    when "theft"
      "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png"
    when "whatever"
      "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png"
    else
      "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png"
    end
  end
end
