# frozen_string_literal: true

class Api::V1::UsersController < Api::ApplicationController
  include Secured

  def me
    render json: current_user
  end
end
