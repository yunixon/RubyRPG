class FrontpageController < ApplicationController
  before_action :authenticate_user!, only: :game

  def index
  end

  def game
  end

  def about
  end
end
