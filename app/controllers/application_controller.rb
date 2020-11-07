class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def current_office
        return nil unless user_signed_in?
        @current_office ||= current_user.office
    end
    helper_method :current_office

   
    devise_group :client, contains: [:user, :citizen]
    
    alias_method :devise_current_user, :current_office
    
    def current_office
    devise_current_user || current_citizen
    end


    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
    private
  
    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
  


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
