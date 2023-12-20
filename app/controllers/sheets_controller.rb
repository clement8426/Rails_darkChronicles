class SheetsController < ApplicationController
  before_action :authenticate_user!

  def create
    uploaded_file = params[:sheet][:pdf]

    @sheet = Sheet.new(sheet_params)
    @sheet.user = current_user
    @sheet.pdf.attach(uploaded_file)

    respond_to do |format|
      if @sheet.save
        format.html { redirect_to sheets_url }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @sheet = current_user.sheets.find(params[:id])

    respond_to do |format|
      if @sheet.destroy
        format.html { redirect_to sheets_url }
        format.json { head :no_content }
      else
        format.html { redirect_to sheets_url, alert: 'Error destroying the sheet.' }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def sheet_params
    params.require(:sheet).permit(:user_id, :title, :pdf)
  end
end
