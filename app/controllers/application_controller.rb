class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :nullify_params
  before_action :authenticate
  after_action :save_change

  private

  def nullify_params
    NullifyParams.nullify!(params)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate
    redirect_to(login_path) unless current_user
  end

  def save_change
    if [:update, :create, :destroy].include?(action_name.to_sym) && current_user && response.redirect?
      attributes = instance_variable_get("@#{controller_name.singularize}").try(:attributes)
      Change.create!(
        user: current_user,
        controller: controller_name,
        action: action_name,
        params: params.except('password', 'password_confirmation'),
        model_attributes: attributes)
    end
  end
end
