class DonationBagsController < ApplicationController
  before_action :set_donation_bag, only: [:show, :edit, :update, :destroy]

  # GET /donation_bags
  # GET /donation_bags.json
  def index
    @donation_bags = DonationBag.all
  end

  # GET /donation_bags/1
  # GET /donation_bags/1.json
  def show
  end

  # GET /donation_bags/new
  def new
    @donation_bag = DonationBag.new
  end

  # GET /donation_bags/1/edit
  def edit
  end

  # POST /donation_bags
  # POST /donation_bags.json
  def create
    @donation_bag = DonationBag.new(donation_bag_params)

    @donation_bag.user_id = current_user.id
    respond_to do |format|
      if @donation_bag.save
        format.html { redirect_to pages_donate_path, notice: 'Donation bag was successfully created.' }
        format.json { render :show, status: :created, location: @donation_bag }
      else
        format.html { render :new }
        format.json { render json: @donation_bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donation_bags/1
  # PATCH/PUT /donation_bags/1.json
  def update
    respond_to do |format|
      if @donation_bag.update(donation_bag_params)
        format.html { redirect_to @donation_bag, notice: 'Donation bag was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation_bag }
      else
        format.html { render :edit }
        format.json { render json: @donation_bag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donation_bags/1
  # DELETE /donation_bags/1.json
  def destroy
    @donation_bag.destroy
    respond_to do |format|
      format.html { redirect_to donation_bags_url, notice: 'Donation bag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation_bag
      @donation_bag = DonationBag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_bag_params
      params.require(:donation_bag).permit(:user_id, :bag_status_id, :total_quantity)
    end
end
