# Write your code below game_hash
require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end


# Helper Methods
def all_player_info
  game_hash[:home][:players] + (game_hash[:away][:players])
end

def all_team_info(team)
  case team
  when game_hash[:home][:team_name]
    game_hash[:home]
  when game_hash[:away][:team_name]
    game_hash[:away]
  end
end
# Main Methods
def num_points_scored (player)
  points_scored = 0
  
  all_player_info.each do |item|
    item.each do |key, value|
      if value == player
        points_scored = item.dig(:points)
      end
    end
  end
  points_scored
end

def shoe_size(player)
  size = 0
  
  all_player_info.each do |item|
    item.each do |key, value|
      if value == player
        size = item.dig(:shoe)
      end
    end
  end
  size
end

def team_colors(teams_name)
  
  color_array = all_team_info(teams_name)[:colors]
  color_array
end

def team_names
  names = []
  
  names << game_hash.dig(:home, :team_name)
  names << game_hash.dig(:away, :team_name)
  names
end

def player_numbers(teams_name)
  jersey_numbers = []
  
  all_team_info(teams_name)[:players].each do |item|
    item.each do |key, value|
      if key == :number
        jersey_numbers << value
      end
    end
  end
  jersey_numbers
end

def player_stats(player)

  all_player_info.each do |item|
    item.each do |key, value|
      if value == player
        return item
      end
    end
  end

end

def big_shoe_rebounds
  max_shoe_size = 0
  player_rebound = 0
  
  all_player_info.each do |item|
    item.each do |key, value|
      if key == :shoe && max_shoe_size < value
        max_shoe_size = value
        player_rebound = item[:rebounds]
      end
    end
  end
  player_rebound
end