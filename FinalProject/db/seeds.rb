User.create!(name:  "Nathan Carter",
             email: "nc8510@icloud.com",
             password:              "nathan",
             password_confirmation: "nathan")

Pick.create!(	round: "1",
  							pick: "1", 
			  				user: "Nathan Carter", 
			  				team: "Team 1", 
			  				player: Faker::Name.name)

for n in 2..73
	pick = Pick.last

  round = (pick.pick.to_i/5).floor + 1
  pickNumber = pick.pick.to_i + 1
  teamNumber = (pickNumber % 5)
  if teamNumber == 0
  	teamNumber = 5
  end
  if(round % 2 == 0)
  	teamNumber = 6 - teamNumber
  end
  userName = Faker::Name.name
  team = "Team #{teamNumber}"
  player  = Faker::Name.name
  
  Pick.create!(	round: round,
  							pick: pickNumber, 
			  				user: userName, 
			  				team: team, 
			  				player: player)
end