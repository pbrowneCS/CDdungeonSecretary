class Enemy < ActiveRecord::Base
  belongs_to :encounter
  validates :name, :bonus, presence: true
end
