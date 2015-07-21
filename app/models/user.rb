class User < ActiveRecord::Base
  has_many :teams, dependent: :destroy

  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}, presence: true
  validates :email, presence: true

    def generate_password_reset_token!
    update(password_reset_token: SecureRandom.urlsafe_base64(48))
    end

end
