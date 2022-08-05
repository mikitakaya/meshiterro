class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User モデルに PostImage モデルを関連付ける(1:N)
  # 1:Nの1側(user)が削除されたとき、N側(post_images複数形)を全て削除する
  has_many :post_images, dependent: :destroy
end
