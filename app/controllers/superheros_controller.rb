class SuperherosController < ApplicationController
  before_action :confirm_logged_in
	# before_action :confirm_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :confirm_admin, except: [:index, :show]
	before_action :set_superhero, only: [:show, :edit, :update, :destroy]
	before_action :set_team, only: [:show]

  def index
    @superheros = Superhero.all
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.create superhero_params
    if @superhero.save
      redirect_to superheros_path, flash: {success: "#{@superhero.name} added!"}
    else
      render :new
    end
  end

  def edit
  end

  def show
    @teams = Team.all
  end

  def update
    @superhero.update superhero_params
    if @superhero.save
      redirect_to superhero_path(@superhero), flash: {success: "You updated #{@superhero.name}"}
    else
      render :edit
    end
 end

  def destroy
    @superhero.destroy
    redirect_to superheros_path, alert: "#{@superhero.name} deleted"
 end

  def superhero_params
    params.require(:superhero).permit(
      :name,
      :height,
      :bio,
      :image_url,
      :team_ids => []
    )
  end

  def set_team
    @team = Team.find_by_id params[:id]
  end

  def set_superhero
    @superhero = Superhero.find_by_id params[:id]
  end
end
