module PicksHelper
	def nextPick(pick)
		pick = pick.to_i + 1
	end

	def nextRound(lastPick)
		lastPick = (lastPick.to_i/5).floor + 1
	end

	def nextTeam(round, pick)
		
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
