class PostBook < ApplicationRecord

	validates :book_name, length: { minimum: 1 }
	validates :caption, length: { in: 1..200 }
	belongs_to :user
end
