class User < ActiveRecord::Base
  has_many :teams, dependent: :destroy

  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}, presence: true
  validates :avatar_url, presence: true

end
