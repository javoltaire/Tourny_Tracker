class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

      def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
      end

  private
    # Method to be used in case a record record is not Found
    def record_not_found
      render html: "<strong>Not Found</strong>".html_safe
    end
end
