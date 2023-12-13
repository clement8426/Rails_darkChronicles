class SheetsController < ApplicationController
  def create
    uploaded_file = params[:sheet][:pdf]

    @sheet = Sheet.new(sheet_params)
    @sheet.user = current_user
    @sheet.pdf.attach(uploaded_file)  # Remove the 'service: :amazon' argument

    if @sheet.save
      redirect_to @sheet, notice: 'Sheet was successfully created.'
    else
      render :new
    end
  end
  def show
    @sheet = Sheet.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sheet }
    end
  end

  private

  def sheet_params
    params.require(:sheet).permit(:user_id, :title, :pdf)
  end
end
