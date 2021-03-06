class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_books, through: :reviews, source: :book

    has_many :books

    validates :username, uniqueness: true, presence: true
    validates :email, presence: true

    has_secure_password

    def self.create_with_google(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
    end
  end

  def self.create_with_github(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
        u.password = SecureRandom.hex
  end
end

end
