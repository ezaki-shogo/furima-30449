class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :birthday, presence: true
  validates :full_first_name :presence true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :full_last_name :presence true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :half_first_name :presence true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :half_last_name :presence true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

end
