class PostImagesController < ApplicationController
 def new
 # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを作成する
  @post_image = PostImage.new
 end

 # 投稿データの保存
 def create
  # フォームに入力されたデータを、@post_imageに格納する
  @post_image = PostImage.new(post_image_params)
  # PostImageモデルに紐づいたuser_idの値を操作し、ログイン中のユーザーidを取得する
  @post_image.user_id = current_user.id
  @post_image.save
  # index（投稿一覧画面）にリダイレクト
  redirect_to post_images_path
 end

 def index
  @post_images = PostImage.all
 end

 def show
  @post_image = PostImage.find(params[:id])
 end

 def destroy
 end

 # 投稿データのストロングパラメータ
 private

# フォームで入力されたデータが、投稿データとして許可されているパラメータかチェック
 def post_image_params
  params.require(:post_image).permit(:shop_name, :image, :caption)
 end

end
