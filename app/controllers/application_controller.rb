class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Wor::Paginate

  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    render json: { "message": 'The requested resource was not found' }, status: :not_found
  end

  private

  def set_locale
    I18n.locale = current_user&.locale || I18n.default_locale
  end
end
