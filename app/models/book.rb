class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  #accepts_nested_attributes_for :author

  validates :title, presence: true
  validate :not_a_repeat

  def self.alpha
    order(:title)
  end

  def author_attributes=(attributes)
    self.author = Author.find_or_create_by(attributes) if !attributes['name'].empty?
    self.author
  end

  def not_a_repeat
    book = Book.find_by(title: title, author_id: author_id)
    if !!book && book != self
      errors.add(:title, 'already exists for that author')
    end
  end

  def author_name
    author.try(:name)
  end

  def title_and_author
    "#{title} - #{author.try(:name)}" 
  end

  def self.search(params)
    where("LOWER(title) LIKE ?", "%#{params}%")
  end
  
end