class SheetsController < ApplicationController
  def create
    # Other code for handling form submission...

    # Assuming the PDF file is part of the form parameters (e.g., params[:sheet][:pdf])
    uploaded_file = params[:sheet][:pdf]

    # Upload the PDF to Cloudinary
    cloudinary_response = Cloudinary::Uploader.upload(uploaded_file.tempfile.path)


    @sheet = Sheet.new(sheet_params)
    @sheet.user = current_user
    @sheet.save!

  end

  private

  def sheet_params
    params.require(:sheet).permit(:user_id, :title, :pdf)
  end
end
