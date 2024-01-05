class SheetsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @sheet = current_user.sheets.find(params[:id])

    respond_to do |format|
      if @sheet.destroy
        format.html { redirect_to sheets_url, notice: 'Feuille supprimé avec succès.' }
        format.json { head :no_content }
      else
        format.html { redirect_to sheets_url, alert: 'Error destroying the sheet.' }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @sheet = Sheet.new
  end

  def create

    @sheet = current_user.sheets.build(sheet_params)
    capitalize_string_attributes

    if @sheet.save
      redirect_to @sheet, notice: 'Fiche créée avec succès.'
    else
      render :new
    end
  end

  def show
    @sheet = Sheet.find(params[:id])
  end

  def edit
    @sheet = current_user.sheets.find(params[:id])
  end

  def update
    @sheet = current_user.sheets.find(params[:id])

    capitalize_string_attributes

    respond_to do |format|
      if @sheet.update(sheet_params)
        format.html { redirect_to @sheet, notice: 'Fiche mise à jour avec succès.' }
        format.json { render :show, status: :ok, location: @sheet }
      else
        format.html { render :edit }
        format.json { render json: @sheet.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def sheet_params
    params.require(:sheet).permit(
      :title, :pdf, :Nom, :Nature, :Clan, :Joueur, :Attitude,
      :Génération, :Chronique, :Concept, :Refuge, :Force, :Dextérité, :Vigueur,
      :Charisme, :Manipulation, :Apparence, :Perception, :Intelligence, :Astuce,
      :Expression, :Vigilances, :Athlétisme, :Bagarre, :Esquive, :Empathie,
      :Intimidation, :Passe, :Commandement, :Subterfuge, :Animaux, :Archerie,
      :Artisanats, :Equitation, :Etiquette, :Furtivité, :Commerce, :Mêlée,
      :Représentation, :Survie, :Erudition, :Investigation, :Droit, :Linguistique,
      :Médecine, :Occulte, :Sagesse, :Politique, :Sénéchal, :Théologie, :Volonté,
      :Consciences, :Maitrise, :Courage,
      path_attributes: [:name, :value],
      disciplines_attributes: [:name, :value],
      advantages_attributes: [:name, :value, :description],
      disadvantages_attributes: [:name, :value, :description],
      backgrounds_attributes: [:name, :value],
      voie_thaumaturgiques_attributes: [:name, :value]
    )
  end


  def capitalize_string_attributes
    @sheet.attributes.each do |attr, value|
      @sheet[attr].capitalize! if value.is_a?(String) && !value.empty?
    end
  end

end
