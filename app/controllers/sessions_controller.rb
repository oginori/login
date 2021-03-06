class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    binding.pry
    if user && user.authenticate(params[:session][:password])
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
end
