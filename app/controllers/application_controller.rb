class ApplicationController < ActionController::Base
  before_action :basic_auth, except: [:new, :update] # 新規登録とログインを除外

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'user' && password == 'user'
    end
  end
end
