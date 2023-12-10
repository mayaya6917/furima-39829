class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: "should contain only full-width characters" }
  validates :first_name, presence:true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'should contain only full-width characters' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'should contain only full-width katakana characters' }
  validates :first_name_kana, presence:true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'should contain only full-width katakana characters' }
  validates :birth_date, presence:true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)/, message: 'must include both letters and numbers' }
end

