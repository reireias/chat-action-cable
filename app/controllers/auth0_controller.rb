# frozen_string_literal: true

class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    user = User.create_or_find_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = user.id
    cookies.encrypted[:user_id] = user.id

    # Redirect to the URL you want after successful auth
    redirect_to '/'
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end
