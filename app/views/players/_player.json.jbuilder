json.extract! player, :id, :steam_link, :nick, :description, :server, :created_at, :updated_at
json.url player_url(player, format: :json)
