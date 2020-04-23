# frozen_string_literal: true

module Secured
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    redirect_to '/auth/login' if session[:user_id].blank?
  end
end
