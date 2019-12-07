class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #yamashita :omniauthableと:omniauth_providers追加
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :items
  has_many :likes
  has_one :address
  has_many :item_comments
  has_many :trading_comments
  has_one :card
  
  #mishima ユーザー新規登録 カラムにvalidationを追加
  validates :nickname, presence: true
  validates :email, presence: true,uniqueness: true
  validates :password, presence: true,length: {minimum:7},confirmation: true
  validates :password_confirmation, presence: true,length: {minimum:7}
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :birthday, presence: true
  validates :phone_number, presence: true,uniqueness: true

  validates :nickname, presence: true, length: { maximum: 6 }

  #yamashita sns認証
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        nickname: auth.info.nickname,
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20],
        first_name: '',
        last_name: ''
      )
    end
    user
  end  
end
