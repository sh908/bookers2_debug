class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  # インスタンスメソッド
  # よびだしたのはなに? => @book
  def book_favorited_by?(user)
    # selfはこのmethodをよびだしたもの
    self.favorites.where(user_id: user.id).exists?
    # 呼び出し元にひもづくfavorites
    # のなかでuser_idがcurrent_user.idのもの
    # が存在するかどうか?
    
    # user.books
    # 1 N
    
    # book favorites
    # 1 N
  end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
