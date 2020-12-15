class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :author

  validates :title, presence: true
  validate :not_a_repeat

  def not_a_repeat
    book = Book.find_by(title: title, author_id: author_id)
    if !!book && book != self
      errors.add(:title, 'already exists for that author')
    end
  end

end
