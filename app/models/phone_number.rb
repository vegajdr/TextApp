class PhoneNumber < ActiveRecord::Base
  belongs_to :user

  validates :phone_number, length: { minimum: 9 }

  validates_presence_of :phone_number
end
