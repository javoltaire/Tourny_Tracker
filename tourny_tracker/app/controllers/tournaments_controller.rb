class TournamentsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]












  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = find_tournament
    if(@tournament.nil?)
      redirect_to tournaments_path
    end
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

  def edit
    @tournament = find_tournament
    if(@tournament.nil?)
      redirect_to tournaments_path
    end
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
      begin
        @tournament = Tournament.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @tournament = nil
      end
    end

    def tournament_params
      params.require(:tournament).permit(:name, :team_count, :group_count, :max_teammates, :game_type_id,)
    end
end
