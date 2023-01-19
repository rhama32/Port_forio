class Doctor::ReservationsController < ApplicationController

 def index
  @reservations = Reservation.all
 end

 def show
  @reservation = Reservation.find(params[:id])
  @admin_customer = Customer.find(params[:id])
  @hospital = Hospital.find(params[:id])
 end

 def edit
 end

 def update
  @reservation = Reservation.find(params[:id])
  if @reservation.update(admin_reservation_params)
   flash[:notice] = "情報の変更が完了しました."
   redirect_to admin_reservation_path
  else
   flash[:alret] = "変更の保存に失敗しました"
  end
 end

    def reservation_params
    params.require(:reservation).permit(:status_method)
  end
end