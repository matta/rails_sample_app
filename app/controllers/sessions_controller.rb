class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      if user.activated?
        # Log the user in and redirect to the forwarding URL or the user's
        # show page.
        forwarding_url = session[:forwarding_url]
        reset_session
        if params[:session][:remember_me] == '1'
          remember user
        else
          forget user
        end
        log_in user
        redirect_to forwarding_url || user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
