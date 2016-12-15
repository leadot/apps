class User < ApplicationRecord
  extend ::Geocoder::Model::ActiveRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :neighborhood, required: false

  geocoded_by :address
  before_save :geocode

     #def address
      # "#{street}#{city}#{state}"
     #end

  end
