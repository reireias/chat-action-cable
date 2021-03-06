# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end
end
