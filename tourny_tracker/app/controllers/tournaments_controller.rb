class TournamentsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = find_tournament
  end

  def new
    @tournament = Tournament.new
    @tournament.creator = current_user
    @tournament.build_grouping_info
  end 

  def create
    # Build the tournament object using the parameters passed in
    @tournament = Tournament.new(tournament_params)
    # Set the creator of the tournament
    @tournament.creator = current_user
    # Handle the different response types
    if @tournament.save
      redirect_to tournament_path(@tournament)
    else
      respond_to do |format|
        format.json { render json: @tournament.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @tournament = find_tournament
  end

  def update
    @tournament = find_tournament
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to tournament_path(@tournament) }
      else
        format.json { render json: @tournament.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy

  end

  private
    def find_tournament
      @tournament = Tournament.find(params[:id])
    end

    def tournament_params
      params.require(:tournament).permit(:name, :team_count, :use_grouping, :elimination_type_id, :team_size, :game_id, :tournament_state, grouping_info_attributes: [:elimination_type_id, :group_count, :teams_per_group, :playoffs_advanced])
    end
end
