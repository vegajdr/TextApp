class PhoneNumber < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :phone_number
  validates_uniqueness_of :raw_phone_number, scope: :user_id


end
