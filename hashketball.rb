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

# Write code here

def num_points_scored(player_name)
  points = 0 
  game_hash.each do |home, hash|
    hash[:players].each do |value|
      if value[:player_name] == player_name
        points = value[:points]
      end
    end
  end
  points
end

def shoe_size(player_name)
  shoe = 0 
  game_hash.each do |home, hash|
    hash[:players].each do |value|
      if value[:player_name] == player_name 
        shoe = value[:shoe]
      end
    end 
  end 
  shoe 
end

def team_colors(team_name)
  colors = []
  game_hash.each do |home, hash|
    if hash[:team_name] == team_name 
      colors = hash[:colors]
    end
  end
  colors
end

def team_names
  name = []
  game_hash.each do |home, hash|
    name << hash[:team_name]
  end 
  name
end 

def player_numbers(team_name)
  jersey = []
  game_hash.each do |home, hash|
    if hash[:team_name] == team_name 
      hash[:players].each do |value|
        jersey << value[:number]
      end 
    end 
  end 
  jersey
end 

def player_stats(player_name)
  stats = {}
  game_hash.each do |home, hash|
    hash[:players].each do |value|
      if value[:player_name] == player_name 
        stats = value 
      end
    end
  end
  stats 
end

def big_shoe_rebounds 
  shoe_array = []
  rebounds = 0
  game_hash.each do |home, hash|
    hash[:players].each do |value|
      shoe_array << value[:shoe]
      shoe_array = shoe_array.sort 
      if shoe_array[shoe_array.length - 1] == value[:shoe]
        rebounds = value[:rebounds]
      end 
    end 
  end
  rebounds 
end

def most_points_scored
  points_array = []
  points = 0 
  game_hash.each do |home, hash|
    hash[:players].each do |value|
      points_array << value[:points]
      points_array = points_array.sort 
      if points_array[points_array.length - 1] == value[:points]
        points = value[:player_name]
      end 
    end
  end
  points 
end

def winning_team
  points_sum_h = 0
  points_sum_a = 0 
  i = 0 
  while i < game_hash[:home][:players].length || i < game_hash[:away][:players].length
    if game_hash[:home]
      points_sum_h += game_hash[:home][:players][i][:points]
    elsif game_hash[:away]
      points_sum_a += game_hash[:away][:players][i][:points]
    end 
    i += 1 
  end 
  if points_sum_h > points_sum_a 
    game_hash[:home][:team_name]
  elsif points_sum_h < points_sum_a 
    game_hash[:away][:team_name]
  end 
end 

def player_with_longest_name
  name_length = []
  name = ""
  game_hash.each do |home, hash|
    hash[:players].each do |value|
      name_length << value[:player_name].length 
      name_length = name_length.sort 
      if name_length[name_length.length - 1] == value[:player_name].length 
        name = value[:player_name]
      end
    end
  end
  name 
end

def long_name_steals_a_ton
  name_most_steals = ""
  steals = []
  game_hash.each do |home, hash|
    hash[:players].each do |value|
      steals << value[:steals]
      steals = steals.sort
      if steals[steals.length - 1] == value[:steals]
        name_most_steals = value[:player_name]
      end 
    end 
  end
  if player_with_longest_name == name_most_steals
    true 
  end 
end