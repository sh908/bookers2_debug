class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  # インスタンスメソッド
  # よびだしたのはなに? => @book
  def book_favorited_by?(user)
    # selfはこのmethodをよびだしたもの
    self.favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', '#{content%}')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%{content}')
    else
      Book.where('title LIKE ?', '%#{content}%' )
    end
  end
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
