class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attachment :profile_image

  has_many :post_books

  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  validates :name, presence: true

end
