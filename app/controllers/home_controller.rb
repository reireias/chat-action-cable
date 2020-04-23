# frozen_string_literal: true

class HomeController < ApplicationController
  include Secured

  def show
    pp current_user
  end
end
