class ApplicationController < ActionController::Base

 # 未ログイン状態でトップページ以外の画面にアクセスすると、ログイン画面へリダイレクト
 before_action :authenticate_user!, except: [:top]

 # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
 # 下に記述したconfigure_permitted_parametersメソッドが実行される
 before_action :configure_permitted_parameters, if: :devise_controller?

 # サインイン後にAboutページに遷移する
 def after_sign_in_path_for(resource)
  post_images_path
 end

 # サインアウト後にAboutページに遷移する
 def after_sign_out_path_for(resource)
  about_path
 end

 # 呼び出された他のコントローラからも参照することができる
 protected

 # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可する
 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
 end
end
