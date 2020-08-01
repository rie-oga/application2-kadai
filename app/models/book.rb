class Book < ApplicationRecord
	belongs_to :user #userモデルとの紐づけ

	validates :title, presence: true #エラーメッセージのため
	validates :body, presence: true

end
