class MeController < BaseController
  def show
    render json: current_user.as_json(only: [:id, :email])
  end

  def current_user
    @current_user ||= User.find_by(id: doorkeeper_token&.resource_owner_id) #|| User.find_by(id: TokenProvider.valid?(token)&.dig(0, 'user_id'))
  end

  # def token
  #   request.headers['Authorization'].split(' ').last
  # end
end