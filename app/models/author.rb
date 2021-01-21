class Author < ApplicationRecord
    has_many :books
    validates :name, presence: true, uniqueness: true

    def self.search(params)
        where("LOWER(name) LIKE ?", "%#{params}%")
      end
end
