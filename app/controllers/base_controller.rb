class BaseController < ApplicationController
  # skip_before_action :set_whois
  # before_action :set_locale
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path(return_to: request.fullpath)
  end

  def redirect_path
    return nil unless logged_in?

    return params[:return_to] if params[:return_to].present?

    nil
  end

  # def oauth_applications(user)
  #   Doorkeeper::Application.authorized_for(user)
  # end
end
