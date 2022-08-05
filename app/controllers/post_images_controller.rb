class PostImagesController < ApplicationController
  def new
  # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを作成する
   @post_image = Post.new
  end

  def index
  end

  def show
  end
end
