# frozen_string_literal: true

class Api::V1::RoomsController < Api::ApplicationController
  include Secured

  def index
    render json: current_user.rooms.order(:name)
  end

  def create
    room = Room.new(name: params[:name], user: current_user)
    if room.save
      render json: room
    else
      render json: { error: 'BadRequest' }
    end
  end

  def show
    room = Room.find(params[:id])
    render json: room
  end

  def destroy
    room = current_user.rooms.find_by(id: params[:id])
    if room&.destroy
      render json: {}
    else
      render json: { error: 'BadRequest' }
    end
  end
end
