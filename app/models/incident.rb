class Incident < ApplicationRecord
belongs_to :neighborhood

  validates_presence_of :date, :description
end
