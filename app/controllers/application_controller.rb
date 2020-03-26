class ApplicationController < ActionController::Base
	# before_actionはすべてのコントローラのアクションが実行する際に最初に行われる
	# デバイスのコントローラー用
	before_action :configure_permitted_parameters, if: :devise_controller?
    # authenticate_user！でログイン認証されてない場合home画面へリダイレクトとする
	before_action :authenticate_user!,except: [:top, :about]
	# カレントユーザーだけしかedit,update,destroyアクションは使えない。
	before_action :ensure_correct_user, {only: [:edit, :update]}

	# ログイン後にマイページに飛ぶ
	def after_sign_in_path_for(resource)
   		user_url(resource)
 	end
	# 名前ログインのために必要な記述
	protected
	# ログイン時のパラメーターを設定する
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	end
	# データ更新時のパラメーターを設定する
	def configure_account_update_params
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
    end
end
