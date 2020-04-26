# frozen_string_literal: true

class RoomsController < ApplicationController
  include Secured

  def show
    @room = Room.find(params[:id])
  end
end
