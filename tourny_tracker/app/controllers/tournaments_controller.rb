class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
