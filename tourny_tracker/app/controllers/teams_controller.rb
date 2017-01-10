class TeamsController < ApplicationController
  before_action :authenticate_user!, except: [:show ]

  def show
    @team = Team.find(params[:id])
  end

  def new
    @tournament = find_tournament
    @team = Team.new
  end

  def create
    @tournament = find_tournament
    @team = Team.new(team_params)
    @team.teammates.build(user_id: current_user.id, tournament_id: @tournament.id)
    if(@team.save)
      redirect_to @team.group.tournament
    else
      respond_to do |format|
        format.json { render json: @team.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def team_params
      params.require(:team).permit(:name, :group_id)
    end

    def find_tournament
      Tournament.find(params[:tournament_id])
    end
end
