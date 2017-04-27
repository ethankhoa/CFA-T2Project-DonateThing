class DonationsController < ApplicationController
    before_action :set_donation, only: [:show, :edit, :update, :destroy]
    before_action :set_current_user, only: [:create, :new, :destroy, :update, :index]

  def new
    @donation = Donation.new
    # @donation_bag = DonationBag.find(params[:id])
    @donation_bags_inprogress = DonationBag.where(:user => current_user, :bag_status => 1)
    @donation_bag = @donation_bags_inprogress.first
    @orgs = Org.all
    @donation_statuses = DonationStatus.all
  end

  def create
    @donation = Donation.new(donation_params)
    format.html { redirect_to @donation, notice: 'Your was successfully created.' }
    format.json { render :show, status: :created, location: @donation }

  end

  def donations
  end

  def index
    @donations = Donation.where(:user => current_user)
  end

  def show
  end

  def update
    respond_to do |format|
      if @donation.update(booking_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :show }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    params.require(:donation).permit(:user_id, :donation_status_id, :donation_bag_id, :org_id)
  end


  def set_current_user
    @user = current_user
  end

end
