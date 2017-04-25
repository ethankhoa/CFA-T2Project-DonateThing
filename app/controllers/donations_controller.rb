class DonationsController < ApplicationController
    before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)
    @donation_bag = DonationBag.find(params[:id])
  end

  def donations
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

end
