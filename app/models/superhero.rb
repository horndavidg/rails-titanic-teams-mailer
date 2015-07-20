class Superhero < ActiveRecord::Base
  validates :name, :height, :bio, :image_url, presence: true
	has_many :affiliations, dependent: :destroy
	has_many :teams, through: :affiliations
end
