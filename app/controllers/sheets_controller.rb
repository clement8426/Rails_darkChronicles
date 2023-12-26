class SheetsController < ApplicationController
  before_action :authenticate_user!

  # def create
  #   uploaded_file = params[:sheet][:pdf]

  #   @sheet = Sheet.new(sheet_params)
  #   @sheet.user = current_user
  #   @sheet.pdf.attach(uploaded_file)

  #   respond_to do |format|
  #     if @sheet.save
  #       format.html { redirect_to sheets_url }
  #       format.json { head :no_content }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @sheet.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  # def destroy
  #   @sheet = current_user.sheets.find(params[:id])

  #   respond_to do |format|
  #     if @sheet.destroy
  #       format.html { redirect_to sheets_url }
  #       format.json { head :no_content }
  #     else
  #       format.html { redirect_to sheets_url, alert: 'Error destroying the sheet.' }
  #       format.json { render json: @sheet.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  def new
    @sheet = Sheet.new
  end

  def create
    @sheet = current_user.sheets.build(sheet_params)

    if @sheet.save
      redirect_to @sheet, notice: 'Fiche créée avec succès.'
    else
      render :new
    end
  end

  def show
    @sheet = Sheet.find(params[:id])
  end

  private

  def sheet_params
    params.require(:sheet).permit(
      :title, :pdf, :Nom, :Nature, :Clan, :Joueur, :Attitude,
      :Génération, :Chronique, :Concept, :Refuge, :Force, :Dextérité, :Vigueur,
      :Charisme, :Manipulation, :Apparence, :Perception, :Intelligence, :Astuce,
      # Add more attributes as needed
    )
  end
  # private

  # def sheet_params
  #   params.require(:sheet).permit(:user_id, :title, :pdf)
  # end
end
