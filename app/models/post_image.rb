class PostImage < ApplicationRecord
 has_one_attached :image
# ユーザー（1:Nの1だから単数形）に属する
 belongs_to :user
end
