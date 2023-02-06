class Public::HospitalDoctorsController < ApplicationController
 before_action :authenticate_customer!
 
 def index
   @hospital = Hospital.find(params[:hospital_id])
   @hospital_doctors = @hospital.doctors
 end
 
 def show
  @hospital_doctor = Doctor.find(params[:id])
  @hospital = Hospital.find_by(id: @hospital_doctor.hospital_id)
 end
 
end
