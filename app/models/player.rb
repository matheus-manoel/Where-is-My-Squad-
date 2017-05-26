class Player < ApplicationRecord
  validates :nick, presence: true, length: { maximum: 20 }
  validates :description, length: { maximum: 275 }
  validates :server, presence: true, if: :server_exists?
  #validates :steam_link, url: true

  def server_exists?
    ['NA', 'SA', 'EU'].include? server
  end

end
