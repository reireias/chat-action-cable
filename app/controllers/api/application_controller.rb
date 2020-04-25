# frozen_string_literal: true

class Api::ApplicationController < ActionController::API
  skip_before_action :verify_authenticity_token, raise: false

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end
end
