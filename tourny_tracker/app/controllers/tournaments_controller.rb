class TournamentsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @tournaments = Tournament.all
  end










  def new
    @tournament = Tournament.new
    @tournament.users << current_user
  end

  def create
    @tournament = current_user.tournaments.build(tournament_params)
    # @tournament = Tournament.new(tournament_params)
    if(@tournament.save)
      redirect_to root_path
    # else
    #   redirect_to new_tournament_path
    end
  end








  def show
  end





  

  

  def edit
  end

  private

    def tournament_params
      params.require(:tournament).permit(:name, :team_count, :group_count, :max_teammates, :description)
    end
end
