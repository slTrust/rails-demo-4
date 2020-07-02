class ApplicationController < ActionController::API
  def render_resources resource
    if resource.errors.empty?
      render json: { resources: resource }, status: 200
    else
      render json: { errors: resource.errors }, status: 400
    end
  end
end
