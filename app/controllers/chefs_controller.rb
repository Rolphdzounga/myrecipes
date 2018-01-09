class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit,:update,:destroy]

  # GET /chefs
  # GET /chefs.json
  def index
    @chefs = Chef.paginate(page: params[:page],per_page:3)
  end

  # GET /chefs/1
  # GET /chefs/1.json
  def show
    @recettes = @chef.recettes.paginate(page: params[:page],per_page:3)
  end

  # GET /chefs/new
  def new
    @chef = Chef.new
  end

  # GET /chefs/1/edit
  def edit
  end

  # POST /chefs
  # POST /chefs.json
  def create
    @chef = Chef.new(chef_params)

    respond_to do |format|
      if @chef.save
        session[:chef_id] = @chef.id
        format.html { redirect_to @chef, :flash =>{success:"Bienvenue #{@chef.chefname} sur Myrecipes App!"}}
        format.json { render :show, status: :created, location: @chef }
      else
        format.html { render :new }
        format.json { render json: @chef.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chefs/1
  # PATCH/PUT /chefs/1.json
  def update
    respond_to do |format|
      if @chef.update(chef_params)
        format.html { redirect_to @chef, :flash =>{success:"Le compte a été mis à jour avec succès"} }
        format.json { render :show, status: :ok, location: @chef }
      else
        format.html { render :edit }
        format.json { render json: @chef.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chefs/1
  # DELETE /chefs/1.json
  def destroy
    if !@chef.admin?
        @chef.destroy
        respond_to do |format|
          format.html { redirect_to chefs_url,:flash =>{success:"Le compte a été supprimé avec succès"}}
          format.json { head :no_content }
        end
   end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chef
      @chef = Chef.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chef_params
      params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
    end

    def require_same_user
      if logged_in? && current_user != @chef && !current_user.admin?
        flash[:danger] = "Vous ne pouvez modifier d'autres profiles en dehors du votre"
        redirect_to root_path
      end
    end
end
