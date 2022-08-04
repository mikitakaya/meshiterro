class ApplicationController < ActionController::Base
  # devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
  # 下に記述したconfigure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 呼び出された他のコントローラからも参照することができる
  protected

  # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
