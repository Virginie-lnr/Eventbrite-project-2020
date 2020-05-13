class Event < ApplicationRecord
  # Un événement a plusieurs participations, et plusieurs participants (utilisateurs) au travers des participations.
  has_many :attendances
  has_many :users, through: :attendances

  # Un événement appartient à un administrateur (utilisateur).
  belongs_to :admin, class_name: 'User'

  # presence obligatoire
  validates :start_date, :duration, :title, :description, :price, :location,
  presence: true

  validates :title, 
  length: { minimum: 5, maximum:  140}
end
