class ApplicationController < ActionController::Base
	# before_actionはすべてのコントローラ実行する際に最初に行われる
	# デバイスのコントローラー用
	before_action :configure_permitted_parameters, if: :devise_controller?
	# ログインされていなければ、ログイン画面へリダイレクトする
	before_action :authenticate_user!
	# サインアップ時にメルアドとパスワード以外をストロングパラメータに追加したい場合
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
	end
end
