class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user #CREE VARIABLE
  	@current_chef ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end

  def logged_in? # VERIF VAR CREE
  	!!current_user
  end

  def require_user # ACTION SI VAR NOK => msg + redirection
  	if !logged_in?
  		flash[:danger] = "Vous devez etre connecté pour effectuer cette opération"
  		redirect_to root_path
  	end
  end



end
