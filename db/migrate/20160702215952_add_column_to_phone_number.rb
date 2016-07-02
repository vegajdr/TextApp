class AddColumnToPhoneNumber < ActiveRecord::Migration
  def change
    add_column :phone_numbers, :raw_phone_number, :string
  end
end
