class SessionsController < BaseController
  skip_before_action :require_login

  def new
    redirect_to(redirect_path) && return if logged_in? && redirect_path.present?
  end

  def create
    user = login(params[:email], params[:password], params[:remember])

    unless user
      flash[:alert] = 'Login failed. Please try again.'
      redirect_to login_path(email: params[:email], return_to: params[:return_to])
      return
    end

    session[:user_id] = user.id

    redirect_to(redirect_path) && return if redirect_path.present?
  end

  def destroy
    logout
    session.delete(:user_id)
    redirect_to login_path
  end
end
