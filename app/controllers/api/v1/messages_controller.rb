# frozen_string_literal: true

class Api::V1::MessagesController < Api::ApplicationController
  include Secured

  def create
    # TODO: save to db
    ActionCable.server.broadcast "rooms:#{params[:room_id]}:messages", message
    render json: {}
  end

  private

  def message
    {
      text: params[:text],
      user: current_user
    }
  end
end
