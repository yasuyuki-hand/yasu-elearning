module SessionsHelper
    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
      end
    
      # Returns true if the given user is the current user.
      def current_user?(user)
        user == current_user
      end
  
      #current_user?(user1) => true
      
      # Returns the current logged-in user (if any).
      def current_user #after log_in -> current_user
        if session[:user_id]
          @current_user ||= User.find_by(id: session[:user_id])
        end
      end
    
      # Returns true if the user is logged in, false otherwise.
      def logged_in?
        !current_user.nil? #is there No emptiy current_user? Is there a current_user?
      end
    
      # Logs out the current user.
      def log_out
        session.delete(:user_id) #delete memory in browser
        @current_user = nil      # delete you as current_user
      end
    
      # Redirects to stored location (or to the default).
      def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
      end
    
      # Stores the URL trying to be accessed.
      def store_location
        session[:forwarding_url] = request.original_url if request.get?
      end
    
      #Authorization -> Only logged in users can access some pages (example: edit page, log out )
      def only_loggedin_users
        # Goes to login page UNLESS the user is logged in already
        redirect_to login_url unless logged_in?
      end
    
end
