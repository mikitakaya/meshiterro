class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   # 個人が投稿したもの全てを表示する
   @post_images = @user.post_images
  end

  def edit
  end
end
