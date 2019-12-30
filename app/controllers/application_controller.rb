class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    render json: { "message": 'The requested resource was not found' }, status: :not_found
  end
end
