class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :find_or_build_user_sheet, only: [:joueur]

  def joueur
    raise
    if @sheet.persisted?
    end
  end

  private

  def find_or_build_user_sheet
    @sheet = Sheet.find_or_initialize_by(user_id: current_user.id)
  end
end
