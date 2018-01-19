module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	identified_by :current_user
  	def connect
  		self.current_user = find_current_user
  	end

  	def disconnect

  	end

  	protected

  	def find_current_user
  		if current_user = Chef.find_by(id: cookies.signed[:chef_id])
  			current_user
  		else
  			reject_unauthorized_connection
  		end
  	end
  end
end
