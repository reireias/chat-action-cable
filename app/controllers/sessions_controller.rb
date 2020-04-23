# frozen_string_literal: true

class SessionsController < ApplicationController
  include LogoutHelper

  def login
    redirect_to '/' if session[:user_id].present?
  end

  def logout
    reset_session
    redirect_to logout_url.to_s
  end
end
