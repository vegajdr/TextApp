class PhoneNumbersController < ApplicationController

  def create
    phone = Digest::SHA256.digest(params[:user][:phone_numbers])

    current_user.phone_numbers.first_or_create!(phone_number: phone)
    redirect_to '/phone_registration', notice: "Phone number has been registered to your account"
  end

end
