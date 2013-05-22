class Entity < ActiveRecord::Base
  attr_accessible :category, :name

  validates :category, :mane, presence: true
end
