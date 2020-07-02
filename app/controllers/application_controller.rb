class ApplicationController < ActionController::API
  def current_user
    @current_user ||= User.find_by_id session[:current_user_id]
  end

  def render_resources resource
    return head 404 if resource.nil?
    if resource.errors.empty?
      render json: { resources: resource }, status: 200
    else
      render json: { errors: resource.errors }, status: 400
    end
  end
end
