class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  # has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "should contain only full-width characters" }
  validates :first_name, presence:true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'should contain only full-width characters' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'should contain only full-width katakana characters' }
  validates :first_name_kana, presence:true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'should contain only full-width katakana characters' }
  validates :birth_date, presence:true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'must include both letters and numbers' }
end

