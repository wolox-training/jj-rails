class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate
  include Pundit

  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    render json: { "message": 'The requested resource was not found' }, status: :not_found
  end

  rescue_from Pundit::NotAuthorizedError do |_exception|
    render json: { "message": 'Not authorized for the requested resource' }, status: :forbidden
  end

  rescue_from ActionController::ParameterMissing do |_exception|
    render json: { "message": 'Missing params' }, status: :unprocessable_entity
  end

  private

  def set_locale
    I18n.locale = current_user&.locale || I18n.default_locale
  end
end
