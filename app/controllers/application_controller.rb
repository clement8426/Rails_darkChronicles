class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :find_or_build_user_sheet, only: [:joueur]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def joueur
    @sheets = current_user.sheets
    @sheet = Sheet.new
    if @sheet.persisted?
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account_type, :description, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:account_type, :description, :name])
  end

  private

  def find_or_build_user_sheet
    @sheet = Sheet.find_or_initialize_by(user_id: current_user.id)
  end


end
