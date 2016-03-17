class BookingsController < ApplicationController

  def index
    @bookings = Booking.all

    render json: @bookings.as_json(methods: :username)
  end

  def create
    @booking = current_user.bookings.build(booking_params)

    if @booking.save
      render json: @booking.as_json(methods: :username)
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = current_user.bookings.find(params[:id])

    @booking.destroy

    head :ok
  end


  protected

    def booking_params
      params.require(:booking).permit(:booked_since, :booked_until)
    end

end
