class Entity < ActiveRecord::Base
  has_many :users_entities, dependent: :destroy
  has_many :users, through: :users_entities

  attr_accessible :category, :name

  validates :category, :name, presence: true
  validates :name, uniqueness: true
end
