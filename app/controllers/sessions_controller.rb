class SessionsController < ApplicationController
  # before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /sessions/new
  def new
    @chef = Chef.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    chef = Chef.find_by email: params[:session][:email].downcase
    if chef && chef.authenticate(params[:session][:password])
      session[:chef_id] = chef.id 
      cookies.signed[:chef_id] = chef.id 
      flash[:success] = "Bienvenue sur Cuisine du Gabon App!"
      redirect_to(chef_path chef)
    else
      flash.now[:danger] = "Le user ou le mot de passe est incorrecte..."

      render :new
    end
  end


  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    session[:chef_id] = nil
    flash[:success] = "Vous etes à présent déconnecté"
    redirect_to root_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:email, :password) # PARAMS = HASH - :SESSION = ELM HASH DE PARAMS
    end
end
