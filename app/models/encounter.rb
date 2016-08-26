class Encounter < ActiveRecord::Base
  belongs_to :campaign
  has_many :enemies
end
