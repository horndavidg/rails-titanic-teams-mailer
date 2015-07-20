class Team < ActiveRecord::Base
  belongs_to :user
  has_many :affiliations, dependent: :destroy
  has_many :superheros, through: :affiliations

  validates :name, :description, presence: true
end
