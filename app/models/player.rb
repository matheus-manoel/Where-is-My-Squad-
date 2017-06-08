class Player < ApplicationRecord
  validates :nick, presence: true, length: { maximum: 20 }
  validates :description, length: { maximum: 275 }
  validates :server, presence: true, length: { maximum: 2 }#, if: :server_exists?
  VALID_URL_REGEX = /\Ahttps?:\/\/(www\.)?steamcommunity.com.*\z/i
  validates :steam_link, presence: true, length: { maximum: 255 },
                         format: { with: VALID_URL_REGEX },
                         uniqueness: { case_sensitive: false }

  scope :NA, -> { where(server: 'NA')}
  scope :EU, -> { where(server: 'EU')}
  scope :SA, -> { where(server: 'SA')}
  scope :AS, -> { where(server: 'AS')}
  scope :OC, -> { where(server: 'OC')}

  def server_exists?
    ['NA', 'SA', 'EU', 'AS', 'OC'].include? self[:server]
  end

end
