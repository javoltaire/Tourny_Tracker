class TournamentsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = current_user.tournaments.new
    @tournament.users << current_user
  end

  def create
    @tournament = current_user.tournaments.create(tournament_params)
    @tournament.users << current_user
    respond_to do |format|
      if @tournament.save
        format.html
        format.js
      else
        format.json { render json: @tournament.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end








  def show
  end





  

  

  def edit
  end

  private

    def tournament_params
      params.require(:tournament).permit(:name, :team_count, :group_count, :max_teammates, :game_type_id,)
    end
end
