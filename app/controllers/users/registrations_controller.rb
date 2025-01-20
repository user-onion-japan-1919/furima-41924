class Users::RegistrationsController < Devise::RegistrationsController
  # Deviseが提供するアクションを必要に応じてオーバーライドできます

  # サインアップ後のリダイレクト先を変更したい場合
  protected

  def after_sign_up_path_for(resource)
    root_path # サインアップ後にリダイレクトするパスを指定
  end

  # 必要に応じてストロングパラメータを追加
  private

  def sign_up_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_furigana, :first_name_furigana, :date_of_birth) # 追加の属性を許可
  end
end
