class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,:validatable
  
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_books, through: :favorites, source: :book
  has_many :book_comments, dependent: :destroy
  
  attachment :profile_image

  validates :name, presence: true, length: {maximum: 20, minimum: 2, message: "error"} 
  validates :introduction, length: {maximum: 50}

  # def already_favorited?(book)
  #   self.favorites.exists?(book_id: book.id)
  # end
end
