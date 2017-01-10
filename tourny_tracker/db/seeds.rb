# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeding the Game table
Game.create(name: "Fifa")

# Seeding the Tournament State table
TournamentState.create(state: "Setup")
TournamentState.create(state: "Prelims")
TournamentState.create(state: "Playoffs")
TournamentState.create(state: "Ended")

# Seeding the EliminationType table
EliminationType.create(name: "Single Elimination")
EliminationType.create(name: "Round Robin")

# Seeding the GroupName table
GroupName.create(name: "Group A")
GroupName.create(name: "Group B")
GroupName.create(name: "Group C")
GroupName.create(name: "Group D")
GroupName.create(name: "Group E")
GroupName.create(name: "Group F")
GroupName.create(name: "Group G")
GroupName.create(name: "Group H")
GroupName.create(name: "Group I")
GroupName.create(name: "Group J")
GroupName.create(name: "Group K")
GroupName.create(name: "Group L")
GroupName.create(name: "Group M")
GroupName.create(name: "Group N")
GroupName.create(name: "Group O")
GroupName.create(name: "Group P")
GroupName.create(name: "Group Q")
GroupName.create(name: "Group R")
GroupName.create(name: "Group S")
GroupName.create(name: "Group T")
GroupName.create(name: "Group U")
GroupName.create(name: "Group V")
GroupName.create(name: "Group W")
GroupName.create(name: "Group X")
GroupName.create(name: "Group Y")
GroupName.create(name: "Group Z")
GroupName.create(name: "Teams")

# Seeding Users
User.create(first_name: "Jules", last_name: "Voltaire", email: "jvoltaire@email.com", password: "password")
User.create(first_name: "Hugh", last_name: "Whelan", email: "hwhelan@email.com", password: "password")

#Seeding tournaments
Tournament.create("name"=>"Tournament 1", "use_grouping"=>"0", "grouping_info_attributes"=>{"elimination_type_id"=>"1", "group_count"=>"", "teams_per_group"=>"", "playoffs_advanced"=>""}, "elimination_type_id"=>"1", "team_count"=>"8", "team_size"=>"2", "game_id"=>"1", "created_by" => "1")
Tournament.create("name"=>"Tournament 2", "use_grouping"=>"1", "grouping_info_attributes"=>{"elimination_type_id"=>"2", "group_count"=>"2", "teams_per_group"=>"4", "playoffs_advanced"=>"2"}, "elimination_type_id"=>"1", "team_count"=>"8", "team_size"=>"2", "game_id"=>"1", "created_by" => "1")
Tournament.create("name"=>"Tournament 3", "use_grouping"=>"0", "grouping_info_attributes"=>{"elimination_type_id"=>"1", "group_count"=>"", "teams_per_group"=>"", "playoffs_advanced"=>""}, "elimination_type_id"=>"1", "team_count"=>"10", "team_size"=>"2", "game_id"=>"1", "created_by" => "2")
Tournament.create("name"=>"Tournament 4", "use_grouping"=>"1", "grouping_info_attributes"=>{"elimination_type_id"=>"2", "group_count"=>"6", "teams_per_group"=>"4", "playoffs_advanced"=>"2"}, "elimination_type_id"=>"1", "team_count"=>"8", "team_size"=>"2", "game_id"=>"1", "created_by" => "2")

Team.create(name: "Team 1", group_id: "1")
Team.create(name: "Team 2", group_id: "1")
Team.create(name: "Team 3", group_id: "1")
Team.create(name: "Team 4", group_id: "1")
Team.create(name: "Team 5", group_id: "1")
Team.create(name: "Team 6", group_id: "1")
Team.create(name: "Team 7", group_id: "1")
Team.create(name: "Team 8", group_id: "1")
Team.create(name: "Team 9", group_id: "2")
Team.create(name: "Team 10", group_id: "2")
Team.create(name: "Team 11", group_id: "2")
Team.create(name: "Team 12", group_id: "2")
Team.create(name: "Team 13", group_id: "3")
Team.create(name: "Team 14", group_id: "3")
Team.create(name: "Team 15", group_id: "3")
Team.create(name: "Team 16", group_id: "3")