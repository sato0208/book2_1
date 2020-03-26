class Book < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :post_comments,dependent: :destroy

	 validates :title, presence: true
	 validates :body, presence: true
end
