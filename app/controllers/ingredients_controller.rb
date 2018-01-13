class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :require_admin_user, only: [:new,:edit,:create,:update,:destroy]

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.paginate(page: params[:page],per_page:3)
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
    @recettes = @ingredient.recettes.paginate(page: params[:page],per_page:3)
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient,  :flash =>{success:"l'ingredient #{@ingredient.name} a été rajouté dans notre site..."} }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient,  :flash =>{success:"l'ingredient #{@ingredient.name} a été mise à jour..."} }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @namei = @ingredient.name
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to ingredients_url,  :flash =>{success:"l'ingredient #{@namei} supprimé définitivement..."} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

    def require_admin_user
      if !logged_in? || (logged_in? && !current_user.admin?)
        flash[:danger] = "Privilèges insuffisants pour effectuer cette action"
        redirect_to ingredients_path
      end
    end
end
