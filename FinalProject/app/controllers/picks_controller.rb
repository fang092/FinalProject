class PicksController < ApplicationController
  def new
  	if !logged_in?
      flash[:danger] = "You must be logged in to access this page."
      redirect_to login_path
    else
      @pick = Pick.new()
      @lastPick = Pick.last()
    end
  end

  def create
    @user = Pick.create(pick_params)
    redirect_to roster_path
  end

  def roster
    @picks = Pick.all()
  end

  private 

  def pick_params
      params.require(:pick).permit(:round, :pick, :user, :team, :player)
  end
  
end
