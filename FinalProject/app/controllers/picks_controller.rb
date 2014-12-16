class PicksController < ApplicationController
  def new
  	if !logged_in?
      flash[:danger] = "You must be logged in to access this page."
      redirect_to login_path
    else
      @pick = Pick.new()
      lastPick = Pick.last()
      if lastPick == nil
      	@pick.round = 1
      	@pick.pick = 1
      	@pick.user = current_user.name
      	@pick.team = "Team 1"
      else
      	@pick.round = nextRound(lastPick.pick)
      	@pick.pick = nextPick(lastPick.pick)
      	@pick.user = current_user.name
      	@pick.team = nextTeam(lastPick.round, lastPick.pick)
      end
      
    end
  end

  def create
    @pick = Pick.create(pick_params)
    redirect_to roster_path
  end

  def roster
  	if !logged_in?
      flash[:danger] = "You must be logged in to access this page."
      redirect_to login_path
    else
    	@picks = Pick.all()
    end
  end

  private 

  def pick_params
      params.require(:pick).permit(:round, :pick, :user, :team, :player)
  end

  def nextPick(pick)
		pick = pick.to_i + 1
	end

	def nextRound(lastPick)
		lastPick = (lastPick.to_i/5).floor + 1
	end

	def nextTeam(round, pick)
		
		if pick % 5 == 0
			round = round + 1
		end

		teamNumber = ((pick.to_i + 1) % 5)
			
			if teamNumber == 0
				teamNumber = 5
			end
			if(round.to_i % 2 == 0)
				teamNumber = 6 - teamNumber
			end
			return "Team #{teamNumber}"
	end

end
