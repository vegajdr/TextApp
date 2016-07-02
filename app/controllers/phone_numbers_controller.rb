class PhoneNumbersController < ApplicationController

  def create
    number_input = params[:user][:phone_numbers]
    parsed_number = number_input.gsub(/\D/, "")

    if parsed_number.length != 10
      flash[:alert] = "Please enter a valid phone number"
      redirect_to '/phone_registration'
    else

      phone = Digest::SHA256.digest(parsed_number)

      current_user.phone_numbers.first_or_create!(phone_number: phone, raw_phone_number: "+1#{number_input}")
      redirect_to '/phone_registration', notice: "Phone number has been registered to your account"
    end
  end

end
