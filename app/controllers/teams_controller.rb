class TeamsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create]
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in, except: [:index]

  def index
    @teams = @user.teams
  end

  def new
    @team = Team.new
  end

  def create
    @team = @user.teams.create team_params
    if @team.save
      redirect_to user_teams_path(@user), flash: {success: "#{@team.name} added!"}
    else
      render :new
    end
  end

  def edit
  end

  def update
    @team.update team_params
    if @team.save
      redirect_to team_path, flash: {success: "#{@team.name} updated!"}
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @team.destroy
    redirect_to user_teams_path(@user), flash: {success: "#{@team.name} was successfully deleted"}
  end

  private

  def set_team
    @team = Team.find_by_id params[:id]
  end

  def set_user
    @user = User.find params[:user_id]
  end

  def team_params
    params.require(:team).permit(
      :name,
      :description
    )
  end

end
