class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User モデルに PostImage モデルを関連付ける(1:N)
  # 1:Nの1側(user)が削除されたとき、N側(post_images複数形)を全て削除する
  has_many :post_images, dependent: :destroy

  # profile_imageという名前でActiveStorageでプロフィール画像を保存できるように設定
  has_one_attached :profile_image

  def get_profile_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
   profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
