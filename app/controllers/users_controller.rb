class UsersController < ApplicationController
  def edit
    @user = current_user # 現在のユーザーを取得してインスタンス変数に設定
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice: 'プロフィールが更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :last_name, :first_name, :last_name_furigana, :first_name_furigana, :date_of_birth) # 必要なパラメータを全て許可
  end
end
