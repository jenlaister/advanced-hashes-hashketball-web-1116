#require pry

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      }, "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      }, "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      }, "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      }, "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    }
  },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => { "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        }, "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
        }, "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      }, "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      }, "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      }
    }
  }
}
end

def num_points_scored(player_name)
  if game_hash[:home][:players].include?(player_name)
    game_hash[:home][:players][player_name][:points]
  elsif game_hash[:away][:players].include?(player_name)
  game_hash[:away][:players][player_name][:points]
  end
end

def shoe_size(player_name)
  if game_hash[:home][:players].include?(player_name)
    game_hash[:home][:players][player_name][:shoe]
  elsif game_hash[:away][:players].include?(player_name)
    game_hash[:away][:players][player_name][:shoe]
  end
end

# Build a method, team_colors, that takes in an argument of the team name and returns an array of that teams colors.

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team_name
    return game_hash[:away][:colors]
  end
end


# Build a method, team_names, that operates on the game hash to return an array of the team names.

def team_names
  game_hash.collect do |home_or_away, teams|
    teams[:team_name]
  end
end

# Build a method, player_numbers, that takes in an argument of a team name and returns an array of the jersey number's for that team.

def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |home_or_away, teams|
    if teams[:team_name] == team
      teams[:players].collect do |player, stat|
        jersey_numbers << stat[:number]
      end
    end
  end
  jersey_numbers
end

# Build a method, player_stats, that takes in an argument of a player's name and returns a hash of that player's stats.

# def player_stats(player_name)
#   player_stats = Hash.new
#   game_hash.each do |home_or_away, teams|
#     teams[:players].each do |player, player_hash|
#       if player == player_name
#         teams[:players].collect do |player, stats|
#           player_stats = stats
#         end
#       end
#     end
#   end
# player_stats
# end

def player_stats(player_name)
  player_stat = Hash.new
  game_hash.each do |home_or_away, teams|
    teams[:players].each do |player, stats|
      if player == player_name
          return stats
      end
    end
  end
end


def big_shoe_rebounds
  big_shoes_guy = 0
  rebounds = 0
    game_hash.each do |home_or_away, teams|
      teams[:players].each do |player, stats|
        if stats[:shoe] > big_shoes_guy
          big_shoes_guy = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
  rebounds
end
