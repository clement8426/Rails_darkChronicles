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
      @sheet.transaction do
        @sheet.advantages.destroy_all

        if sheet_params[:advantages_attributes].present?
          advantages_attributes = sheet_params[:advantages_attributes].values
          @sheet.advantages.create(advantages_attributes)
        end

        @sheet.disadvantages.destroy_all

        if sheet_params[:disadvantages_attributes].present?
          disadvantages_attributes = sheet_params[:disadvantages_attributes].values
          @sheet.disadvantages.create(disadvantages_attributes)
        end

        @sheet.disciplines.destroy_all

        if sheet_params[:disciplines_attributes].present?
          disciplines_attributes = sheet_params[:disciplines_attributes].values
          @sheet.disciplines.create(disciplines_attributes)
        end

        @sheet.backgrounds.destroy_all

        if sheet_params[:backgrounds_attributes].present?
          backgrounds_attributes = sheet_params[:backgrounds_attributes].values
          @sheet.backgrounds.create(backgrounds_attributes)
        end

        @sheet.voie_thaumaturgiques.destroy_all

        if sheet_params[:voie_thaumaturgiques_attributes].present?
          voie_thaumaturgiques_attributes = sheet_params[:voie_thaumaturgiques_attributes].values
          @sheet.voie_thaumaturgiques.create(voie_thaumaturgiques_attributes)
        end

        if @sheet.update(sheet_params.except(:disciplines_attributes, :backgrounds_attributes, :voie_thaumaturgiques_attributes, :advantages_attributes, :disadvantages_attributes))
          format.html { redirect_to @sheet, notice: 'Fiche actualisée avec succès.' }
        else
          format.html { render :edit }
        end
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
