class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate
  include Pundit

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    render json: { "message": 'The requested resource was not found' }, status: :not_found
  end

  rescue_from Pundit::NotAuthorizedError do |_exception|
    render json: { "message": 'Not authorized for the requested resource' }, status: :forbidden
  end
end
