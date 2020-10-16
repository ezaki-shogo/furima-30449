class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :full_first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :full_last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :half_first_name, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :half_last_name, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :nickname
    validates :birthday
  end
  validates :password, confirmation: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
