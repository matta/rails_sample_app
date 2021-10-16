class User < ApplicationRecord
  # Alternatively: https://github.com/K-and-R/email_validator
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            # There is also a considerationn with respect to case
            # sensitivity in the DB:
            # https://stackoverflow.com/questions/7948501/case-insensitive-unique-index-in-rails-activerecord/10660412
            uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  before_validation :downcase_email
  def downcase_email
    self.email = email.downcase if email
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
