class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def current_office
        return nil unless user_signed_in?
        @current_office ||= current_user.office
    end
    helper_method :current_office


    def current_account
        @current_account ||= current_user.account
        @current_account
    end 
    helper_method :current_account

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
            user_params.permit(:email,
            :password,
            :password_confirmations,
            office_attributes: [:id, :name, :subdomain, :_destroy]               
            )
        end 
    end 
end
