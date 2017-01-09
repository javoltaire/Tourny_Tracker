class TeammatesController < ApplicationController
  before_action :authenticate_user!
  def new
    @tournament = Tournament.find(params[:tournament_id])
    @teammate = Teammate.new
  end

  def create
    @tournament = find_tournament
    @teammate = current_user.teammates.build(teammate_params)
    @teammate.tournament = @tournament
    if(@teammate.save)
      redirect_to team_path(@teammate.team)
    else
      respond_to do |format|
        format.json { render json: @teammate.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
    def teammate_params
      params.require(:teammate).permit(:team_id)
    end

    def find_tournament
      Tournament.find(params[:tournament_id])
    end
end
