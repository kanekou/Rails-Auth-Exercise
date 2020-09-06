class LoginController < ApplicationController
  def login
    user = User.find_by(name: params[:name])
    if user.authenticate(params[:password])
      render plain: user.token, status: 200
    else
      render plain: 'no auth', status: 403
    end
  end
end
