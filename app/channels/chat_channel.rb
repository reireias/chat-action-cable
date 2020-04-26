# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rooms:#{params[:room_id]}:messages"
  end
end
