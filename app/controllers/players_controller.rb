class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players
  # GET /players.json
  def index
    @players = Player.all.order(created_at: :desc)
  end

  def NA
    @players = Player.NA
    render action: :index
  end

  def EU
    @players = Player.EU
    render action: :index
  end

  def SA
    @players = Player.SA
    render action: :index
  end

  def AS
    @players = Player.AS
    render action: :index
  end

  def OC
    @players = Player.OC
    render action: :index
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to action: "index" and flash[:success] = 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
=begin
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player, notice: 'Player was successfully updated.' }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end
=end

  # DELETE /players/1
  # DELETE /players/1.json
=begin
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:steam_link, :nick, :description, :server)
    end
end
