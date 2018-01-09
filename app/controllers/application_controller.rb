class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
  	@current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end

  def logged_in? # est ce qu'il y a une cnx en cours
  	!!current_user
  end

  def require_user # Exiger la cnx via un msg flash
  	if !logged_in?
  		flash[:danger] = "Vous devez etre connecté pour effectuer cette opération"
  		redirect_to root_path
  	end
  end



end
