class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :players
  has_many :encounters
end
