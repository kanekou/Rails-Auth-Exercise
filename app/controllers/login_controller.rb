class LoginController < ApplicationController
  def login
    login_user = User.find_by(name: params[:name], password: params[:password])
    if !login_user.nil?
      render plain: login_user.token, status: 200
    else
      render plain: 'no auth', status: 403
    end
  end
end
