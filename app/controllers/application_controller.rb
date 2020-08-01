class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller? #deviseの機能（ユーザ登録、ログイン認証など）が使われる場合、その前に実行される。nameのデータ操作を許可するアクションメソッド。nameを足したため記述
  	protected #Strong Parametersと同様の機能。privateは、自分のコントローラ内でしか参照できないが、protectedは呼び出された他のコントローラからも参照できる。
  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	end







end
