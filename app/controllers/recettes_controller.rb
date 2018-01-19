class RecettesController < ApplicationController
  before_action :set_recette, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index,:show]
  before_action :require_same_user, only: [:edit,:update,:destroy]
  # GET /recettes
  # GET /recettes.json
  def index
    @recettes = Recette.paginate(page: params[:page],per_page:3)
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /recettes/1
  # GET /recettes/1.json
  def show
    @commentaire = Commentaire.new
    @commentaires = @recette.commentaires.paginate(page:params[:page],per_page:3)
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /recettes/new
  def new
    @recette = Recette.new
  end

  # GET /recettes/1/edit
  def edit
  end

  # POST /recettes
  # POST /recettes.json
  def create
    @recette = Recette.new(recette_params)
    @recette.chef = current_user
    respond_to do |format|
      if @recette.save
        format.html { redirect_to @recette, :flash =>{success:"La récette a été bien enregistrée"} }
        format.json { render :show, status: :created, location: @recette }
      else
        format.html { render :new }
        format.json { render json: @recette.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recettes/1
  # PATCH/PUT /recettes/1.json
  def update
    respond_to do |format|
      if @recette.update(recette_params)
        format.html { redirect_to @recette, :flash =>{success:"La récette a été bien enregistrée"} }
        format.json { render :show, status: :ok, location: @recette }
      else
        format.html { render :edit }
        format.json { render json: @recette.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recettes/1
  # DELETE /recettes/1.json
  def destroy
    @recette.destroy
    respond_to do |format|
      format.html { redirect_to recettes_url,:flash =>{success:"La récette a été supprimée"}  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recette
      @recette = Recette.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recette_params
      params.require(:recette).permit(:name, :description,ingredient_ids:[])
    end

    def require_same_user
      if (!logged_in?) || (logged_in? && current_user != @recette.chef) || (!current_user.admin? if current_user) # AUTHENTIFIER + != USER DE LA RESS + != USER.ADMIN? 
        flash[:danger] = "Vous ne pouvez agir sur d'autres recettes en dehors des votres "
        redirect_to chefs_path
      end
    end
end
