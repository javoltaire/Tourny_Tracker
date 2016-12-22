class TournamentsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = current_user.tournaments.build
  end





  def show
  end

  

  def edit
  end
end
